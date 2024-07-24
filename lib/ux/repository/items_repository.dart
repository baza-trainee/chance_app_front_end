import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/api/api_client.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/product_model.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemsRepository {
  final _apiClient = const ApiClient();
  final _userRepository = UserRepository();

  Future<List<ProductModel>> getItems() async {
    List<ProductModel> items = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance
              .translate("noInternetConnectionConnection"),
          toastLength: Toast.LENGTH_LONG);
    } else {
      try {
        final cookie = await _userRepository.getCookie();
        final fetchedItems = await _apiClient.fetchProducts(
          cookie: cookie.toString(),
        );
        if (fetchedItems != null) {
          items = fetchedItems;
        }
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        FlutterError(e.toString());
      }
    }
    return items;
  }

  Future rewriteItems(List<ProductModel> newItems) async {
    List<ProductModel> dbItems = await getItems();
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
      HiveCRUD().rewriteItems(newItems);
    } else {
      try {
        final cookie = await _userRepository.getCookie();
        for (int i = 0; i < newItems.length; i++) {
          if (dbItems.any((element) => element.id != newItems[i].id)) {
            ///Add this item

            await _apiClient.postProduct(
              dbItems[i],
              cookie: cookie.toString(),
            );
          }
        }
        for (int i = 0; i < dbItems.length; i++) {
          if (newItems.any((element) => element.id != dbItems[i].id)) {
            /// Delete this item
            await _apiClient.deleteProduct(
              dbItems[i],
              cookie: cookie.toString(),
            );
          }
        }
        await HiveCRUD().rewriteItems(newItems);
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
  }
}

extension _ProductsClient on ApiClient {
  Future<List<ProductModel>?> fetchProducts({required String cookie}) async {
    try {
      final items = await get("/product", cookie: cookie) as List<dynamic>?;
      if (items == null) {
        return [];
      }
      return items.cast<Map<String, dynamic>>().map(_modelFromJson).toList();
    } catch (_) {
      return null;
    }
  }

  Future<ProductModel?> postProduct(
    ProductModel productModel, {
    required String cookie,
  }) async {
    try {
      final json = await post(
        "/product",
        cookie: cookie,
        json: _modelToJson(productModel),
      ) as Map<String, dynamic>?;
      if (json == null) {
        return null;
      }
      return _modelFromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<bool> deleteProduct(
    ProductModel productModel, {
    required String cookie,
  }) async {
    try {
      await delete(
        "/product/${productModel.id}",
        cookie: cookie.toString(),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Map<String, dynamic> _modelToJson(ProductModel productModel) {
    return productModel.toJson();
  }

  ProductModel _modelFromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
