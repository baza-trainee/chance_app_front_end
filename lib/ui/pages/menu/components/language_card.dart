import 'package:chance_app/ui/constans.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: primary50,
              borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16,color: primaryText),
            ),
            const Spacer(),
             const Icon(
              Icons.arrow_forward,
              size: 30,
               color: darkNeutral600,
            ),
            const SizedBox(
              width: 10,
            ),
          ])),
    );
  }
}
