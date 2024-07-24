import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/extensions/chat_user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;


class UserCheckboxTile extends StatelessWidget {
  const UserCheckboxTile({
    super.key,
    this.onChanged,
    required this.isSelected,
    required this.value,
  });

  final bool isSelected;
  final types.User value;
  final ValueChanged<types.User>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: Checkbox(
            value: isSelected,
            onChanged: (_) => onChanged?.call(value),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            checkColor: darkNeutral800,
            activeColor: background,
            side: MaterialStateBorderSide.resolveWith(
              (_) => const BorderSide(
                color: darkNeutral800,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          value.fullName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: 0.5,
            color: darkNeutral1000,
          ),
        ),
      ],
    );
  }
}
