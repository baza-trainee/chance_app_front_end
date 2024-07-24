import 'dart:async';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/room_cubit/room_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/chat_bubble_widget.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final RoomCubit _cubit = context.read<RoomCubit>();
  final TextEditingController _controller = TextEditingController();
  late final Stream<List<types.Message>> _messagesStream =
      ChatHelper.messages(_cubit.room);

  @override
  void initState() {
    super.initState();
    ChatHelper.updateLastMessageToSeen(_cubit.room.id);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        ChatHelper.updateLastMessageToSeen(_cubit.room.id);
      },
      child: GestureDetector(
        onTap: () => _unFocus(context),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: BlocBuilder<RoomCubit, types.Room>(
              builder: (context, room) {
                return AppBar(
                  title: Text(
                    room.name ??
                        room.users
                            .firstWhereOrNull((u) => u.id != ChatHelper.userId)
                            ?.fullName ??
                        '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      height: 28 / 22,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () => room.type == types.RoomType.group
                          ? _openGroupSettingsPage(context)
                          : _openChatSettingsPage(context),
                      icon: const Icon(
                        Icons.more_vert,
                        color: primary800,
                      ),
                      iconSize: 24.0,
                    )
                  ],
                );
              },
            ),
          ),
          body: Center(
            child: StreamBuilder<List<types.Message>>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Text(
                      AppLocalizations.instance.translate('NoMessages'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        height: 28 / 22,
                      ),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(16.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      types.Message message = snapshot.data![index];
                      if (message is types.TextMessage) {
                        return ChatBubbleWidget(message: message);
                      }
                      return const SizedBox();
                    },
                  );
                }

                return Text(
                  AppLocalizations.instance.translate('error'),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    height: 28 / 22,
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: _buildMessageTextField(context),
        ),
      ),
    );
  }

  Widget _buildMessageTextField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: darkNeutral800,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      child: SafeArea(
        child: TextField(
          controller: _controller,
          textInputAction: TextInputAction.send,
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
            height: 22 / 17,
            letterSpacing: -0.4,
            color: primary1000,
          ),
          onEditingComplete: _onSendBtnTap,
          decoration: InputDecoration(
            fillColor: background,
            filled: true,
            suffixIcon: IconButton(
              onPressed: _onSendBtnTap,
              icon: const Icon(
                Icons.send,
                color: primary1000,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            hintText: AppLocalizations.instance.translate("chatTextField"),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              height: 22 / 17,
              letterSpacing: -0.4,
              color: Color(0xFF8E8E93),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
      ),
    );
  }

  void _onSendBtnTap() {
    if (_controller.text.isNotEmpty) {
      ChatHelper.sendMessage(_controller.text, _cubit.room.id);
      _controller.clear();
    }
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();

  void _openChatSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed('/chat_settings', arguments: _cubit.room);

  void _openGroupSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed('/group_settings', arguments: _cubit);
}
