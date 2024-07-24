import 'dart:async';

import 'package:chance_app/resources/app_icons.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

class ExpandableCalendar extends StatefulWidget {
  const ExpandableCalendar({
    required this.selectedDay,
    this.onDaySelect,
    this.tasks = const [],
    super.key,
  });

  final DateTime selectedDay;
  final ValueChanged<DateTime>? onDaySelect;
  final List<TaskModel> tasks;

  @override
  State<ExpandableCalendar> createState() => _ExpandableCalendarState();
}

class _ExpandableCalendarState extends State<ExpandableCalendar> {
  final _isExpanded = ValueNotifier<bool>(false);
  late final ValueNotifier<DateTime> _selectedDay;
  late final ValueNotifier<DateTime> _selectedMonth;
  late final ValueNotifier<DateTime> _selectedMonday;
  late final Timer _timer;
  DateTime? _today;

  void _onPreviousPressed() {
    if (_isExpanded.value) {
      _selectedMonth.value =
          DateUtils.addMonthsToMonthDate(_selectedMonth.value, -1);
    } else {
      _selectedMonday.value =
          DateUtils.addDaysToDate(_selectedMonday.value, -DateTime.daysPerWeek);
    }
  }

  void _onNextPressed() {
    if (_isExpanded.value) {
      _selectedMonth.value =
          DateUtils.addMonthsToMonthDate(_selectedMonth.value, 1);
    } else {
      _selectedMonday.value =
          DateUtils.addDaysToDate(_selectedMonday.value, DateTime.daysPerWeek);
    }
  }

  void _selectedMonthListener() {
    if (!_isExpanded.value) return;
    final month = _selectedMonth.value;
    _selectedMonday.value = month.copyWith(day: 2 - month.weekday);
  }

  void _selectedMondayListener() {
    if (_isExpanded.value) return;
    _selectedMonth.value = _selectedMonday.value.copyWith(day: 1);
  }

  void _selectedDayListener() {
    final day = _selectedDay.value;
    widget.onDaySelect?.call(day);
    _selectedMonday.value = DateUtils.addDaysToDate(day, 1 - day.weekday);
  }

  @override
  void initState() {
    super.initState();
    final day = DateUtils.dateOnly(widget.selectedDay);
    _selectedDay = ValueNotifier(day)..addListener(_selectedDayListener);
    _selectedMonth = ValueNotifier(day.copyWith(day: 1))
      ..addListener(_selectedMonthListener);
    _selectedMonday = ValueNotifier(
      DateUtils.addDaysToDate(day, 1 - day.weekday),
    )..addListener(_selectedMondayListener);
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        final today = DateUtils.dateOnly(DateTime.now());
        if (today != _today) {
          _today = today;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() {});
          });
        }
      },
    );
  }

  @override
  void didUpdateWidget(covariant ExpandableCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedDay.value = DateUtils.dateOnly(widget.selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkNeutral600,
      borderRadius: BorderRadius.circular(16),
      textStyle: const TextStyle(fontSize: 16, letterSpacing: 0.5),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _navigationPanel(),
            const SizedBox(height: 10),
            _weekdaysRow(),
            const SizedBox(height: 4),
            _mainBody(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _selectedDay.dispose();
    _selectedMonth.dispose();
    _selectedMonday.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  Widget _navigationPanel() {
    return IconTheme(
      data: const IconThemeData(color: primary50),
      child: Row(
        children: [
          IconButton(
            onPressed: _onPreviousPressed,
            icon: const Icon(CupertinoIcons.back),
          ),
          ValueListenableBuilder(
            valueListenable: _selectedMonth,
            builder: (context, month, child) {
              final parsedDate = Jiffy.parseFromDateTime(month);
              print(parsedDate);
              return Text(
                [
                  parsedDate.MMMM.characters.first.toUpperCase(),
                  parsedDate.MMMM.substring(1),
                  ", ",
                  parsedDate.year,
                ].join(),
                style: const TextStyle(fontSize: 22, color: primary50),
              );
            },
          ),
          IconButton(
            onPressed: _onNextPressed,
            icon: const Icon(CupertinoIcons.forward),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => _isExpanded.value = !_isExpanded.value,
            padding: const EdgeInsets.all(10),
            style: IconButton.styleFrom(
              backgroundColor: beige200,
              foregroundColor: primaryText,
              shape: const CircleBorder(),
            ),
            icon: ValueListenableBuilder(
              valueListenable: _isExpanded,
              builder: (context, isExpanded, child) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 75),
                child: SvgPicture.asset(
                  isExpanded ? AppIcons.calendarOpen : AppIcons.calendar,
                  color: primaryText,
                  key: ValueKey(isExpanded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weekdaysRow() {
    final monday = _selectedMonday.value;
    return Row(
      children: List.generate(
        DateTime.daysPerWeek,
        (index) {
          final currentDay = DateUtils.addDaysToDate(monday, index);
          final currentDayText = Jiffy.parseFromDateTime(currentDay).E;
          return Expanded(
            child: Center(
              child: Text(
                [
                  currentDayText.characters.first.toUpperCase(),
                  currentDayText.substring(1),
                ].join(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mainBody() {
    final myTasks = groupBy(
      widget.tasks,
      (e) => DateUtils.dateOnly(e.date.toLocal()),
    );
    return ValueListenableBuilder(
      valueListenable: _isExpanded,
      builder: (context, isExpanded, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              alignment: Alignment.bottomCenter,
              sizeCurve: Curves.ease,
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: const Divider(height: 16),
            ),
            ValueListenableBuilder(
              valueListenable: _selectedMonth,
              builder: (context, month, child) {
                return ValueListenableBuilder(
                  valueListenable: _selectedMonday,
                  builder: (context, selectedMonday, child) {
                    final weekRows = <Widget>[];
                    var monday = month.copyWith(day: 2 - month.weekday);

                    do {
                      final weekRow = Visibility(
                        visible: isExpanded || monday == selectedMonday,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: _weekRow(monday, tasks: myTasks),
                        ),
                      );
                      weekRows.add(weekRow);
                      monday = DateUtils.addDaysToDate(monday, 7);
                    } while (DateUtils.isSameMonth(monday, month));

                    return AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      alignment: Alignment.topCenter,
                      curve: Curves.ease,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: weekRows,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _weekRow(
    DateTime mondayDate, {
    required Map<DateTime, List<TaskModel>> tasks,
  }) {
    return Row(
      children: List.generate(
        DateTime.daysPerWeek,
        (index) {
          final day = DateUtils.addDaysToDate(mondayDate, index);
          final isInMonth = DateUtils.isSameMonth(day, _selectedMonth.value);
          return Expanded(
            child: ValueListenableBuilder(
              valueListenable: _selectedDay,
              builder: (context, selectedDay, child) {
                final isSelected = DateUtils.isSameDay(day, selectedDay);
                final isToday = DateUtils.isSameDay(day, _today);
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: isSelected ? beige200 : Colors.transparent,
                    border: Border.all(
                      color: isToday ? beige200 : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: isSelected ? primaryText : Colors.white,
                    ),
                    child: child!,
                  ),
                );
              },
              child: InkWell(
                onTap: () => _selectedDay.value = day,
                customBorder: const CircleBorder(),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Opacity(
                          opacity: isInMonth ? 1 : 0.8,
                          child: Text(day.day.toString().padLeft(2, "0")),
                        ),
                      ),
                    ),
                    if (tasks[day]?.isNotEmpty ?? false)
                      const Positioned(
                        bottom: 2,
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: primary400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
