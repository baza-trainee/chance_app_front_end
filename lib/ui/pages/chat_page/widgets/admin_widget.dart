import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class AdminWidget extends StatelessWidget {
  const AdminWidget({
    super.key,
    required this.admin,
  });

  final types.User admin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              admin.fullName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: darkNeutral1000,
              ),
            ),
            Text(
              AppLocalizations.instance.translate('admin'),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0.25,
                color: primary800,
              ),
            ),
          ],
        ),
        Divider(
          height: 16,
          thickness: 1,
          color: const Color(0xFFB1B3B7).withOpacity(.4),
        )
      ],
    );
  }
}
