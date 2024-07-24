import 'package:flutter/material.dart';

class SeparatedList extends StatelessWidget {
  const SeparatedList({
    required this.separator,
    this.axis = Axis.vertical,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.hasLeading = false,
    this.hasTrailing = false,
    this.children = const [],
    super.key,
  });

  final Widget separator;
  final Axis axis;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool hasLeading;
  final bool hasTrailing;
  final List<Widget> children;

  Iterable<Widget> _itemBuilder() sync* {
    if (hasLeading) yield separator;

    for (var i = 0; i < children.length; i++) {
      if (i > 0) yield separator;
      yield children[i];
    }

    if (hasTrailing) yield separator;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _itemBuilder().toList(growable: false),
    );
  }
}
