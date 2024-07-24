import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/search_cubit/search_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/chat_search_field.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/chat_user_tile.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:chance_app/ux/helpers/chat_map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class SearchChatPage extends StatefulWidget {
  const SearchChatPage({super.key});

  @override
  State<SearchChatPage> createState() => _SearchChatPageState();
}

class _SearchChatPageState extends State<SearchChatPage> {
  final Stream<List<types.User>> _stream = ChatHelper.users;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<List<types.User>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Text(
                      AppLocalizations.instance.translate("NoData"),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        color: darkNeutral1000,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                );
              }
              return BlocProvider(
                create: (_) => SearchCubit(snapshot.data!),
                child: GestureDetector(
                  onTap: () => _unFocus(context),
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: Row(
                        children: [
                          const Flexible(
                            child: ChatSearchField(),
                          ),
                          const SizedBox(width: 16.0),
                          TextButton(
                            onPressed: () => _onCloseSearchPage(context),
                            child: Text(
                              AppLocalizations.instance.translate('cancel'),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 24 / 16,
                                color: darkNeutral1000,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: BlocBuilder<SearchCubit, List<types.User>>(
                      builder: (context, state) {
                        if (state.isEmpty) {
                          return ListView(
                            padding: const EdgeInsets.only(top: 24.0),
                            children:
                                ChatMapUtils.generateSortMap(snapshot.data!)
                                    .entries
                                    .map((v) => _buildSortedList(context, v))
                                    .toList(),
                          );
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 16.0,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => _openChat(context, state[index]),
                            child: ChatUserTile(user: state[index]),
                          ),
                          itemCount: state.length,
                        );
                      },
                    ),
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  AppLocalizations.instance.translate('NoData'),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    height: 28 / 22,
                  ),
                ),
              ),
            );
          },
        ),
        if (_loading)
          Container(
            color: primary1000.withOpacity(.5),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          )
      ],
    );
  }

  Widget _buildSortedList(
    BuildContext context,
    MapEntry<String, List<types.User>> entry,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: darkNeutral300,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            entry.key,
            style: const TextStyle(
              fontSize: 14,
              height: 20 / 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: entry.value
                .map((user) => GestureDetector(
                      onTap: () => _openChat(context, user),
                      child: ChatUserTile(user: user),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  void _openChat(BuildContext context, types.User user) async {
    setState(() {
      _loading = true;
    });

    final room = await ChatHelper.createRoom(user);

    if (!context.mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/chat',
      ModalRoute.withName('/chats'),
      arguments: room,
    );
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();

  void _onCloseSearchPage(BuildContext context) => Navigator.of(context).pop();
}
