import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class CircleArea extends Circle {
  CircleArea({
    required super.center,
    required super.radius,
    Color? fillColor,
    Color? strokeColor,
    super.strokeWidth = 2,
  }) : super(
          circleId: CircleId(const Uuid().v4()),
          fillColor: fillColor ?? Colors.blue.withAlpha(32),
          strokeColor: strokeColor ?? Colors.blue.withAlpha(192),
        );
}
