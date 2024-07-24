import 'package:chance_app/resources/app_icons.dart';
import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/add_medicine_bloc/add_medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMedicinePageScaffold extends StatelessWidget {
  const AddMedicinePageScaffold({
    required this.middleText,
    required this.child,
    super.key,
  });

  final Widget middleText;
  final Widget child;

  Future<bool?> _onDidPop(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.pillsSmall,
                height: 64,
                color: beige500,
              ),
              const SizedBox(height: 8),
              Text(AppLocalizations.instance.translate("youHaveUnsavedData"),
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              RoundedButton(
                onPress: () => Navigator.of(context).pop(false),
                color: primary1000,
                child:  Text(
                  AppLocalizations.instance.translate("continue"),
                  style: const TextStyle(color: primary50, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child:  Text(AppLocalizations.instance.translate("complete")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeIsFirst = ModalRoute.of(context)!.isFirst;
    final addMedicineProgress = context.read<AddMedicineBloc>().state.progress;

    return PopScope(
      canPop: !routeIsFirst,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        if (addMedicineProgress != 0) {
          final willPop = await _onDidPop(context) ?? false;
          if (!willPop || !context.mounted) return;
        }
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: routeIsFirst ? const CloseButton() : const BackButton(),
          title: BlocSelector<AddMedicineBloc, AddMedicineState, String>(
            selector: (state) => state.name,
            builder: (context, medicineName) => Text(medicineName),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          forceMaterialTransparency: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              bottom: false,
              child: SizedBox(
                height: 220,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          AppIcons.pillsSmall,
                          height: 64,
                          color: beige500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 22,
                            color: Color(0xFF212833),
                          ),
                          textAlign: TextAlign.center,
                          child: middleText,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: LinearProgressIndicator(
                          value: addMedicineProgress,
                          color: darkNeutral600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: darkNeutral600,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
