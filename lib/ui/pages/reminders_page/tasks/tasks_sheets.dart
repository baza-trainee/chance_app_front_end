import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/input_reminders_layout.dart';
import 'package:chance_app/ux/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:chance_app/ux/bloc/reminders_bloc/reminders_bloc.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

class TasksSheets extends StatefulWidget {
  const TasksSheets({super.key});

  @override
  State<TasksSheets> createState() => _TasksSheetsState();
}

class _TasksSheetsState extends State<TasksSheets> {
  final nameTextEditingController = TextEditingController();
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddTaskBloc>(context).add(LoadDataForSelectDateForTasks());
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: beige100,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${AppLocalizations.instance.translate("whatNeedsToBeDone")}?",
                      style: const TextStyle(color: primaryText, fontSize: 22),
                    ),
                  ),
                  const CloseButton(),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<AddTaskBloc, AddTaskState>(builder: (context, state) {
                TaskModel? taskModel = state.taskModel;

                return SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputRemindersLayout(
                      textEditingController: nameTextEditingController,
                      title:
                          AppLocalizations.instance.translate("enterTheTask"),
                      subTitle: '',
                      saveData: (String value) {
                        BlocProvider.of<AddTaskBloc>(context)
                            .add(SaveTaskName(name: value));
                      },
                      clearData: () {
                        BlocProvider.of<AddTaskBloc>(context)
                            .add(SaveTaskName(name: ""));
                      },
                    ),
                    if (state.taskTitle.trim().isNotEmpty)
                      GestureDetector(
                        onTap: () async {
                          if (state.taskTitle.trimLeft().length > 1) {
                            if (state.taskTitle.trimLeft().length <= 300) {
                              DateTime now = DateTime.now();
                              String name = state.taskTitle;
                              if (name.trim().isNotEmpty) {
                                DateTime date = state.newSelectedDateForTasks!;
                                if (state.newDeadlineForTask != null) {
                                  date = DateTime(
                                      state.newSelectedDateForTasks!.year,
                                      state.newSelectedDateForTasks!.month,
                                      state.newSelectedDateForTasks!.day,
                                      state.newDeadlineForTask!.hour,
                                      state.newDeadlineForTask!.minute);
                                } else {
                                  date = DateTime(
                                      state.newSelectedDateForTasks!.year,
                                      state.newSelectedDateForTasks!.month,
                                      state.newSelectedDateForTasks!.day,
                                      now.hour,
                                      now.minute);
                                }

                                TaskModel taskModel = TaskModel(
                                  id: const Uuid().v1(),
                                  message: name,
                                  date: date,
                                  remindBefore:
                                      state.notificationsBefore.minutesCount,
                                );
                                BlocProvider.of<RemindersBloc>(context)
                                    .add(AddTask(taskModel));

                                Navigator.of(context).pop();

                                nameTextEditingController.clear();
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: darkNeutral600))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.taskTitle,
                                style: const TextStyle(
                                    fontSize: 16, color: primaryText),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 100),
                    InkWell(
                      onTap: () async {
                        await Navigator.of(context)
                            .pushNamed("/date_picker_for_tasks")
                            .whenComplete(() {
                          nameTextEditingController.text = "";
                          BlocProvider.of<AddTaskBloc>(context)
                              .add(SaveTaskName(name: ""));
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: 40,
                        constraints: const BoxConstraints(minWidth: 120),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: primary100,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/icons/calendar.svg"),
                            Text(
                              (taskModel == null) ||
                                      (taskModel.date.day == now.day &&
                                          taskModel.date.month == now.month &&
                                          taskModel.date.year == now.year)
                                  ? AppLocalizations.instance.translate("today")
                                  : "${taskModel.date.day.toString().padLeft(2, "0")}.${taskModel.date.month.toString().padLeft(2, "0")}.${taskModel.date.year}",
                              style: const TextStyle(
                                  fontSize: 14, color: primaryText),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
