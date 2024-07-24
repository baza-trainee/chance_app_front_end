import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/chat_user_tile.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:chance_app/ux/helpers/chat_map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class NewChatPage extends StatefulWidget {
  const NewChatPage({super.key});

  @override
  State<NewChatPage> createState() => _NewChatPageState();
}

class _NewChatPageState extends State<NewChatPage> {
  final Stream<List<types.User>> _stream = ChatHelper.users;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.instance.translate('newChat'),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                height: 28 / 22,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: () => _onTextFieldTap(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.instance.translate('searchContact'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0.5,
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        color: Color(0xFFD9D9D9),
                      ),
                    ],
                  ),
                ),
              ),
              // Не потрібні поки
              //const AddNewContactWidget(),
              Expanded(
                child: Center(
                  child: StreamBuilder<List<types.User>>(
                    stream: _stream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        return ListView(
                          children: ChatMapUtils.generateSortMap(snapshot.data!)
                              .entries
                              .map(_buildSortedList)
                              .toList(),
                        );
                      }

                      return Text(
                        AppLocalizations.instance.translate('NoData'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          height: 28 / 22,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
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

  Widget _buildSortedList(MapEntry<String, List<types.User>> entry) {
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

    print(room);

    if (!context.mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/chat',
      ModalRoute.withName('/chats'),
      arguments: room,
    );
  }

  void _onTextFieldTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/search_chat');
}
