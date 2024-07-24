import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.color,
      required this.child,
      this.onPress,
      this.border,
      this.height,
      this.padding,
      this.tapColor,
      this.margin});

  final Color color;
  final Widget child;
  final Function()? onPress;
  final BoxBorder? border;
  final double? height;
  final EdgeInsets? padding, margin;
  final Color? tapColor;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    bool isDisabled = onPress == null;

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onPress,
        onHover: (v) {},
        splashColor: tapColor ?? Colors.transparent,
        focusColor: tapColor ?? Colors.transparent,
        highlightColor: tapColor ?? Colors.transparent,
        hoverColor: tapColor ?? Colors.transparent,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          constraints:
              height != 0 ? BoxConstraints(minHeight: height ?? 56) : null,
          decoration: BoxDecoration(
            color: isDisabled ? color.withOpacity(.4) : color,
            border: border,
            borderRadius: borderRadius,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
