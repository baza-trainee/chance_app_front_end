import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;


class UserInputChip extends StatelessWidget {
  const UserInputChip({
    super.key,
    required this.value,
  });

  final types.User value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 4.0,
        ),
        decoration: const BoxDecoration(
          color: darkNeutral300,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Text(
          value.fullName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: darkNeutral1000,
            letterSpacing: 0.25,
          ),
        ),
      ),
    );
  }
}
