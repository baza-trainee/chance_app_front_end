import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DoctorAppointmentWebView extends StatefulWidget {
  const DoctorAppointmentWebView({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<DoctorAppointmentWebView> createState() =>
      _DoctorAppointmentWebViewState();
}

class _DoctorAppointmentWebViewState extends State<DoctorAppointmentWebView> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            loadingPercentage = 0;
            if (mounted) setState(() {});
          },
          onProgress: (progress) {
            loadingPercentage = progress;
            if (mounted) setState(() {});
          },
          onPageFinished: (url) {
            loadingPercentage = 100;
            if (mounted) setState(() {});
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('youtube.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
