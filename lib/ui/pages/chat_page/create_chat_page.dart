import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CreateChatPage extends StatelessWidget {
  const CreateChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.instance.translate('create'),
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
            RoundedButton(
              height: 44.0,
              color: primary1000,
              child:  Text(
                AppLocalizations.instance.translate('createNewGroup'),
                style: const TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: beige0,
                ),
              ),
              onPress: () => _onCreateGroupBtnTap(context),
            ),
            const SizedBox(height: 16.0),
            RoundedButton(
              height: 44.0,
              color: primary1000,
              child:  Text(
                AppLocalizations.instance.translate('createNewChat'),
                style: const TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: beige0,
                ),
              ),
              onPress: () => _onCreateChatBtnTap(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onCreateGroupBtnTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/new_group');

  void _onCreateChatBtnTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/new_chat');
}
