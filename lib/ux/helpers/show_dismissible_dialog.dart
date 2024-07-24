import 'dart:async' show Timer;

import 'package:flutter/material.dart';

Future<T?> showDismissibleDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Duration? dismissAfter,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
}) {
  void dismissCallback(BuildContext context) {
    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: useRootNavigator).pop();
  }

  Timer? timer;

  return showDialog<T>(
    context: context,
    builder: (context) {
      timer = (dismissAfter != null)
          ? Timer(dismissAfter, () => dismissCallback(context))
          : null;
      return builder(context);
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    traversalEdgeBehavior: traversalEdgeBehavior,
  ).whenComplete(() {
    if (timer?.isActive ?? false) timer!.cancel();
  });
}
