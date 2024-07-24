import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/doctor_appointment/doctor_appointment_menu.dart';
import 'package:chance_app/ui/pages/doctor_appointment/doctor_appointment_web_view.dart';
import 'package:chance_app/ui/pages/doctor_appointment/navigation_controls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://helsi.me/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.instance.translate("appointmentWithDoctor")),
        actions: [
          NavigationControls(controller: controller),
          if (kDebugMode)
            DoctorAppointmentMenu(
              controller: controller,
            ),
        ],
      ),
      body: DoctorAppointmentWebView(
        controller: controller,
      ),
    );
  }
}
