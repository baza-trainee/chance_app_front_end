import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/labeled_text_field.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  SosContactsBloc get _sosContactsBloc {
    return BlocProvider.of<SosContactsBloc>(context);
  }

  final TextEditingController groupNameController = TextEditingController();
  final List<ContactItem> contacts = [];

  @override
  void initState() {
    super.initState();
    initContacts();
  }

  void initContacts() {
    contacts.add(ContactItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.instance.translate("createAGroup"),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              LabeledTextField(
                controller: groupNameController,
                label: AppLocalizations.instance.translate("enterGroupName"),
                hintText: AppLocalizations.instance.translate("family"),
                isPhone: false,
                onChanged: (value) {},
                key: const ValueKey("groupName"),
                prefixText: '',
              ),
              const Divider(
                color: beige300,
                height: 1,
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  for (int index = 0; index < contacts.length; index++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.instance.translate("contact") +
                              (" ${index + 1}"),
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        LabeledTextField(
                          controller: contacts[index].nameController,
                          label: AppLocalizations.instance.translate("name"),
                          hintText: AppLocalizations.instance.translate("name"),
                          isPhone: false,
                          onChanged: (value) {},
                          key: const ValueKey("name"),
                          prefixText: '',
                        ),
                        LabeledTextField(
                          controller: contacts[index].phoneController,
                          label: AppLocalizations.instance
                              .translate("enterPhoneNumber"),
                          hintText: '',
                          isPhone: true,
                          onChanged: (value) {},
                          key: const ValueKey("phone"),
                          prefixText: '+380',
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        contacts.add(ContactItem());
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.instance.translate("addContact"),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: primary800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 18),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          List<SosContactModel> contactModels = [];
                          for (int index = 0;
                              index < contacts.length;
                              index++) {
                            String name = contacts[index].nameController.text;
                            String phone = contacts[index].phoneController.text;
                            if (validateInput(name, isPhone: false) &&
                                validateInput(phone)) {
                              SosContactModel contactModel = SosContactModel(
                                name: name,
                                phone: "+380$phone",
                                groupName: groupNameController.text,
                              );
                              contactModels.add(contactModel);
                            } else {
                              Fluttertoast.showToast(
                                msg: AppLocalizations.instance
                                    .translate("checkTheCorrectnessOfTheData"),
                              );
                            }
                          }
                          SosGroupModel sosGroupModel = SosGroupModel(
                            name: groupNameController.text,
                            contacts: contactModels,
                          );

                          if (sosGroupModel.contacts.isNotEmpty) {
                            _sosContactsBloc.add(
                              SaveContact(
                                contactModel: sosGroupModel,
                                isGroup: true,
                              ),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/sos", (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary1000,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.instance.translate("saveTheGroup"),
                          style: const TextStyle(
                            color: primary50,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateInput(String input, {bool isPhone = true}) {
    if (isPhone) {
      final RegExp phoneRegex = RegExp(r'^\d{9}$');
      return phoneRegex.hasMatch(input);
    } else {
      final RegExp nameRegex = RegExp(r'^[а-яА-Яa-zA-Z\s]{2,30}$');
      return nameRegex.hasMatch(input);
    }
  }
}

class ContactItem {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
}
