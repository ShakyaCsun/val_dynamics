import 'package:flutter/material.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({
    this.color,
    super.key,
    this.text,
    this.image,
    this.radius,
    this.textColor,
    this.borderColor,
    this.borderWidth,
  });

  const CircleIndicator.filled({
    required Color this.color,
    this.borderWidth,
    super.key,
    this.text,
    this.image,
    this.radius,
    this.textColor,
    this.borderColor,
  });

  const CircleIndicator.bordered({
    required Color this.borderColor,
    this.borderWidth,
    this.color,
    super.key,
    this.text,
    this.image,
    this.radius,
    this.textColor,
  });

  final Color? color;
  final String? text;
  final double? radius;
  final ImageProvider? image;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final diameter = (radius ?? 16) * 2;
    final theme = Theme.of(context);
    final effectiveForegroundColor = textColor ??
        (color == null ? theme.colorScheme.onSurface : color!.onColor);
    final textStyle = theme.textTheme.labelLarge!.copyWith(
      color: effectiveForegroundColor,
    );
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: diameter,
        minWidth: diameter,
        maxWidth: diameter,
        maxHeight: diameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
            : null,
      ),
      foregroundDecoration: image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              ),
              border: borderColor != null
                  ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
                  : null,
              shape: BoxShape.circle,
            )
          : null,
      child: text == null
          ? null
          : Center(
              // Need to disable text scaling here so that the text doesn't
              // escape the avatar when the textScaleFactor is large.
              child: MediaQuery.withNoTextScaling(
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle.color),
                  child: DefaultTextStyle(
                    style: textStyle,
                    child: Text(text!),
                  ),
                ),
              ),
            ),
    );
  }
}
