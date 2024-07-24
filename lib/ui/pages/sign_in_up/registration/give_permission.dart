import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GivePermission extends StatefulWidget {
  const GivePermission({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<GivePermission> createState() => _GivePermissionState();
}

class _GivePermissionState extends State<GivePermission> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: SvgPicture.asset(
                "assets/icons/checkbox_${state.isUserGrantPermissionForProcessingPersonalData ? "checked" : "empty"}.svg"),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    AppLocalizations.instance.translate("iGivePermission"),
                    style: const TextStyle(color: primaryText),
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                    height: 24,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/privacy_policy");
                      },
                      child: Text(
                        AppLocalizations.instance.translate("privacyPolicy"),
                        style: const TextStyle(color: primary700),
                      ),
                    )),
              ],
            ),
          ),
        ],
      );
    });
  }
}
