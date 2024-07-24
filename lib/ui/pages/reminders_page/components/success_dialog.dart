import 'package:chance_app/ui/constans.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.title,
    this.subtitle,
    super.key,
  });

  final Widget title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Icon(Icons.check)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTextStyle(
            style: const TextStyle(fontSize: 24, color: primaryText),
            textAlign: TextAlign.center,
            child: title,
          ),
          if (subtitle != null)
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.5,
                color: primaryText,
              ),
              textAlign: TextAlign.center,
              child: subtitle!,
            ),
        ],
      ),
    );
  }
}
