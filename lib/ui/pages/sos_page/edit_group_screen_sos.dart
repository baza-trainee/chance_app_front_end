import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/labeled_text_field.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditGroupScreenSos extends StatefulWidget {
  final SosGroupModel groupModel;

  const EditGroupScreenSos({super.key, required this.groupModel});

  @override
  State<EditGroupScreenSos> createState() => _EditGroupScreenSosState();
}

class _EditGroupScreenSosState extends State<EditGroupScreenSos> {
  late TextEditingController groupNameController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late List<ContactItem> contacts;

  SosContactsBloc get _sosContactsBloc {
    return BlocProvider.of<SosContactsBloc>(context);
  }

  @override
  void initState() {
    super.initState();
    groupNameController = TextEditingController(text: widget.groupModel.name);
    contacts = widget.groupModel.contacts.map((contact) {
      return ContactItem(
        name: contact.name,
        phone: contact.phone.substring(4),
      );
    }).toList();

    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppLocalizations.instance.translate("editGroup"),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.instance.translate("contact") +
                                  ("  ${index + 1}"),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  contacts.removeAt(index);
                                });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.cancel,
                                    color: beige500,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
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
                          height: 28,
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: InkWell(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          saveChanges();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary1000,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.instance.translate("saveChanges"),
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

  void saveChanges() {
    bool isAllContactsValid = true;
    for (var contact in contacts) {
      if (contact.nameController.text.isEmpty ||
          contact.phoneController.text.isEmpty ||
          contact.nameController.text.length < 2 ||
          contact.nameController.text.length > 30) {
        isAllContactsValid = false;
        break;
      }
      if (contact.phoneController.text.length != 9 ||
          !RegExp(r'^\d{9}$').hasMatch(contact.phoneController.text)) {
        isAllContactsValid = false;
        break;
      }
    }

    bool isGroupNameValid = groupNameController.text.isNotEmpty;

    if (!isAllContactsValid || !isGroupNameValid) {
      Fluttertoast.showToast(
        msg:
            AppLocalizations.instance.translate("checkTheCorrectnessOfTheData"),
      );
      return;
    }

    List<SosContactModel> updatedContacts = [];

    for (int index = 0; index < contacts.length; index++) {
      var contact = contacts[index];
      updatedContacts.add(
        SosContactModel(
          name: contact.nameController.text,
          phone: "+380${contact.phoneController.text}",
          id: widget.groupModel.contacts[0].id,
          contactsId: widget.groupModel.contacts[0].contactsId,
        ),
      );
    }

    SosGroupModel updatedGroup = SosGroupModel(
      id: widget.groupModel.id,
      name: groupNameController.text,
      contacts: updatedContacts,
    );

    _sosContactsBloc.add(
      EditContact(
        contactModel: updatedGroup,
      ),
    );

    Navigator.pushNamed(context, "/sos");
  }
}

class ContactItem {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  ContactItem({String? name, String? phone})
      : nameController = TextEditingController(text: name),
        phoneController = TextEditingController(text: phone);
}
