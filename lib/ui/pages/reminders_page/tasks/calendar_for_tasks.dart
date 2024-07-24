import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarForTasks extends StatelessWidget {
  CalendarForTasks({super.key});
final DateTime now=DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
      List<Map<String, dynamic>>
          days = List.from(state.daysForTasks);
      if(days.isNotEmpty) {
        int count = getCount(days.first["weekDay"].toString());
        for (int i = 0; i < count; i++) {
          days.insert(0, {"number": -1,});
        }
      }

      return Container(
        width: size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Row(
              children: [
                Text(
                  "${getMonthName(state.dateForSwipingForTasks?.month ?? 0)}, ${state.dateForSwipingForTasks?.year ?? ""}",
                  style: const TextStyle(fontSize: 22, color: primaryText),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AddTaskBloc>(context)
                          .add(ChangeMonthForTasks(sideSwipe: SideSwipe.left));
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: primaryText)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AddTaskBloc>(context)
                          .add(ChangeMonthForTasks(sideSwipe: SideSwipe.right));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: primaryText)),

              ],
            ),
            SizedBox(
                child: Flex(
              direction: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("mon").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("tue").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("wed").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("thu").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("fri").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("sat").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width / 8,
                      height: 26,
                      child: Text(
                        AppLocalizations.instance.translate("sun").toUpperCase(),
                        style: const TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: beige300,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.start,
                  children: days.map((e) {
                    if (e["number"] == -1) {
                      return SizedBox(
                        height: size.width / 8,
                        width: size.width / 8,
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AddTaskBloc>(context)
                            .add(SelectedDateForTasks(selectedDate: e));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: size.width / 8,
                            width: size.width / 8,
                            alignment: Alignment.center,
                            decoration: e["isSelected"]
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: primary800)
                                : int.parse(e["number"]) == now.day &&
                                e["month"] == now.month &&
                                e["year"] == now.year
                                ? BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(90),
                                border: Border.all(color: primary800))
                                :null,
                            child: Text(
                              e["number"].toString(),
                              style: TextStyle(
                                  color: e["isSelected"] ? primary50 : primaryText,
                                  letterSpacing: 0.5,
                                  fontSize: 16),
                            ),
                          ),
                          if (e["hasTasks"])
                            Container(
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  color: primary400),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ))
          ],
        ),
      );
    });
  }

  int getCount(String weekday) {
    if (weekday == AppLocalizations.instance.translate("mon")) {
      return 0;
    } else if (weekday == AppLocalizations.instance.translate("tue")) {
      return 1;
    } else if (weekday == AppLocalizations.instance.translate("wed")) {
      return 2;
    } else if (weekday == AppLocalizations.instance.translate("thu")) {
      return 3;
    } else if (weekday == AppLocalizations.instance.translate("fri")) {
      return 4;
    } else if (weekday == AppLocalizations.instance.translate("sat")) {
      return 5;
    } else if (weekday == AppLocalizations.instance.translate("sun")) {
      return 6;
    }
    return 0;
  }
}
