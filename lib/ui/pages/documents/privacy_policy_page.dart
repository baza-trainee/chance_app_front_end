import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/repository/files_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:pdfx/pdfx.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final _repository = FilesRepository();
  late final PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openData(_repository.getPrivacyPolicy()),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.instance.translate("privacyPolicy")),
      ),
      body: SafeArea(
        child: FutureBuilder(
          // TODO: use an endpoint to load the file
          future: rootBundle.loadString("assets/privacy-policy.html"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null) return const SizedBox.shrink();
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                clipBehavior: Clip.none,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: HtmlWidget(
                      snapshot.data!,
                      onLoadingBuilder: (context, element, progress) => Center(
                        child: CircularProgressIndicator(value: progress),
                      ),
                      onTapUrl: (urlString) async {
                        final canHandle = await canLaunchUrlString(urlString);
                        if (canHandle) return launchUrlString(urlString);
                        return false;
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    //return Scaffold(
    //  appBar: AppBar(
    //    title: const Text("Політика конфіденційності"),
    //  ),
    //  body: SafeArea(
    //    child: PdfView(
    //      controller: _pdfController,
    //      pageSnapping: false,
    //      scrollDirection: Axis.vertical,
    //      physics: const RangeMaintainingScrollPhysics(),
    //    ),
    //  ),
    //);
  }
}
