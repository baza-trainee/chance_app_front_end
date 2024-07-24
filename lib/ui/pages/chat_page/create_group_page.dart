import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key, required this.selectedUsers});

  final List<types.User> selectedUsers;

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _unFocus(context),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.instance.translate('newGroup'),
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
          child: Column(
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  height: 28 / 22,
                  color: primary800,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                  isDense: true,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Text(
                    widget.selectedUsers[index].fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                      letterSpacing: 0.5,
                      color: darkNeutral1000,
                    ),
                  ),
                  itemCount: widget.selectedUsers.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 16,
                      thickness: 1,
                      color: const Color(0xFFB1B3B7).withOpacity(.4),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            16.0,
            16.0,
            16.0,
            16.0 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 56.0,
            child: RoundedButton(
              color: primary1000,
              onPress: _controller.text.trim().isNotEmpty
                  ? () => _onCreateGroupBtnTap(context)
                  : null,
              child: Text(
                AppLocalizations.instance.translate('createGroup'),
                style: const TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: beige0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onCreateGroupBtnTap(BuildContext context) async {
    types.Room room = await ChatHelper.createGroupRoom(
      name: _controller.text.trim(),
      users: widget.selectedUsers,
    );

    if (!context.mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/chat',
      ModalRoute.withName('/chats'),
      arguments: room,
    );
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();
}
