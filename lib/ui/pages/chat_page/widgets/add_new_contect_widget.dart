import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddNewContactWidget extends StatelessWidget {
  const AddNewContactWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _onAddNewContactBtnTap(context),
      child: Row(
        children: [
          const Icon(
            Icons.add,
            size: 24.0,
            color: primary800,
          ),
          const SizedBox(width: 2.0),
          Text(
            AppLocalizations.instance.translate('addNewContact'),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 20 / 14,
              letterSpacing: 0.1,
              color: primary800,
            ),
          ),
        ],
      ),
    );
  }

  void _onAddNewContactBtnTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/add_contact');
}
