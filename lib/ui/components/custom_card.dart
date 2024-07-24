import 'package:chance_app/ui/constans.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.width,
      required this.margin,
      required this.onPress});

  final Widget icon, text;
  final double width;
  final EdgeInsets margin;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPress,
        child: Container(
          height: 100,
          width: width,
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 8, right: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: beige500)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [icon, text],
          ),
        ),
      ),
    );
  }
}
