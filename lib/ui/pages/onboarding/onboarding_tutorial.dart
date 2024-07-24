import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/onboarding/components/onboarding_tutorial_page_item.dart';
import 'package:flutter/material.dart';

enum OnboardingTutorialPages { first, second, third, fourth, fifth, sixth }

class OnboardingTutorial extends StatefulWidget {
  const OnboardingTutorial({super.key});

  @override
  State<OnboardingTutorial> createState() => _OnboardingTutorialState();
}

class _OnboardingTutorialState extends State<OnboardingTutorial> {
  final PageController pageController = PageController();
  int page = 0;
  List<Image> images = [];
  final List<String> titles = [
        AppLocalizations.instance.translate("reminder"),
        AppLocalizations.instance.translate("communication"),
        AppLocalizations.instance.translate("jobSearch"),
        AppLocalizations.instance.translate("appointmentWithDoctor"),
        AppLocalizations.instance.translate("navigation"),
        'SOS',
      ],
      subtitles = [
        AppLocalizations.instance.translate("onboardingReminder"),
        AppLocalizations.instance.translate("onboardingCommunication"),
        AppLocalizations.instance.translate("onboardingJobSearch"),
        AppLocalizations.instance.translate("onboardingAppointmentWithDoctor"),
        AppLocalizations.instance.translate("onboardingNavigation"),
        AppLocalizations.instance.translate("onboardingSos"),
      ];

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (value) {
          print(page);
          if (page != 0) {
            pageController.jumpToPage(
              page - 1,
            );
            setState(() {
              page - 1;
            });
          }
        },
        child: Scaffold(
          backgroundColor: beigeBG,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() {
                      page = value;
                    });
                  },
                  itemCount: OnboardingTutorialPages.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OnboardingTutorialPageItem(
                      image: images[index],
                      onboardingTutorialPages:
                          OnboardingTutorialPages.values[index],
                      title: titles[index],
                      subtitle: subtitles[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                onPress: () {
                  if (page < 5) {
                    pageController.jumpToPage(
                      page + 1,
                    );
                    setState(() {
                      page + 1;
                    });
                  } else {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/signinup", (route) => false);
                  }
                },
                color: primary1000,
                child: Text(
                      page == 5
                          ? AppLocalizations.instance.translate("complete")
                          : AppLocalizations.instance.translate("next"),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: primary50),
                    ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: OnboardingTutorialPages.values.map((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          color: e == OnboardingTutorialPages.values[page]
                              ? darkNeutral600
                              : darkNeutral400,
                          borderRadius: BorderRadius.circular(90)),
                      height: 8,
                      width: e == OnboardingTutorialPages.values[page] ? 32 : 8,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 58),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == 0) {
                      Navigator.of(context).pop();
                    } else {
                      pageController.jumpToPage(
                        page - 1,
                      );
                      setState(() {
                        page - 1;
                      });
                    }
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: beigeTransparent),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: primaryText,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/signinup", (route) => false);
                  },
                  child: Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: beigeTransparent),
                    child: Center(
                      child: Text(
                            AppLocalizations.instance.translate("miss"),
                            style: const TextStyle(fontSize: 16, color: primaryText),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void loadData() {
    for (var i = 0; i < 6; i++) {
      images.add(Image.asset(
        "assets/onboarding_images/page${i + 1}.jpg",
        fit: BoxFit.fitWidth,
        filterQuality: FilterQuality.high,
      ));
    }
    if (mounted) setState(() {});
  }
}
