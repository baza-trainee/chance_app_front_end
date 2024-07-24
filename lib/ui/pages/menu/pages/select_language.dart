import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/menu/components/language_card.dart';
import 'package:chance_app/ux/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: Scaffold(
            backgroundColor: beigeBG,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppLocalizations.instance.translate("changeLanguage"),
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: languages.keys.map<Widget>((key) {
                return LanguageCard(
                    title: languages[key]!,
                    onTap: () async {
                      if (!isLoading) {
                        setState(() {
                          isLoading = true;
                        });
                        await Services()
                            .changeLanguage(key, context)
                            .whenComplete(() {
                          isLoading = false;
                          if (mounted) setState(() {});
                        });
                      }
                    });
              }).toList(),
            ),
          ),
        ),
        if (isLoading)
          Container(
            width: size.width,
            height: size.height,
            color: Colors.black26,
            child: const Center(
              child: CupertinoActivityIndicator(
                color: primary500,
                radius: 50,
              ),
            ),
          )
      ],
    );
  }
}
