import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/my_wards/components/my_guardians.dart';
import 'package:chance_app/ui/pages/navigation/my_wards/components/my_wards.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/invitation_bloc/invitation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WardOrGuardians { ward, guardians }

class MyWardsGuardians extends StatefulWidget {
  const MyWardsGuardians({super.key});

  @override
  State<MyWardsGuardians> createState() => _MyWardsGuardiansState();
}

class _MyWardsGuardiansState extends State<MyWardsGuardians> {
  @override
  void initState() {
    BlocProvider.of<InvitationBloc>(context).add(LoadMyWards());

    super.initState();
  }

  final tabs = {
    WardOrGuardians.ward: AppLocalizations.instance.translate("wards"),
    WardOrGuardians.guardians: AppLocalizations.instance.translate("guardians"),
  };

  WardOrGuardians _selectedTab = WardOrGuardians.ward;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: beigeBG,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.instance.translate("myWards")),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: beige300),
                ),
                position: DecorationPosition.foreground,
                child: CupertinoSlidingSegmentedControl(
                  backgroundColor: beige100,
                  thumbColor: darkNeutral600,
                  groupValue: _selectedTab,
                  onValueChanged: (value) => setState(() {
                    _selectedTab = value!;
                  }),
                  children: {
                    for (final tab in tabs.keys)
                      tab: SizedBox(
                        width: size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Text(
                            tabs[tab]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: (_selectedTab == tab)
                                  ? Colors.white
                                  : const Color(0xff57524C),
                            ),
                          ),
                        ),
                      )
                  },
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 125),
                  child: _selectedTab == WardOrGuardians.ward
                      ? const MyWards()
                      : const MyGuardians(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
