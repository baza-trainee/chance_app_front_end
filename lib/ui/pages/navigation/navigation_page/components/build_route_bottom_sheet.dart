import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/select_place.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuildRouteBottomSheet extends StatefulWidget {
  const BuildRouteBottomSheet({super.key});

  @override
  State<BuildRouteBottomSheet> createState() => _BuildRouteBottomSheetState();
}

class _BuildRouteBottomSheetState extends State<BuildRouteBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedButton(
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => const SelectPlace(
                                pickResultFor: PickResultFor.first,
                              )))
                      .whenComplete(() => setState(() {}));
                },
                border: Border.all(
                  color: darkNeutral800,
                ),
                height: 0,
                color: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: primaryText,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      state.firstPickResult?.formattedAddress ??
                          AppLocalizations.instance.translate("addDeparturePoint"),
                      style: const TextStyle(color: primaryText, fontSize: 16),
                      maxLines: 5,
                    )),
                  ],
                )),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
                height: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => const SelectPlace(
                                pickResultFor: PickResultFor.second,
                              )))
                      .whenComplete(() => setState(() {}));
                },
                border: Border.all(
                  color: darkNeutral800,
                ),
                color: Colors.transparent,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: primaryText,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      state.secondPickResult?.formattedAddress ??
                          AppLocalizations.instance.translate("addDeparturePoint"),
                      style: const TextStyle(color: primaryText, fontSize: 16),
                      maxLines: 5,
                    )),
                  ],
                )),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
                onPress: () async {
                  if (state.firstPickResult != null &&
                      state.secondPickResult != null) {
                    context.read<NavigationBloc>().add(BuildRoute());
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(
                        msg: AppLocalizations.instance.translate("chooseDifferentEndpoint"),
                        toastLength: Toast.LENGTH_LONG);
                  }
                },
                color: state.firstPickResult != null &&
                        state.secondPickResult != null
                    ? primary1000
                    : darkNeutral400,
                child: Text(
                  AppLocalizations.instance.translate("buildRoute"),
                  style: const TextStyle(color: primary50, fontSize: 16),
                )),
          ],
        ),
      );
    });
  }
}
