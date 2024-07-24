import 'package:bottom_picker/resources/context_extension.dart';
import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NotificationsBefore {
  no,
  atTime,
  fiveMinute,
  thirtyMinute,
  oneHour,
  oneDay;

  int? get minutesCount {
    switch (this) {
      case NotificationsBefore.no:
        return null;
      case NotificationsBefore.atTime:
        return 0;
      case NotificationsBefore.fiveMinute:
        return 5;
      case NotificationsBefore.thirtyMinute:
        return 30;
      case NotificationsBefore.oneHour:
        return Duration.minutesPerHour;
      case NotificationsBefore.oneDay:
        return Duration.minutesPerDay;
    }
  }
}

class CustomBottomSheetNotificationPicker extends StatefulWidget {
  const CustomBottomSheetNotificationPicker({super.key});

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: false,
      showDragHandle: true,
      useSafeArea: false,
      backgroundColor: beige100,
      constraints: BoxConstraints(
        // minHeight: MediaQuery.of(context).size.height/1.2,
        maxWidth: context.bottomPickerWidth,
      ),
      builder: (context) {
        return BottomSheet(
          backgroundColor: beige100,
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return this;
          },
        );
      },
    );
  }

  @override
  State<CustomBottomSheetNotificationPicker> createState() =>
      _CustomBottomSheetNotificationPickerState();
}

class _CustomBottomSheetNotificationPickerState
    extends State<CustomBottomSheetNotificationPicker> {
  final int session = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                AppLocalizations.instance.translate("reminder"),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: primaryText),
              ),
              ListView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: NotificationsBefore.values.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, position) {
                    bool isSelected = state.notificationsBefore ==
                        NotificationsBefore.values[position];
                    return RoundedButton(
                        margin: const EdgeInsets.only(bottom: 8),
                        height: 48,
                        border: Border.all(color: darkNeutral800),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        onPress: () {
                          BlocProvider.of<AddTaskBloc>(context).add(
                              SelectNotificationBefore(
                                  notificationsBefore:
                                      NotificationsBefore.values[position],
                                  session: session));
                        },
                        color: isSelected ? darkNeutral600 : Colors.transparent,
                        child: Row(
                          children: [
                            Text(
                              state.notifications[position],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected ? primary50 : primaryText,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            if (isSelected)
                              const Icon(
                                Icons.done,
                                color: primary50,
                              )
                          ],
                        ));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddTaskBloc>(context)
                          .add(CancelNotificationBefore(session: session));
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        AppLocalizations.instance.translate("cancel"),
                        style: const TextStyle(fontSize: 22, color: primary700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OK",
                        style: TextStyle(fontSize: 22, color: primary700),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }
}
