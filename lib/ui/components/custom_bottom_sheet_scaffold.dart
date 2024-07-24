import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetScaffold extends StatelessWidget {
  const CustomBottomSheetScaffold({
    this.title,
    required this.body,
    this.onOKPressed,
    this.onCancelPressed,
    super.key,
  });

  final Widget? title;
  final Widget body;
  final VoidCallback? onOKPressed;
  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 2.2,
      decoration: const BoxDecoration(
        color: beige100,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (title != null)
              DefaultTextStyle(
                style: const TextStyle(fontSize: 24, color: primaryText),
                child: title!,
              ),
            Expanded(child: body),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onCancelPressed ?? Navigator.maybeOf(context)?.pop,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      AppLocalizations.instance.translate("cancel"),
                      style: const TextStyle(fontSize: 22, color: primary700),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: onOKPressed,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 22, color: primary700),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
