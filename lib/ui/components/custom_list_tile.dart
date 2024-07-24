import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    required this.content,
    this.svgIcon,
    this.trailing,
    this.isSelected = false,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final Widget content;
  final String? svgIcon;
  final Widget? trailing;
  final bool isSelected;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  var _isActive = false;

  @override
  Widget build(BuildContext context) {
    const background = Colors.transparent;
    const foreground = Colors.white;
    const activeBackground = foreground;
    const activeForeground = Color(0xFF212833);

    return GestureDetector(
      onTapDown: (widget.onTap != null)
          ? (_) => setState(() => _isActive = true)
          : null,
      onTapUp: (widget.onTap != null)
          ? (_) {
              widget.onTap!.call();
              setState(() => _isActive = false);
            }
          : null,
      onTapCancel: (widget.onTap != null)
          ? () => setState(() => _isActive = false)
          : null,
      child: Material(
        color: (widget.isSelected || _isActive) ? activeBackground : background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: foreground),
        ),
        child: Padding(
          padding: widget.padding,
          child: Row(
            children: [
              if (widget.svgIcon != null) ...[
                SvgPicture.asset(
                  widget.svgIcon!,
                  color: (widget.isSelected || _isActive)
                      ? activeForeground
                      : foreground,
                ),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 16,
                    color: (widget.isSelected || _isActive)
                        ? activeForeground
                        : foreground,
                  ),
                  child: widget.content,
                ),
              ),
              if (widget.trailing != null) ...[
                const SizedBox(width: 4),
                widget.trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
