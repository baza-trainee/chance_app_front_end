import 'package:chance_app/ui/components/separated_list.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/enum/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SeparatedList(
          axis: Axis.horizontal,
          separator: const SizedBox(width: 16),
          children: [
            for (final item in Reminders.values)
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  color: darkNeutral600,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(item),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            item.svgIcon,
                            color: primary50,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.toLocalizedString(),
                            style: const TextStyle(fontSize: 16, color: primary50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

    );
  }
}
