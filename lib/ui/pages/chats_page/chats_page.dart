import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chats_page/widgets/chat_tile.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.instance.translate('communication'),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            height: 28 / 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<List<types.Room>>(
          stream: ChatHelper.rooms,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Text(
                  AppLocalizations.instance.translate('NoChats'),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    height: 28 / 22,
                  ),
                );
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) => ChatTile(
                  room: snapshot.data![index],
                ),
                separatorBuilder: (_, __) => Divider(
                  thickness: 1.0,
                  height: 0.0,
                  color: Colors.black.withOpacity(.1),
                ),
              );
            }
            
            return Text(
              AppLocalizations.instance.translate('NoChats'),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                height: 28 / 22,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFloatingActionBtnTap(context),
        backgroundColor: primary900,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onFloatingActionBtnTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/create_chat');
}
