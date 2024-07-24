import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:chance_app/main.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart' show sha256;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<String?> sendLoginData(String email, String password) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }

      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/login');
        var salt = 'UVocjgjgXg8P7zIsC93kKlRU8sPbTBhsAMFLnLUPDRYFIWAk';
        var saltedPassword = salt + password;
        var bytes = utf8.encode(saltedPassword);
        var hash = sha256.convert(bytes);
        await http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {"password": hash.toString().substring(0, 13), "email": email}),
        )
            .then((value) async {
          final cookie = _parseCookieFromLogin(value);

          if (value.statusCode > 199 && value.statusCode < 300) {
            Map<String, dynamic> data = json.decode(value.body);
            UserCredential credential = await FirebaseAuth.instance
                .signInWithCustomToken(data['token']);
            var url = Uri.parse('$apiUrl/auth/me');
            await http.get(
              url,
              headers: <String, String>{
                'Content-Type': 'application/json',
                if (cookie != null) 'Cookie': cookie,
              },
            ).then((value) async {
              if (value.statusCode > 199 && value.statusCode < 300) {
                Map<String, dynamic> map = jsonDecode(value.body);
                MeUser meUser = MeUser.fromAPIJson(map);

                await FirebaseChatCore.instance.createUserInFirestore(
                  types.User(
                    firstName: meUser.name,
                    id: credential.user!.uid,
                    lastName: meUser.lastName,
                    metadata: {
                      'phone': map['phone'],
                    },
                  ),
                );
                await HiveCRUD().addUser(meUser);
              } else {
                error = jsonDecode(value.body)["message"]
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "");
                Fluttertoast.showToast(
                    msg: error!, toastLength: Toast.LENGTH_LONG);
              }
            });
          } else {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
            FirebaseCrashlytics.instance
                .recordError(error, StackTrace.fromString(error!));
          }
        });
      } catch (e, trace) {
        error = e.toString();
        log(error.toString());
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> sendRegisterData(String name, String lastName, String phone,
      String email, String password) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/register');
        var salt = 'UVocjgjgXg8P7zIsC93kKlRU8sPbTBhsAMFLnLUPDRYFIWAk';
        var saltedPassword = salt + password;
        var bytes = utf8.encode(saltedPassword);
        var hash = sha256.convert(bytes);
        await http
            .post(url,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                },
                body: jsonEncode({
                  "password": hash.toString().substring(0, 13),
                  "email": email,
                  "name": name,
                  "lastName": lastName,
                  "phone": phone,
                }))
            .then((value) async {
          if (value.statusCode > 199 && value.statusCode < 300) {
            String? cookie = value.headers['set-cookie'];
            saveCookie(cookie);
          } else {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          }
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> checkIsCodeValid(
      String code, String email, String passwordFirst) async {
    if (code.length != 4) {
      return AppLocalizations.instance.translate("theCodeMustBe4CharactersLong");
    }
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/confirm');
        await http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({"code": code, "email": email}),
        )
            .then((value) async {
          if (value.statusCode > 199 && value.statusCode < 300) {
            await sendLoginData(email, passwordFirst).then((value) {
              error = value;
            });
          } else {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          }
        });
      } catch (e, trace) {
        error = e.toString();
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> patchUserData(
      {String? name, String? lastName, String? phone, String? token}) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/user');
        await getCookie().then((cookie) async {
          await http
              .patch(url,
                  headers: <String, String>{
                    'Content-Type': 'application/json',
                    'Cookie': cookie.toString(),
                  },
                  body: jsonEncode({
                    if (name != null) "name": name,
                    if (lastName != null) "lastName": lastName,
                    if (phone != null) "phone": phone,
                    if (token != null) "deviceId": token,
                  }))
              .then((value) {
            if (!(value.statusCode > 199 && value.statusCode < 300)) {
              error = jsonDecode(value.body)["message"]
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "");
              Fluttertoast.showToast(
                  msg: error!, toastLength: Toast.LENGTH_LONG);
            }
          });
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> resendCode(String email) async {
    if (email.isEmpty) {
      return AppLocalizations.instance.translate("enterEmail");
    }
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/resend-code');
        await http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({"email": email}),
        )
            .then((value) {
          if (value.statusCode > 199 && value.statusCode < 300) {
          } else {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          }
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> forgotPassword(String email) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/forget-password');
        await http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({"email": email}),
        )
            .then((value) {
          if (value.statusCode > 199 && value.statusCode < 300) {
          } else {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          }
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<String?> resetPassword(
      String email, String code, String newPassword) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var salt = 'UVocjgjgXg8P7zIsC93kKlRU8sPbTBhsAMFLnLUPDRYFIWAk';
        var saltedPassword = salt + newPassword;
        var bytes = utf8.encode(saltedPassword);
        var hash = sha256.convert(bytes);
        var url = Uri.parse('$apiUrl/auth/reset-password');
        await http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "password": hash.toString().substring(0, 13),
            "email": email,
            "code": code
          }),
        )
            .then((value) async {
          if (!(value.statusCode > 199 && value.statusCode < 300)) {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          } else {
            await sendLoginData(email, newPassword).then((value) {
              error = value;
            });
          }
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<MeUser?> getUser() async {
    MeUser? meUser;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/me');
        final cookie = await getCookie();
        if (cookie != null) {
          await http.get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Cookie': cookie.toString(),
            },
          ).then((value) async {
            if (value.statusCode > 199 && value.statusCode < 300) {
              Map<String, dynamic> map = jsonDecode(value.body);
              meUser = MeUser.fromAPIJson(map);

              await HiveCRUD().addUser(meUser!);
              return meUser;
            } else {
              String error = jsonDecode(value.body)["message"]
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "");
              Fluttertoast.showToast(
                  msg: error, toastLength: Toast.LENGTH_LONG);
            }
          });
        }
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return meUser;
  }

  Future<bool> getIdTokenFromAuthCode() async {
    bool error = false;
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(signInOption: SignInOption.standard).signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((firebaseCredential) async {
      String? token = await firebaseCredential.user?.getIdToken();
      if (token != null) {
        if (await (Connectivity().checkConnectivity()) ==
            ConnectivityResult.none) {
          if (whichToastIsShowing != "noInternetConnection") {
            whichToastIsShowing = "noInternetConnection";
            unawaited(
                Future.delayed(const Duration(seconds: 5)).whenComplete(() {
              whichToastIsShowing = "";
            }));
          } else {
            Fluttertoast.showToast(
                msg:
                    AppLocalizations.instance.translate("noInternetConnection"),
                toastLength: Toast.LENGTH_LONG);
          }
        } else {
          var url = Uri.parse('$apiUrl/auth/google/$token');
          await http.post(url, headers: <String, String>{
            'Content-Type': 'application/json',
          }).then((value) async {
            final cookie = _parseCookieFromLogin(value);

            if (value.statusCode > 199 && value.statusCode < 300) {
              var url = Uri.parse('$apiUrl/auth/me');
              await http.get(
                url,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                  if (cookie != null) 'Cookie': cookie,
                },
              ).then((value) async {
                if (value.statusCode > 199 && value.statusCode < 300) {
                  Map<String, dynamic> map = jsonDecode(value.body);
                  MeUser meUser = MeUser.fromAPIJson(map);

                  await FirebaseChatCore.instance.createUserInFirestore(
                    types.User(
                      firstName: meUser.name,
                      id: firebaseCredential.user?.uid ?? '',
                      lastName: meUser.lastName,
                    ),
                  );
                  await HiveCRUD().addUser(meUser);
                } else {
                  error = true;
                  FirebaseCrashlytics.instance.recordError(
                      jsonDecode(value.body)["message"]
                          .toString()
                          .replaceAll("[", "")
                          .replaceAll("]", ""),
                      StackTrace.fromString(jsonDecode(value.body)["message"]
                          .toString()
                          .replaceAll("[", "")
                          .replaceAll("]", "")));
                }
              });
            } else {
              error = true;
              FirebaseCrashlytics.instance.recordError(
                  jsonDecode(value.body)["message"]
                      .toString()
                      .replaceAll("[", "")
                      .replaceAll("]", ""),
                  StackTrace.fromString(jsonDecode(value.body)["message"]
                      .toString()
                      .replaceAll("[", "")
                      .replaceAll("]", "")));
            }
          });
        }
      }
    });

    return error;
  }

  Future<String?> logout() async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/auth/logout');
        await FirebaseAuth.instance.signOut();
        final cookie = await getCookie();
        await http.post(url, headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        }).then((value) async {
          if (value.statusCode > 199 && value.statusCode < 300) {
            await deleteCookie();
            await HiveCRUD().removeUser();
          }
        });
      } catch (e, trace) {
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        Fluttertoast.showToast(
            msg: error.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return error;
  }

  String? _parseCookieFromLogin(http.Response response) {
    final rawCookie = response.headers['set-cookie'];
    if (rawCookie == null) return null;
    final index = rawCookie.indexOf(';');
    final cookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
    saveCookie(cookie);
    return cookie;
  }

  void saveCookie(String? header) async {
    try {
      await const FlutterSecureStorage()
          .write(key: "set-cookie", value: header)
          .whenComplete(() async {});
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e.toString(), trace);
    }
  }

  Future<String?> getCookie() async {
    String? cookie;
    try {
      cookie = await const FlutterSecureStorage().read(key: "set-cookie");
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e.toString(), trace);
    }

    return cookie;
  }

  Future<void> deleteCookie() async {
    try {
      await const FlutterSecureStorage().delete(key: "set-cookie");
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e.toString(), trace);
    }
  }

  Future<void> firstEnter() async {
    try {
      await const FlutterSecureStorage()
          .write(key: "first-enter", value: DateTime.now().toUtc().toString())
          .whenComplete(() async {});
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e.toString(), trace);
    }
  }

  Future<bool> isUserEnteredEarlier() async {
    bool firstEnter = false;
    try {
      firstEnter =
          await const FlutterSecureStorage().read(key: "first-enter") != null;
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e.toString(), trace);
    }

    return firstEnter;
  }
}
