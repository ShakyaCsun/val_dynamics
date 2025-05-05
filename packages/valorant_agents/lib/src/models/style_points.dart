import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

enum Style {
  aggro('Aggro'),
  control('Control'),
  midrange('Midrange');

  const Style(this.label);

  final String label;

  @override
  String toString() {
    return label;
  }
}

typedef StylePoints = ({double aggro, double control, double midrange});

extension StylePointsExtension on StylePoints {
  StylePoints operator +(StylePoints other) {
    return (
      aggro: aggro + other.aggro,
      control: control + other.control,
      midrange: midrange + other.midrange,
    );
  }

  StylePoints operator -(StylePoints other) {
    return (
      aggro: aggro - other.aggro,
      control: control - other.control,
      midrange: midrange - other.midrange,
    );
  }

  /// Formatted String representing Aggro points
  String get A => aggro.formatted;

  /// Formatted String representing Control points
  String get C => control.formatted;

  /// Formatted String representing Midrange points
  String get M => midrange.formatted;

  /// Short representation of style points. i.e. A-C-M
  String get acm => '$A-$C-$M';

  double getStylePoint(Style style) {
    return switch (style) {
      Style.aggro => aggro,
      Style.control => control,
      Style.midrange => midrange,
    };
  }

  String getStylePretty(Style style) {
    return getStylePoint(style).formatted;
  }

  bool get isIntegerPoints {
    return aggro == aggro.roundToDouble() &&
        control == control.roundToDouble() &&
        midrange == midrange.roundToDouble();
  }

  double get total => aggro + control + midrange;

  ({
    (double, Style) primary,
    (double, Style) secondary,
    (double, Style) tertiary,
  })
  get _orderedPairs {
    final styles =
        [
          (aggro, Style.aggro),
          (control, Style.control),
          (midrange, Style.midrange),
        ].sorted((a, b) {
          return b.$1.compareTo(a.$1);
        }).toList();
    return (primary: styles[0], secondary: styles[1], tertiary: styles[2]);
  }

  ({Style primary, Style secondary, Style tertiary}) get styleOrder {
    final (
      primary: (_, primaryStyle),
      secondary: (_, secondaryStyle),
      tertiary: (_, tertiaryStyle),
    ) = _orderedPairs;
    return (
      primary: primaryStyle,
      secondary: secondaryStyle,
      tertiary: tertiaryStyle,
    );
  }

  ({double primary, double secondary, double tertiary}) get orderedPoints {
    final (
      primary: (primaryPoints, _),
      secondary: (secondaryPoints, _),
      tertiary: (tertiaryPoints, _),
    ) = _orderedPairs;
    return (
      primary: primaryPoints,
      secondary: secondaryPoints,
      tertiary: tertiaryPoints,
    );
  }

  ({double primary, double secondary, double tertiary}) orderedPercents({
    double? totalPoints,
  }) {
    final (:primary, :secondary, :tertiary) = orderedPoints;
    final correctTotal = totalPoints ?? total;
    return (
      primary: primary / correctTotal * 100,
      secondary: secondary / correctTotal * 100,
      tertiary: tertiary / correctTotal * 100,
    );
  }

  String prettyPrint({bool sorted = false}) {
    if (sorted) {
      final (:primary, :secondary, :tertiary) = styleOrder;
      return '$primary(${getStylePretty(primary)}) '
          '$secondary(${getStylePretty(secondary)}) '
          '$tertiary(${getStylePretty(tertiary)})';
    }
    return 'Aggro($A) Control($C) Midrange($M)';
  }

  StyleType get styleType => StyleType.fromStylePoints(this);

  /// Normalized to total of 100 points.
  ///
  /// Note: it is not guaranteed that the return [StylePoints] will total to
  /// exactly 100, because of how floating points work.
  StylePoints get normalized {
    final totalPoints = total;
    if (totalPoints == 100) {
      return this;
    }
    final aggroPercentage = aggro / totalPoints * 100;
    final controlPercentage = control / totalPoints * 100;
    final midrangePercentage = midrange / totalPoints * 100;
    return (
      aggro: aggroPercentage,
      control: controlPercentage,
      midrange: midrangePercentage,
    );
  }
}
