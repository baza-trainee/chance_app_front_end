import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoName extends  StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      SvgPicture.asset("assets/logo.svg",width: 78,height: 78,),
      const Text(
        "Chance app",
        style: TextStyle(
            fontSize: 38,
            fontFamily: "TiroBangla",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: Color(0xffC18E3B)),
      ),
    ],);
  }
}
