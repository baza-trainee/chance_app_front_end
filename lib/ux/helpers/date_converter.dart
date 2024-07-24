import 'package:flutter/material.dart' show DateUtils;
import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromJson(String json) => DateUtils.dateOnly(DateTime.parse(json));

  @override
  String toJson(DateTime value) => DateTime.utc(
        value.year,
        value.month,
        value.day,
      ).toString();
}
