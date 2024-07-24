import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/menu/components/input_my_info_layout.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:flutter/material.dart';

class MyInformation extends StatefulWidget {
  const MyInformation({super.key});

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  TextEditingController firstNameTextEditingController =
          TextEditingController(),
      lastNameTextEditingController = TextEditingController(),
      phoneTextEditingController = TextEditingController(),
      emailTextEditingController = TextEditingController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    phoneTextEditingController.dispose();
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.instance.translate("myInfo")),
      ),
      backgroundColor: beigeBG,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputMyInfoLayout(
              title: AppLocalizations.instance.translate("name"),
              text: firstNameTextEditingController.text,
              key: const ValueKey("name"),
            ),
            const SizedBox(
              height: 30,
            ),
            InputMyInfoLayout(
              title: AppLocalizations.instance.translate("surname"),
              text: lastNameTextEditingController.text,
              key: const ValueKey("surname"),
            ),
            const SizedBox(
              height: 30,
            ),
            InputMyInfoLayout(
              title: AppLocalizations.instance.translate("phoneNumber"),
              text: phoneTextEditingController.text,
              key: const ValueKey("phone"),
            ),
            const SizedBox(
              height: 30,
            ),
            InputMyInfoLayout(
              title: AppLocalizations.instance.translate("email"),
              text: emailTextEditingController.text,
              key: const ValueKey("email"),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void loadData() async {
    MeUser user = HiveCRUD().user!;
    firstNameTextEditingController.text = user.name;
    lastNameTextEditingController.text = user.lastName;
    phoneTextEditingController.text = user.phone;
    emailTextEditingController.text = user.email;
  }
}
