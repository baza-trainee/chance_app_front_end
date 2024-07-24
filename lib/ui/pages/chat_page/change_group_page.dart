import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/room_cubit/room_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/accept_dialog.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/admin_widget.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/custom_dialog.dart';
import 'package:chance_app/ui/pages/reminders_page/components/labeled_text_field.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:collection/collection.dart';

class ChangeGroupPage extends StatefulWidget {
  const ChangeGroupPage({super.key});

  @override
  State<ChangeGroupPage> createState() => _ChangeGroupPageState();
}

class _ChangeGroupPageState extends State<ChangeGroupPage> {
  late final RoomCubit _cubit = context.read<RoomCubit>();
  late final TextEditingController _controller = TextEditingController(
    text: _cubit.state.name,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, types.Room>(
      builder: (context, room) {
        types.User? admin = _getAdmin(room.users);

        return GestureDetector(
          onTap: () => _unFocus(context),
          behavior: HitTestBehavior.translucent,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.instance.translate('settingsGroup'),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    backgroundImage: room.imageUrl != null
                        ? NetworkImage(room.imageUrl!)
                        : null,
                    radius: 40.0,
                    backgroundColor: darkNeutral300,
                    child: room.imageUrl == null
                        ? Text(
                            room.name != null && room.name!.isNotEmpty
                                ? room.name![0]
                                : '',
                            style: const TextStyle(
                              fontSize: 32,
                              height: 40 / 32,
                              color: primary1000,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 24.0),
                  LabeledTextField(
                    controller: _controller,
                    label: AppLocalizations.instance.translate('labelName'),
                    hintText: AppLocalizations.instance.translate('name'),
                    isPhone: false,
                    onChanged: (value) {
                      setState(() {});
                    },
                    key: const ValueKey("name"),
                    prefixText: '',
                  ),
                  const SizedBox(height: 60.0),
                  if (admin != null) ...[
                    AdminWidget(admin: admin),
                    const SizedBox(height: 24.0),
                  ],
                  Expanded(
                    child: _buildUsersList(room),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 48.0,
                    child: RoundedButton(
                      color: primary1000,
                      onPress: _controller.text.trim().isNotEmpty &&
                              _controller.text.trim() != room.name
                          ? () => _updateRoom(context, room)
                          : null,
                      child: Text(
                        AppLocalizations.instance.translate('ready'),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: primary50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: 48.0,
                    child: RoundedButton(
                      color: red900,
                      child: Text(
                        AppLocalizations.instance
                            .translate('leaveAndDeleteGroup'),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: primary50,
                        ),
                      ),
                      onPress: () => _deleteGroup(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ListView _buildUsersList(types.Room room) {
    List<types.User> usersWithoutAdmin = _getListWithoutAdmin(room.users);

    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              usersWithoutAdmin[index].fullName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: darkNeutral1000,
              ),
            ),
            GestureDetector(
              onTap: () => _removeUser(context, room, usersWithoutAdmin[index]),
              child: Text(
                AppLocalizations.instance.translate('delete'),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: 0.25,
                  color: red900,
                ),
              ),
            ),
          ],
        );
      },
      itemCount: usersWithoutAdmin.length,
      separatorBuilder: (_, __) {
        return Divider(
          height: 16,
          thickness: 1,
          color: const Color(0xFFB1B3B7).withOpacity(.4),
        );
      },
    );
  }

  List<types.User> _getListWithoutAdmin(List<types.User> users) =>
      users.where((u) => u.role != types.Role.admin).toList();

  types.User? _getAdmin(List<types.User> users) =>
      users.firstWhereOrNull((u) => u.role == types.Role.admin);

  void _deleteGroup(BuildContext context) async {
    RoomCubit cubit = context.read<RoomCubit>();

    bool? value = await CustomDialog.show<bool?>(
      context: context,
      title: AppLocalizations.instance.translate('leaveAndDeleteDialog'),
    );
    if (value == true) {
      await ChatHelper.deleteRoom(cubit.room.id);

      if (!context.mounted) return;

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/chats', ModalRoute.withName('/'));
    }
  }

  void _removeUser(
      BuildContext context, types.Room room, types.User user) async {
    bool? value = await CustomDialog.show<bool?>(
      context: context,
      title: AppLocalizations.instance.translate('deleteUserDialog'),
      actionText: AppLocalizations.instance.translate('delete'),
    );
    if (value == true) {
      List<types.User> users = List.from(room.users);

      users.removeWhere((u) => u.id == user.id);

      if (!context.mounted) return;

      context.read<RoomCubit>().updateRoom(room.copyWith(users: users));

      if (!context.mounted) return;

      await AcceptDialog.show(context);

      if (!context.mounted) return;

      _unFocus(context);
    }
  }

  Future<void> _updateRoom(BuildContext context, types.Room room) async {
    context
        .read<RoomCubit>()
        .updateRoom(room.copyWith(name: _controller.text.trim()));

    if (!context.mounted) return;

    await AcceptDialog.show(context);

    if (!context.mounted) return;

    _unFocus(context);
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();
}
