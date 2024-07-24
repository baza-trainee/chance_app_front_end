import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? cancelText ,
    String? actionText ,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: beige100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 24 / 16,
                    letterSpacing: 0.5,
                    color: darkNeutral1000,
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        cancelText ?? AppLocalizations.instance.translate('cancel'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0.15,
                          color: primary700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(
                        actionText ?? AppLocalizations.instance.translate('leave'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0.15,
                          color: primary700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
