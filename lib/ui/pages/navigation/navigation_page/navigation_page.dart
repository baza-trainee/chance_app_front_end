import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_view.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/search_bar.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with WidgetsBindingObserver {
  GlobalKey appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarKey,
      extendBodyBehindAppBar: true,
      backgroundColor: beigeBG,
      body: Stack(children: [
        const MapView(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: beigeTransparent,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 6,
                                color: Colors.black26,
                                offset: Offset(0, 0),
                                spreadRadius: 2,
                                blurStyle: BlurStyle.normal)
                          ]),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: primaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 86,
                    child: CustomSearchBar(
                      appBarKey: appBarKey,
                      width: MediaQuery.of(context).size.width - 86,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
