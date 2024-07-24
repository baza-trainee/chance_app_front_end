import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/custom_dialog.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatSettingsPage extends StatelessWidget {
  const ChatSettingsPage({super.key, required this.room});

  final types.Room room;

  @override
  Widget build(BuildContext context) {
    String roomName = room.name ??
        room.users
            .firstWhereOrNull((u) => u.id != ChatHelper.userId)
            ?.fullName ??
        '-';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.instance.translate('contact'),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            height: 28 / 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 16.0,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage:
                    room.imageUrl != null ? NetworkImage(room.imageUrl!) : null,
                radius: 64.0,
                backgroundColor: darkNeutral300,
                child: room.imageUrl == null
                    ? Text(
                        roomName.isNotEmpty ? roomName[0] : '',
                        style: const TextStyle(
                          fontSize: 32,
                          height: 40 / 32,
                          color: primary1000,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 32.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: darkNeutral300,
                ),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.instance.translate('name'),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 20 / 14,
                        color: darkNeutral1000,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      roomName,
                      style: const TextStyle(
                        fontSize: 24,
                        height: 32 / 24,
                        color: darkNeutral1000,
                      ),
                    ),
                    Divider(
                      height: 16.0,
                      color: darkNeutral1000.withOpacity(.1),
                    ),
                    Text(
                      AppLocalizations.instance.translate('phoneNumber'),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 20 / 14,
                        color: darkNeutral1000,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      room.metadata != null
                          ? room.metadata!['phone'] ?? '-'
                          : '-',
                      style: const TextStyle(
                        fontSize: 24,
                        height: 32 / 24,
                        color: darkNeutral1000,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 48.0,
          child: RoundedButton(
            color: red900,
            child: Text(
              AppLocalizations.instance.translate('leaveChat'),
              style: const TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: primary50,
              ),
            ),
            onPress: () => _leaveGroup(context),
          ),
        ),
      ),
    );
  }

  types.User _getMe(List<types.User> users) =>
      users.firstWhere((u) => u.id == ChatHelper.userId);

  void _leaveGroup(BuildContext context) async {
    bool? value = await CustomDialog.show<bool?>(
        context: context,
        title: AppLocalizations.instance.translate('leaveChatDialog'));
    if (value == true) {
      List<types.User> users = List.from(room.users);
      types.User me = _getMe(users);
      users.remove(me);

      ChatHelper.updateRoom(room.copyWith(users: users));

      if (!context.mounted) return;

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/chats', ModalRoute.withName('/'));
    }
  }
}
