import 'package:chance_app/ui/constans.dart';
import 'package:flutter/material.dart';

class InputMyInfoLayout extends StatelessWidget {
  const InputMyInfoLayout({required super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: primaryText),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              border: Border.all(color: beige300),
              borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
            enabled: false,
            style: const TextStyle(fontSize: 16, color: primaryText),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: TextEditingController(text: text),
          ),
        ),
      ],
    );
  }
}
