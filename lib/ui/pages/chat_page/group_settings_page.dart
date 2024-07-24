import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/room_cubit/room_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/accept_dialog.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/add_new_contect_widget.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/admin_widget.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/custom_dialog.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:collection/collection.dart';

class GroupSettingsPage extends StatefulWidget {
  const GroupSettingsPage({super.key});

  @override
  State<GroupSettingsPage> createState() => _GroupSettingsPageState();
}

class _GroupSettingsPageState extends State<GroupSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, types.Room>(
      builder: (context, room) {
        types.User? admin = _getAdmin(room.users);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.instance.translate('aGroup'),
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
                  if (room.name != null)
                    Text(
                      room.name ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        height: 28 / 22,
                        color: Color(0xff212833),
                      ),
                    ),
                  Text(
                    '${room.users.length} контакти',
                    style: const TextStyle(
                        fontSize: 12, height: 16 / 12, color: darkNeutral400),
                  ),
                  const SizedBox(height: 60.0),
                  if (admin != null) ...[
                    AddNewContactWidget(
                      onTap: () => _openAddContactPage(context),
                    ),
                    const SizedBox(height: 16.0),
                    AdminWidget(admin: admin),
                    const SizedBox(height: 24.0),
                  ],
                  Expanded(
                    child: _buildUsersList(room),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: admin?.id == ChatHelper.userId
                ? SizedBox(
                    height: 48.0,
                    child: RoundedButton(
                      color: Colors.transparent,
                      border: Border.all(
                        color: darkNeutral800,
                      ),
                      child: Text(
                        AppLocalizations.instance.translate('toChange'),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: darkNeutral800,
                        ),
                      ),
                      onPress: () => _openChangeGroupPage(context),
                    ),
                  )
                : SizedBox(
                    height: 48.0,
                    child: RoundedButton(
                      color: red900,
                      child: Text(
                        AppLocalizations.instance.translate('leaveGroup'),
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
      },
    );
  }

  ListView _buildUsersList(types.Room room) {
    List<types.User> usersWithoutAdmin = _getListWithoutAdmin(room.users);

    return ListView.separated(
      itemBuilder: (context, index) => Text(
        usersWithoutAdmin[index].fullName,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.5,
          color: darkNeutral1000,
        ),
      ),
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

  types.User _getMe(List<types.User> users) =>
      users.firstWhere((u) => u.id == ChatHelper.userId);

  void _openChangeGroupPage(BuildContext context) async {
    RoomCubit cubit = context.read<RoomCubit>();
    types.Room? result = await Navigator.of(context)
        .pushNamed('/change_group', arguments: cubit) as types.Room?;

    if (result != null) {
      cubit.updateRoom(result);
    }
  }

  void _leaveGroup(BuildContext context) async {
    RoomCubit cubit = context.read<RoomCubit>();
    bool? value = await CustomDialog.show<bool?>(
        context: context,
        title: AppLocalizations.instance.translate('leaveGroupDialog'));
    if (value == true) {
      List<types.User> users = List.from(cubit.state.users);
      types.User me = _getMe(users);
      users.remove(me);

      cubit.updateRoom(cubit.state.copyWith(users: users));

      if (!context.mounted) return;

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/chats', ModalRoute.withName('/'));
    }
  }

  void _openAddContactPage(BuildContext context) async {
    RoomCubit cubit = context.read<RoomCubit>();

    List<types.User>? users = await Navigator.of(context)
        .pushNamed('/new_group', arguments: cubit.state) as List<types.User>?;

    if (users != null) {
      cubit.updateRoom(cubit.state.copyWith(users: users));

      if (!context.mounted) return;

      AcceptDialog.show(context);
    }
  }
}
