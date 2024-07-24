import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/custom_bottom_sheet.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/medicine_added_bottom_sheet.dart';
import 'package:chance_app/ui/pages/reminders_page/components/expandable_calendar.dart';
import 'package:chance_app/ui/pages/reminders_page/components/medicine_status_updated_dialog.dart';
import 'package:chance_app/ui/pages/reminders_page/components/success_dialog.dart';
import 'package:chance_app/ui/pages/reminders_page/components/task_status_updated_dialog.dart';
import 'package:chance_app/ui/pages/reminders_page/medicine/medicine_list.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/task_list.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/tasks_sheets.dart';
import 'package:chance_app/ux/bloc/reminders_bloc/reminders_bloc.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/enum/reminders.dart';
import 'package:chance_app/ux/helpers/show_dismissible_dialog.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedTab = Reminders.medicine;

  late EdgeInsets _padding;

  Future<void> _onAddButtonPressed() async {
    final selectedReminders = await showModalBottomSheet<Reminders>(
      context: context,
      backgroundColor: beige100,
      showDragHandle: true,
      builder: (context) => const CustomBottomSheet(),
    );
    if (selectedReminders == null) return;
    switch (selectedReminders) {
      case Reminders.tasks:
        _scaffoldKey.currentState?.showBottomSheet(
          backgroundColor: beige100,
          (_) => const TasksSheets(),
        );
      case Reminders.medicine:
        if (mounted) Navigator.of(context).pushNamed("/add_medicine");
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<RemindersBloc>().add(const LoadData());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _padding = MediaQuery.paddingOf(context);
  }

  @override
  Widget build(BuildContext context) {
    const dialogDismissDuration = Duration(seconds: 2);
    return BlocListener<RemindersBloc, RemindersState>(
      listener: (context, state) async {
        if (state is TaskAdded) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => SuccessDialog(
              title: Text(AppLocalizations.instance.translate("taskAdded")),
              subtitle: Text('"${state.task.message}"'),
            ),
          );
        } else if (state is TaskDone) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => SuccessDialog(
              title: Text(AppLocalizations.instance.translate("taskCompleted")),
              subtitle: Text('"${state.task.message}"'),
            ),
          );
        } else if (state is TaskPostponed) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => TaskStatusUpdatedDialog(
              state.task,
              status: ReminderState.rescheduled,
              bottom: Text("${AppLocalizations.instance.translate("postponedTo")} ${state.value.inMinutes}${AppLocalizations.instance.translate("min")}"),
            ),
          );
        } else if (state is TaskDeleted) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => SuccessDialog(
              title: Text(AppLocalizations.instance.translate("taskDeleted")),
              subtitle: Text('"${state.task.message}"'),
            ),
          );
        } else if (state is MedicineAdded) {
          final addMore = await showModalBottomSheet<bool>(
            context: context,
            backgroundColor: beige100,
            showDragHandle: true,
            builder: (context) => MedicineAddedBottomSheet(state.medicine),
          );
          if ((addMore ?? false) && context.mounted) {
            Navigator.of(context).pushNamed("/add_medicine");
          }
        } else if (state is MedicineDone) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => MedicineStatusUpdatedDialog(
              state.medicine,
              doseTime: state.at,
              status: ReminderState.done,
              bottom: Text(AppLocalizations.instance.translate("accepted")),
            ),
          );
        } else if (state is MedicinePostponed) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => MedicineStatusUpdatedDialog(
              state.medicine,
              doseTime: state.doseTime,
              status: ReminderState.rescheduled,
              bottom: Text("${AppLocalizations.instance.translate("postponedTo")} ${state.value.inMinutes}${AppLocalizations.instance.translate("min")}"),
            ),
          );
        } else if (state is MedicineDeleted) {
          await showDismissibleDialog<void>(
            context: context,
            dismissAfter: dialogDismissDuration,
            builder: (context) => SuccessDialog(
              title: Text("${state.medicine.name} ${AppLocalizations.instance.translate("deleted").toLowerCase()}"),
            ),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: beigeBG,
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: const TextStyle(fontSize: 22, color: primaryText),
          title: Text(AppLocalizations.instance.translate("reminder")),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/main_page");
            },
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              BlocSelector<RemindersBloc, RemindersState, bool>(
                selector: (state) => state is RemindersLoading,
                builder: (context, isLoading) {
                  return Visibility(
                    visible: !isLoading,
                    replacement: const CupertinoActivityIndicator(
                      color: primary500,
                      radius: 50,
                    ),
                    child: Column(
                      children: [
                        _calendarView(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _tabSwitcher(),
                        ),
                        Expanded(child: _tabViews()),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                right: _padding.right + 10,
                bottom: _padding.bottom + 10,
                child: ElevatedButton.icon(
                  onPressed: _onAddButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary1000,
                    foregroundColor: primary50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    minimumSize: const Size.square(36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.15,
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: Text(AppLocalizations.instance.translate("add")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _calendarView() {
    return BlocBuilder<RemindersBloc, RemindersState>(
      builder: (context, state) => ExpandableCalendar(
        tasks: state.tasks,
        selectedDay: state.selectedDay,
        onDaySelect: (dayDate) {
          context.read<RemindersBloc>().add(SelectDay(dayDate));
        },
      ),
    );
  }

  Widget _tabSwitcher() {
    final tabs = {
      Reminders.medicine: AppLocalizations.instance.translate("myMedicines"),
      Reminders.tasks: AppLocalizations.instance.translate("myTasks"),
    };
    return DecoratedBox(
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
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
            ),
        },
      ),
    );
  }

  Widget _tabViews() {
    return BlocSelector<RemindersBloc, RemindersState, DateTime>(
      selector: (state) => state.selectedDay,
      builder: (context, selectedDay) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: Align(
          key: ValueKey(selectedDay),
          alignment: Alignment.topCenter,
          child: _itemList(selectedDay),
        ),
      ),
    );
  }

  Widget _itemList(DateTime dayDate) {
    switch (_selectedTab) {
      case Reminders.medicine:
        return BlocSelector<RemindersBloc, RemindersState, List<MedicineModel>>(
          selector: (state) => state.medicines,
          builder: (context, medicines) {
            return MedicineList(medicines, dayDate: dayDate);
          },
        );
      case Reminders.tasks:
        return BlocSelector<RemindersBloc, RemindersState, List<TaskModel>>(
          selector: (state) => state.tasks,
          builder: (context, tasks) {
            return TaskList(tasks, dayDate: dayDate);
          },
        );
    }
  }
}
