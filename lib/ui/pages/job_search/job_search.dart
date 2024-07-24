import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/doctor_appointment/navigation_controls.dart';

import 'package:chance_app/ui/pages/job_search/job_search_web_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JobSearch extends StatefulWidget {
  const JobSearch({super.key});

  @override
  State<JobSearch> createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.work.ua/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.instance.translate("jobSearch")),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: JobSearchWebView(
        controller: controller,
      ),
    );
  }
}
