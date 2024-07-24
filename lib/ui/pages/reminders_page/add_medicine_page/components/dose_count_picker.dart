import 'package:bottom_picker/resources/context_extension.dart';
import 'package:chance_app/ui/components/custom_bottom_sheet_scaffold.dart';
import 'package:chance_app/ui/components/separated_list.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/reminders_page/add_medicine_page/components/dose_text.dart';
import 'package:chance_app/ux/enum/medicine_type.dart';
import 'package:flutter/material.dart';

const _maxDoses = 5;

class DoseCountPicker extends StatefulWidget {
  const DoseCountPicker({
    required this.title,
    required this.medicineType,
    this.initialCount = 1,
    super.key,
  }) : assert(
          initialCount > 0 && initialCount <= _maxDoses,
          "Value of initialCount must be [1, $_maxDoses]",
        );

  final Widget title;
  final MedicineType? medicineType;
  final int initialCount;

  static Future<int?> show(
    BuildContext context, {
    required Widget title,
    required MedicineType? medicineType,
    int initialCount = 1,
  }) {
    return showModalBottomSheet<int>(
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
            return DoseCountPicker(
              title: title,
              medicineType: medicineType,
              initialCount: initialCount,
            );
          },
        );
      },
    );
  }

  @override
  State<DoseCountPicker> createState() => _DoseCountPickerState();
}

class _DoseCountPickerState extends State<DoseCountPicker> {
  late int selectedCount;

  @override
  void initState() {
    super.initState();
    selectedCount = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetScaffold(
      title: widget.title,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SeparatedList(
            axis: Axis.horizontal,
            separator: const SizedBox(width: 8),
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _maxDoses,
              (index) {
                final count = index + 1;
                return SizedBox.square(
                  dimension: 44,
                  child: Material(
                    color: (count == selectedCount)
                        ? darkNeutral800
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: darkNeutral800),
                    ),
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: (count == selectedCount)
                          ? primary50
                          : const Color(0xFF212833),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () => setState(() {
                        selectedCount = count;
                      }),
                      child: Center(
                        child: Text(count.toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          DoseText(
            medicineType: widget.medicineType,
            count: selectedCount,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
      onOKPressed: () {
        Navigator.of(context).pop(selectedCount);
      },
    );
  }
}
