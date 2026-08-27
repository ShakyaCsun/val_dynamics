import 'package:material_ui/material_ui.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class CircleIndicator extends ImplicitlyAnimatedWidget {
  const CircleIndicator({
    super.key,
    this.color,
    this.text,
    this.image,
    this.radius,
    this.textColor,
    this.borderColor,
    this.borderWidth,
  }) : super(duration: kThemeChangeDuration, curve: Easing.standard);

  final Color? color;
  final String? text;
  final double? radius;
  final ImageProvider? image;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  AnimatedWidgetBaseState<CircleIndicator> createState() =>
      _CircleIndicatorState();
}

class _CircleIndicatorState extends AnimatedWidgetBaseState<CircleIndicator> {
  BoxConstraintsTween? _constraints;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final diameter = (widget.radius ?? 16) * 2;
    _constraints = visitor(
      _constraints,
      BoxConstraints.tight(Size.square(diameter)),
      (dynamic value) => BoxConstraintsTween(begin: value as BoxConstraints),
    ) as BoxConstraintsTween?;
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    final CircleIndicator(
      :borderColor,
      :borderWidth,
      :color,
      :image,
      :text,
      :textColor,
    ) = widget;

    final theme = Theme.of(context);
    final effectiveForegroundColor =
        textColor ??
        (color == null ? theme.colorScheme.onSurface : color.onColor);
    final textStyle = theme.textTheme.labelLarge!.copyWith(
      color: effectiveForegroundColor,
    );
    return Container(
      constraints: _constraints?.evaluate(animation),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(color: borderColor, width: borderWidth ?? 1.0)
            : null,
      ),
      foregroundDecoration: image != null
          ? BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              border: borderColor != null
                  ? Border.all(color: borderColor, width: borderWidth ?? 1.0)
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
                child: DefaultTextStyle(
                  style: textStyle,
                  child: FittedBox(child: Text(text)),
                ),
              ),
            ),
    );
  }
}
