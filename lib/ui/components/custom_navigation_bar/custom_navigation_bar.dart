import 'package:chance_app/ui/components/custom_navigation_bar/button_main.dart';
import 'package:chance_app/ui/components/custom_navigation_bar/button_more.dart';
import 'package:chance_app/ui/components/custom_navigation_bar/custom_navigation_bar_paint.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends  StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width * 0.9,
      height: size.height / 10,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomPaint(
              size: Size(size.width * 0.9, size.height / 10),
              painter: CustomNavigationBarPaint(),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            height: size.height / 10,
            child: const Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonMain(),
                  ButtonMore()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
