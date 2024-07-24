import 'package:bottom_picker/resources/context_extension.dart';
import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:chance_app/ui/components/custom_bottom_sheet_scaffold.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

export 'package:bottom_picker/resources/time.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    required this.title,
    this.initialTime,
    super.key,
  });

  final Widget title;
  final DateTime? initialTime;

  static Future<DateTime?> show(
    BuildContext context, {
    required Widget title,
    DateTime? initialDateTime,
  }) {
    return showModalBottomSheet<DateTime>(
      context: context,
      isDismissible: true,
      enableDrag: false,
      constraints: BoxConstraints(
        maxWidth: context.bottomPickerWidth,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.transparent,
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return CustomTimePicker(
              title: title,
              initialTime: initialDateTime,
            );
          },
        );
      },
    );
  }

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    const minuteInterval = 5;
    return CustomBottomSheetScaffold(
      title: widget.title,
      body: DatePicker(
        initialDateTime: DateTime(
          selectedTime.year,
          selectedTime.month,
          selectedTime.day,
          selectedTime.hour,
          (selectedTime.minute / minuteInterval).ceil() * minuteInterval,
        ),
        minuteInterval: minuteInterval,
        mode: CupertinoDatePickerMode.time,
        onDateChanged: (DateTime date) {
          selectedTime = date;
        },
        use24hFormat: true,
        textStyle: const TextStyle(fontSize: 28, color: primary800),
      ),
      onOKPressed: () {
        Navigator.of(context).pop(selectedTime);
      },
    );
  }
}
