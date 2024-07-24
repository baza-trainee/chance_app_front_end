import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/labeled_text_field.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:chance_app/ux/repository/sos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final SosRepository sosRepository = SosRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SosContactsBloc get _sosContactsBloc {
    return BlocProvider.of<SosContactsBloc>(context);
  }

  SosContactModel? get contactModel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.instance.translate("createAContact"),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            // fontFamily: ,
          ),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/sos", (route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabeledTextField(
              controller: nameController,
              label: AppLocalizations.instance.translate("enterName"),
              hintText: AppLocalizations.instance.translate("name"),
              isPhone: false,
              onChanged: (value) {},
              key: const ValueKey("name"),
              prefixText: '',
            ),
            LabeledTextField(
              controller: phoneController,
              label: AppLocalizations.instance.translate("enterPhoneNumber"),
              hintText: '',
              isPhone: true,
              onChanged: (value) {},
              key: const ValueKey("phone"),
              prefixText: '+380',
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final nameTextField = LabeledTextFieldState.nameTextField;
                  final phoneTextField = LabeledTextFieldState.phoneTextField;
                  if (nameTextField != null && phoneTextField != null) {
                    if (nameTextField.validate() && phoneTextField.validate()) {
                      _sosContactsBloc.add(
                        SaveContact(
                          contactModel: SosGroupModel(name: "", contacts: [
                            SosContactModel(
                              name: nameController.text,
                              phone: "+380${phoneController.text}",
                            )
                          ]),
                          isGroup: false,
                        ),
                      );
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/sos", (route) => false);
                      nameTextField.clear();
                      phoneTextField.clear();
                    } else {
                      Fluttertoast.showToast(
                        msg: AppLocalizations.instance
                            .translate("checkTheCorrectnessOfTheData"),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary1000,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  AppLocalizations.instance.translate("saveTheContact"),
                  style: const TextStyle(
                    color: primary50,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
