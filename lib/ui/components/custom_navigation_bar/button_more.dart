import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonMore extends StatelessWidget {
  const ButtonMore({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed("/menu");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/icons/dots_icon.svg",
            semanticsLabel: 'Acme Logo',color: primary50,),
          Text(
            AppLocalizations.instance.translate("more"),
            style: const TextStyle(fontSize: 16, color: primary50),
          )
        ],
      ),
    );
  }
}
