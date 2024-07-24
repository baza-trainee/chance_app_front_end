import 'dart:async';

import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/reminders_bloc/reminders_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/product_model.dart';
import 'package:chance_app/ux/repository/items_repository.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  static InAppPurchase inAppPurchase = InAppPurchase.instance;
  static List<ProductDetails> products = [];
  static List<PurchaseDetails> purchase = [];
  StreamSubscription? subscription;
  static String idOfPrd = "";
  static late ProductDetails item;

  @override
  void dispose() {
    if (subscription != null) {
      subscription!.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkIfDocsAreAvailable();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.instance.translate("menu"),
          style: const TextStyle(fontSize: 22, color: primaryText),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/main_page");
          },
        ),
      ),
      backgroundColor: beigeBG,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.instance.translate("account"),
              style: const TextStyle(fontSize: 16, color: darkNeutral800),
            ),
            RoundedButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 4),
                border: Border.all(color: darkNeutral800),
                onPress: () async {
                  Navigator.of(context).pushNamed("/my_information");
                },
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.instance.translate("myInfo"),
                      style: const TextStyle(
                          fontSize: 16,
                          color: primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: primaryText,
                    )
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
                onPress: () {
                  if (products.isNotEmpty) {
                    findMatch(products[0]);
                  } else {
                    Fluttertoast.showToast(
                        msg: AppLocalizations.instance
                            .translate("productsAreLoading"),
                        toastLength: Toast.LENGTH_LONG);
                  }
                },
                padding: const EdgeInsets.all(16),
                height: 0,
                color: darkNeutral600,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/adblocker.png",
                      width: 53,
                      color: primary50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      AppLocalizations.instance.translate("buyAdblocker"),
                      style: const TextStyle(
                          color: primary50,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.instance.translate("aboutTheApplication"),
              style: const TextStyle(fontSize: 16, color: darkNeutral800),
            ),
            RoundedButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 4),
                border: Border.all(color: darkNeutral800),
                onPress: () async {
                  Navigator.of(context).pushNamed("/privacy_policy");
                },
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.instance.translate("privacyPolicy"),
                      style: const TextStyle(
                          fontSize: 16,
                          color: primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: primaryText,
                    )
                  ],
                )),
            RoundedButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 4),
                border: Border.all(color: darkNeutral800),
                onPress: () async {
                  Navigator.of(context).pushNamed("/choose_language");
                },
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.instance.translate("changeLanguage"),
                      style: const TextStyle(
                          fontSize: 16,
                          color: primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: primaryText,
                    )
                  ],
                )),
            const Spacer(),
            SafeArea(
              child: RoundedButton(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  onPress: () async {
                    await UserRepository().logout().then((value) {
                      if (value == null) {
                        context
                            .read<RemindersBloc>()
                            .add(const CancelAllReminders());
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "/signinup", (route) => false);
                      }
                    });
                  },
                  color: primary1000,
                  child: Text(
                    AppLocalizations.instance.translate("logOut"),
                    style: const TextStyle(
                        fontSize: 16,
                        color: primary50,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void initialize() async {
    await inAppPurchase.isAvailable().then((value) async {
      if (value) {
        await _getProducts().whenComplete(() {
          subscription = inAppPurchase.purchaseStream.listen((event) {
            purchase.addAll(event);
            verifyPurchase();
          });
        });
      }
      if (mounted) setState(() {});
    });
  }

  checkIfDocsAreAvailable() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      List<ProductModel> items = List.of(HiveCRUD().myItems);
      if (items.isNotEmpty) {
        List<ProductModel> newItems = [];
        for (int i = 0; i < items.length; i++) {
          if (items[i].validity != null) {
            if (items[i].validity!.isAfter(DateTime.now())) {
              newItems.add(items[i]);
            }
          }
        }
        if (newItems != items) {
          ItemsRepository().rewriteItems(newItems);
        }
      }
    }
  }

  Future<void> _getProducts() async {
    try {
      Set<String> ids = <String>{
        'adblocker',
      };

      await InAppPurchase.instance
          .queryProductDetails(ids)
          .then((value) => setState(() {
                products = value.productDetails;
              }));
    } on PlatformException {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("smthWentWrong"));
    } catch (error) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("smthWentWrong"));
    }
  }

  findMatch(ProductDetails selectedItem) async {
    List<ProductModel> items = HiveCRUD().myItems;
    if (items.isNotEmpty) {
      bool isAdBlockerValid = items.any((item) =>
              item.id == "adblocker" &&
              item.validity!.isAfter(DateTime.now())) ||
          items.any((item) =>
              item.id == "block_all_ads" &&
              item.validity!.isAfter(DateTime.now()));

      if (!(selectedItem.id == 'adblocker' && isAdBlockerValid)) {
        item = selectedItem;
        idOfPrd = item.id;
        final PurchaseParam purchaseParam =
            PurchaseParam(productDetails: selectedItem);
        InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
        verifyPurchase();
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("adblockerExists"));
      }
    } else {
      item = selectedItem;
      idOfPrd = item.id;
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: selectedItem);
      InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
      verifyPurchase();
    }
  }

  PurchaseDetails? _hasPurchased(String productID) {
    for (var item in purchase) {
      if (item.productID == productID) {
        return item;
      }
    }
    return null;
  }

  verifyPurchase() {
    if (idOfPrd != "") {
      PurchaseDetails? purchaseDetails = _hasPurchased(idOfPrd);

      if (purchaseDetails != null &&
          purchaseDetails.status == PurchaseStatus.purchased &&
          purchaseDetails.status != PurchaseStatus.pending) {
        bought();
      }
    }
  }

  bought() async {
    ProductModel model = ProductModel(
      id: item.id,
      title: item.title,
      description: item.description,
      price: item.price,
      validity: DateTime.now().add(const Duration(days: 30)),
    );
    HiveCRUD hiveCRUD = HiveCRUD();
    List<ProductModel> items = hiveCRUD.myItems;
    items.add(model);
    await ItemsRepository().rewriteItems(items);
    idOfPrd = "";
    purchase = [];
    if (mounted) setState(() {});
    Fluttertoast.showToast(
      msg: AppLocalizations.instance.translate("enjoy"),
    );
  }
}
