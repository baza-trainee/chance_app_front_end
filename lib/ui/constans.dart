import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

const apiUrl = 'http://139.28.37.11:56565/stage/api';

const Color beigeTransparent = Color(0xfffbf6f0);
const Color beigeBG = Color(0xfffffdfc);
const Color beige0 = Color(0xffffffff);
const Color beige50 = Color(0xfffbf6f0);
const Color beige100 = Color(0xfff4eee7);
const Color beige200 = Color(0xffefe6db);
const Color beige300 = Color(0xffE5D9CB);
const Color beige400 = Color(0xffC6B098);
const Color beige500 = Color(0xffBD967A);
const Color beige600 = Color(0xff876C4F);
const Color beige800 = Color(0xff4E3B26); //Beige

const Color primaryText = Color(0xff212833);
const Color primary1000 = Color(0xff0E265D);
const Color primary900 = Color(0xff12327B);
const Color primary800 = Color(0xff0F3A9C);
const Color primary700 = Color(0xff0057FF);
const Color primary600 = Color(0xff066CFF);
const Color primary500 = Color(0xff1E8DFF);
const Color primary400 = Color(0xff48B1FF);
const Color primary300 = Color(0xff83CEFF);
const Color primary200 = Color(0xffB5E0FF);
const Color primary100 = Color(0xffD6ECFF);
const Color primary50 = Color(0xffEDF7FF); //primary

const Color darkNeutral1000 = Color(0xff212833);
const Color darkNeutral800 = Color(0xff354457);
const Color darkNeutral600 = Color(0xff4A627F);
const Color darkNeutral400 = Color(0xff7E97B2);
const Color darkNeutral300 = Color(0xffD8DEE6);
const Color grey = Color(0xffD9D9D9);

const Color red1000 = Color(0xff960000);
const Color red900 = Color(0xffb00000);
const Color red800 = Color(0xffFF4F4F);
const Color green = Color(0xff2E7A00);

const Color background = Color(0xffFFFDFC);

const String kDefaultAndroidIcon = "ic_stat_onesignal_default";

String getWeekdayName(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return AppLocalizations.instance.translate("mon").toUpperCase();
    case DateTime.tuesday:
      return AppLocalizations.instance.translate("tue").toUpperCase();
    case DateTime.wednesday:
      return AppLocalizations.instance.translate("wed").toUpperCase();
    case DateTime.thursday:
      return AppLocalizations.instance.translate("thu").toUpperCase();
    case DateTime.friday:
      return AppLocalizations.instance.translate("fri").toUpperCase();
    case DateTime.saturday:
      return AppLocalizations.instance.translate("sat").toUpperCase();
    case DateTime.sunday:
      return AppLocalizations.instance.translate("sun").toUpperCase();
    default:
      return '';
  }
}

String getMonthName(int month) {
  switch (month) {
    case DateTime.january:
      return AppLocalizations.instance.translate("january");
    case DateTime.february:
      return AppLocalizations.instance.translate("february");
    case DateTime.march:
      return AppLocalizations.instance.translate("march");
    case DateTime.april:
      return AppLocalizations.instance.translate("april");
    case DateTime.may:
      return AppLocalizations.instance.translate("may");
    case DateTime.june:
      return AppLocalizations.instance.translate("june");
    case DateTime.july:
      return AppLocalizations.instance.translate("july");
    case DateTime.august:
      return AppLocalizations.instance.translate("august");
    case DateTime.september:
      return AppLocalizations.instance.translate("september");
    case DateTime.october:
      return AppLocalizations.instance.translate("october");
    case DateTime.november:
      return AppLocalizations.instance.translate("november");
    case DateTime.december:
      return AppLocalizations.instance.translate("december");
    default:
      return '';
  }
}

final errors400 = {
  "400": AppLocalizations.instance.translate("error400"),
  "401": AppLocalizations.instance.translate("error401"),
  "403": AppLocalizations.instance.translate("error403"),
  "404": AppLocalizations.instance.translate("error404"),
  "405": AppLocalizations.instance.translate("error405"),
  "408": AppLocalizations.instance.translate("error408"),
  "429": AppLocalizations.instance.translate("error429"),
};
const Map<String, String> languages = {
  //"ar": "عرب",
  //"bg": "Български",
  //"cs": "Čeština",
  //"da": "Dansk",
  //"de": "Deutsch",
  //"el": "Ελληνικά",
  "en": "English",
  //"es": "Español",
  //"et": "Eesti keel",
  //"eu": "Euskara",
  //"fa": "فارسی",
  //"fi": "Suomalainen",
  //"fil": "Pilipinas",
  //"fr": "Français",
  //"hr": "Hrvatski",
  //"id": "Bahasa Indonesia",
  //"is": "Íslenskur",
  //"it": "Italiano",
  //"iw": "עִברִית",
  //"ja": "日本",
  //"ko": "한국인",
  //"lt": "Latviski",
  //"lv": "Lietuvių",
  //"mk": "Македонски",
  //"nl": "Nederlands",
  //"no": "Norsk",
  //"pl": "Polski",
  //"pt": "Português",
  //"ro": "Română",
  //"ru": "Русский",
  //"sk": "Slovenský",
  //"sl": "Slovenščina",
  //"sq": "Shqiptare",
  //"sr": "Српски",
  //"sv": "Svenska",
  //"tr": "Türkçe",
  "uk": "Українська",
  //"zh": "简体中文"
};

extension DateTimeUtils on DateTime {
  String get sinceDate {
    DateTime dateTimeNow = DateTime.now();

    if (-(difference(dateTimeNow)) <= const Duration(seconds: 30)) {
      return AppLocalizations.instance.translate("now");
    } else if (-(difference(dateTimeNow)) <= const Duration(minutes: 1)) {
      return AppLocalizations.instance.translate("lessThenMinuteAgo");
    } else if (-(difference(dateTimeNow)) <= const Duration(minutes: 5)) {
      return AppLocalizations.instance.translate("lessThenFiveMinuteAgo");
    } else {
      return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")} ${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year";
    }
  }
}
