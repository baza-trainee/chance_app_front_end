import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sos_page/edit_group_screen_sos.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteEditContactsSosPage extends StatefulWidget {
  const DeleteEditContactsSosPage({super.key});

  @override
  State<DeleteEditContactsSosPage> createState() =>
      _DeleteEditContactsSosPage();
}

class _DeleteEditContactsSosPage extends State<DeleteEditContactsSosPage> {
  List<SosGroupModel> selectedModels = [];

  bool isButtonEnable = false;
  late bool isEdit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SosContactsBloc>(context).add(LoadSosContactsEvent());
  }

  @override
  void didChangeDependencies() {
    isEdit = ModalRoute.of(context)!.settings.arguments as bool;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit == true
              ? AppLocalizations.instance.translate("deleteContact")
              : AppLocalizations.instance.translate("toChange"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocSelector<SosContactsBloc, SosContactsState,
                  List<SosGroupModel>>(
                selector: (state) => state.contacts,
                builder: (context, contacts) => ListView.builder(
                  itemCount: contacts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 29),
                  itemBuilder: (context, index) {
                    SosGroupModel contactModel = contacts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          if (isEdit == false) {
                            if (contactModel.name.isEmpty) {
                              Navigator.pushNamed(
                                  context, "/replace_contact_sos",
                                  arguments: contactModel);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditGroupScreenSos(
                                      groupModel: contactModel),
                                ),
                              );
                            }
                          }
                        },
                        child: ContainerButtonWithCheckbox(
                          contactModel: contactModel,
                          text: contactModel.name.isNotEmpty
                              ? contactModel.name
                              : contactModel.contacts[0].name,
                          isSelected: selectedModels.contains(
                            contactModel,
                          ),
                          isEdit: isEdit,
                          onChanged: (value) {
                            handleCheckboxChange(
                              value,
                              contactModel,
                            );
                          },
                          isGroup: contactModel.name.isNotEmpty ? true : false,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isEdit)
              SliverFillRemaining(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              red900.withOpacity(isButtonEnable ? 1 : 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          if (isButtonEnable) {
                            if (selectedModels[0].name.isNotEmpty) {
                              BlocProvider.of<SosContactsBloc>(context).add(
                                  DeleteGroup(ids: [selectedModels[0].id]));
                            } else {
                              BlocProvider.of<SosContactsBloc>(context).add(
                                  DeleteContact(ids: [selectedModels[0].id]));
                            }
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/sos", (route) => false);
                          }
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations.instance.translate("delete"),
                            style: const TextStyle(
                              color: primary50,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void handleCheckboxChange(bool? value, SosGroupModel contact) {
    setState(() {
      if (value != false) {
        selectedModels.add(contact);
      } else {
        selectedModels.remove(contact);
      }
      isButtonEnable = selectedModels.isNotEmpty;
    });
  }
}

class ContainerButtonWithCheckbox extends StatefulWidget {
  final String text;
  final bool isSelected;
  final bool isEdit;
  final bool isGroup;
  final ValueChanged<bool?>? onChanged;
  final SosGroupModel contactModel;

  const ContainerButtonWithCheckbox({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isEdit,
    required this.contactModel,
    required this.isGroup,
    this.onChanged,
  });

  @override
  State<ContainerButtonWithCheckbox> createState() =>
      _ContainerButtonWithCheckboxState();
}

class _ContainerButtonWithCheckboxState
    extends State<ContainerButtonWithCheckbox> {
  Color containerColor = darkNeutral600;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment:
            widget.isEdit ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.isEdit,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Checkbox(
                activeColor: darkNeutral800,
                checkColor: primary50,
                value: widget.isSelected,
                onChanged: (value) {
                  setState(() {
                    widget.onChanged?.call(value);
                    if (value == true) {
                      containerColor = darkNeutral800;
                    } else {
                      containerColor = darkNeutral600;
                    }
                  });
                },
                side: BorderSide(
                  color: widget.isSelected
                      ? primary50
                      : primary50, // Fix the typo here
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              widget.text,
              style: const TextStyle(
                color: primary50,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          if (widget.isGroup)
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.group,
                color: primary50,
              ),
            ),
        ],
      ),
    );
  }
}
