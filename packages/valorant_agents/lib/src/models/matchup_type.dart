import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

sealed class MatchupType extends Equatable {
  const MatchupType({required this.inverse});

  factory MatchupType.fromStyles({
    required StylePoints one,
    required StylePoints two,
  }) {
    final diff = one - two;
    if (diff == (aggro: 0.0, control: 0.0, midrange: 0.0)) {
      return const StylisticallySimilar();
    }
    final (:primary, :secondary, :tertiary) = diff.orderedPercents(
      totalPoints: one.total,
    );
    final major = [primary, secondary, tertiary]
        .map(
          (e) => e.abs(),
        )
        .max;
    if (major <= 4.0) {
      return const StylisticallySimilar();
    }
    final (primary: oneStyle, secondary: _, tertiary: twoStyle) =
        diff.styleOrder;
    if (secondary.abs() <= 1.0) {
      return MatchupType._pure(oneStyle, twoStyle);
    }
    if (major == primary) {
      if ((secondary - tertiary) <= 4.0) {
        return const NonHybridVsHybrid();
      }
      return MatchupType._pure(oneStyle, twoStyle);
    } else {
      if ((primary - secondary) <= 4.0) {
        return const NonHybridVsHybrid(inverse: true);
      }
      return MatchupType._pure(oneStyle, twoStyle);
    }
  }

  factory MatchupType.fromStylesGeometry({
    required StylePoints one,
    required StylePoints two,
  }) {
    // final diff = one - two;
    // if (diff == (aggro: 0.0, control: 0.0, midrange: 0.0)) {
    //   return const StylisticallySimilar();
    // }
    // final (:primary, :secondary, :tertiary) = diff.orderedPercents(
    //   totalPoints: one.total,
    // );
    // final major = [primary, secondary, tertiary]
    //     .map(
    //       (e) => e.abs(),
    //     )
    //     .max;
    // if (major <= 4.0) {
    //   return const StylisticallySimilar();
    // }
    final slope = math.sqrt(3) *
        (two.aggro - one.aggro) /
        (2 * (two.midrange - one.midrange) + two.aggro - one.aggro);
    final angle = math.atan(slope) * 180 / math.pi;

    bool nearsAngle(
      double targetAngle, {
      double buffer = 7,
    }) {
      return angle > targetAngle - buffer && angle < targetAngle + buffer;
    }

    if (nearsAngle(60)) {
      return AggroVsControl(inverse: two.aggro > one.aggro);
    }
    if (nearsAngle(-60)) {
      return MidrangeVsAggro(inverse: two.aggro > one.aggro);
    }
    if (nearsAngle(0)) {
      return ControlVsMidrange(inverse: two.control > one.control);
    }
    if (nearsAngle(30)) {
      return NonHybridVsHybrid(inverse: two.control > one.control);
    }
    if (nearsAngle(-30)) {
      return NonHybridVsHybrid(inverse: two.midrange > one.midrange);
    }
    if (nearsAngle(90) || nearsAngle(-90)) {
      return NonHybridVsHybrid(inverse: two.aggro > one.aggro);
    }
    return const StylisticallySimilar();
  }

  factory MatchupType._pure(Style one, Style two) {
    switch ((one, two)) {
      case (Style.aggro, Style.control):
        return const AggroVsControl();
      case (Style.control, Style.aggro):
        return const AggroVsControl(inverse: true);
      case (Style.control, Style.midrange):
        return const ControlVsMidrange();
      case (Style.midrange, Style.control):
        return const ControlVsMidrange(inverse: true);
      case (Style.midrange, Style.aggro):
        return const MidrangeVsAggro();
      case (Style.aggro, Style.midrange):
        return const MidrangeVsAggro(inverse: true);
      case (_, _):
        throw StateError(
          'Primary Style cannot be same as Tertiary Style. '
          'But we got $one for both.',
        );
    }
  }

  final bool inverse;
}

class AggroVsControl extends MatchupType {
  const AggroVsControl({super.inverse = false});

  @override
  String toString() {
    return switch (inverse) {
      true => 'Control vs Aggro',
      false => 'Aggro vs Control',
    };
  }

  @override
  List<Object?> get props => [inverse];
}

class ControlVsMidrange extends MatchupType {
  const ControlVsMidrange({super.inverse = false});

  @override
  String toString() {
    return switch (inverse) {
      true => 'Midrange vs Control',
      false => 'Control vs Midrange',
    };
  }

  @override
  List<Object?> get props => [inverse];
}

class MidrangeVsAggro extends MatchupType {
  const MidrangeVsAggro({super.inverse = false});

  @override
  String toString() {
    return switch (inverse) {
      true => 'Aggro vs Midrange',
      false => 'Midrange vs Aggro',
    };
  }

  @override
  List<Object?> get props => [inverse];
}

class NonHybridVsHybrid extends MatchupType {
  const NonHybridVsHybrid({super.inverse = false});

  @override
  String toString() {
    return switch (inverse) {
      true => 'Hybrid vs Non-Hybrid',
      false => 'Non-Hybrid vs Hybrid',
    };
  }

  @override
  List<Object?> get props => [inverse];
}

class StylisticallySimilar extends MatchupType {
  const StylisticallySimilar() : super(inverse: false);

  @override
  String toString() {
    return 'Stylistically Similar(cannot be divided)';
  }

  @override
  List<Object?> get props => [];
}
