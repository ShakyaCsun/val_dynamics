// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Spacing value of the compact breakpoint according to
/// the material 3 design spec.
const double kMaterialCompactSpacing = 0;

/// Spacing value of the medium and up breakpoint according to
/// the material 3 design spec.
const double kMaterialMediumAndUpSpacing = 24;

/// Margin value of the compact breakpoint according to the material
/// design 3 spec.
const double kMaterialCompactMargin = 16;

/// Margin value of the medium breakpoint according to the material
/// design 3 spec.
const double kMaterialMediumAndUpMargin = 24;

/// Padding value of the compact breakpoint according to the material
/// design 3 spec.
const double kMaterialPadding = 4;

/// Padding value of the default padding for the navigation rail
const double kNavigationRailDefaultPadding = 8;

/// A group of standard breakpoints built according to the material
/// specifications for screen width size.
class Breakpoints {
  /// This is a standard breakpoint that can be used as a fallthrough in the
  /// case that no other breakpoint is active.
  ///
  /// It is active from a width of -1 dp to infinity.
  static const Breakpoint standard = Breakpoint.standard();

  /// A window whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint small = Breakpoint.small();

  /// A window whose width is greater than 0 dp.
  static const Breakpoint smallAndUp = Breakpoint.small(andUp: true);

  /// A desktop screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallDesktop = Breakpoint.small(
    platform: Breakpoint.desktop,
  );

  /// A mobile screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallMobile = Breakpoint.small(
    platform: Breakpoint.mobile,
  );

  /// A window whose width is between 600 dp and 840 dp.
  static const Breakpoint medium = Breakpoint.medium();

  /// A window whose width is greater than 600 dp.
  static const Breakpoint mediumAndUp = Breakpoint.medium(andUp: true);

  /// A desktop window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumDesktop = Breakpoint.medium(
    platform: Breakpoint.desktop,
  );

  /// A mobile window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumMobile = Breakpoint.medium(
    platform: Breakpoint.mobile,
  );

  /// A window whose width is between 840 dp and 1200 dp.
  static const Breakpoint mediumLarge = Breakpoint.mediumLarge();

  /// A window whose width is greater than 840 dp.
  static const Breakpoint mediumLargeAndUp = Breakpoint.mediumLarge(
    andUp: true,
  );

  /// A desktop window whose width is between 840 dp and 1200 dp.
  static const Breakpoint mediumLargeDesktop = Breakpoint.mediumLarge(
    platform: Breakpoint.desktop,
  );

  /// A mobile window whose width is between 840 dp and 1200 dp.
  static const Breakpoint mediumLargeMobile = Breakpoint.mediumLarge(
    platform: Breakpoint.mobile,
  );

  /// A window whose width is between 1200 dp and 1600 dp.
  static const Breakpoint large = Breakpoint.large();

  /// A window whose width is greater than 1200 dp.
  static const Breakpoint largeAndUp = Breakpoint.large(andUp: true);

  /// A desktop window whose width is between 1200 dp and 1600 dp.
  static const Breakpoint largeDesktop = Breakpoint.large(
    platform: Breakpoint.desktop,
  );

  /// A mobile window whose width is between 1200 dp and 1600 dp.
  static const Breakpoint largeMobile = Breakpoint.large(
    platform: Breakpoint.mobile,
  );

  /// A window whose width is greater than 1600 dp.
  static const Breakpoint extraLarge = Breakpoint.extraLarge();

  /// A desktop window whose width is greater than 1600 dp.
  static const Breakpoint extraLargeDesktop = Breakpoint.extraLarge(
    platform: Breakpoint.desktop,
  );

  /// A mobile window whose width is greater than 1600 dp.
  static const Breakpoint extraLargeMobile = Breakpoint.extraLarge(
    platform: Breakpoint.mobile,
  );

  /// A list of all the standard breakpoints.
  static const List<Breakpoint> all = <Breakpoint>[
    smallDesktop,
    smallMobile,
    small,
    mediumDesktop,
    mediumMobile,
    medium,
    mediumLargeDesktop,
    mediumLargeMobile,
    mediumLarge,
    largeDesktop,
    largeMobile,
    large,
    extraLargeDesktop,
    extraLargeMobile,
    extraLarge,
    smallAndUp,
    mediumAndUp,
    mediumLargeAndUp,
    largeAndUp,
    standard,
  ];
}

/// A class to define the conditions that distinguish between types of
/// screens.
///
/// Adaptive apps usually display differently depending on the screen type: a
/// compact layout for smaller screens, or a relaxed layout for larger screens.
/// Override this class by defining `isActive` to fetch the screen property
/// (usually `MediaQuery.of`) and return true if the condition is met.
///
/// Breakpoints do not need to be exclusive because they are tested in order
/// with the last Breakpoint active taking priority.
class Breakpoint {
  /// Returns a const [Breakpoint] with the given constraints.
  const Breakpoint({
    this.beginWidth,
    this.endWidth,
    this.beginHeight,
    this.endHeight,
    this.andUp = false,
    this.platform,
    this.spacing = kMaterialMediumAndUpSpacing,
    this.margin = kMaterialMediumAndUpMargin,
    this.padding = kMaterialPadding,
    this.recommendedPanes = 1,
    this.maxPanes = 1,
  });

  /// Returns a [Breakpoint] that can be used as a fallthrough in the
  /// case that no other breakpoint is active.
  const Breakpoint.standard({this.platform})
    : beginWidth = -1,
      endWidth = null,
      beginHeight = null,
      endHeight = null,
      spacing = kMaterialMediumAndUpSpacing,
      margin = kMaterialMediumAndUpMargin,
      padding = kMaterialPadding,
      recommendedPanes = 1,
      maxPanes = 1,
      andUp = true;

  /// Returns a [Breakpoint] with the given constraints for a small screen.
  const Breakpoint.small({this.andUp = false, this.platform})
    : beginWidth = 0,
      endWidth = 600,
      beginHeight = null,
      endHeight = 480,
      spacing = kMaterialCompactSpacing,
      margin = kMaterialCompactMargin,
      padding = kMaterialPadding,
      recommendedPanes = 1,
      maxPanes = 1;

  /// Returns a [Breakpoint] with the given constraints for a medium screen.
  const Breakpoint.medium({this.andUp = false, this.platform})
    : beginWidth = 600,
      endWidth = 840,
      beginHeight = 480,
      endHeight = 900,
      spacing = kMaterialMediumAndUpSpacing,
      margin = kMaterialMediumAndUpMargin,
      padding = kMaterialPadding * 2,
      recommendedPanes = 1,
      maxPanes = 2;

  /// Returns a [Breakpoint] with the given constraints for a mediumLarge
  /// screen.
  const Breakpoint.mediumLarge({this.andUp = false, this.platform})
    : beginWidth = 840,
      endWidth = 1200,
      beginHeight = 900,
      endHeight = null,
      spacing = kMaterialMediumAndUpSpacing,
      margin = kMaterialMediumAndUpMargin,
      padding = kMaterialPadding * 3,
      recommendedPanes = 2,
      maxPanes = 2;

  /// Returns a [Breakpoint] with the given constraints for a large screen.
  const Breakpoint.large({this.andUp = false, this.platform})
    : beginWidth = 1200,
      endWidth = 1600,
      beginHeight = 900,
      endHeight = null,
      spacing = kMaterialMediumAndUpSpacing,
      margin = kMaterialMediumAndUpMargin,
      padding = kMaterialPadding * 4,
      recommendedPanes = 2,
      maxPanes = 2;

  /// Returns a [Breakpoint] with the given constraints for an extraLarge
  /// screen.
  const Breakpoint.extraLarge({this.andUp = false, this.platform})
    : beginWidth = 1600,
      endWidth = null,
      beginHeight = 900,
      endHeight = null,
      spacing = kMaterialMediumAndUpSpacing,
      margin = kMaterialMediumAndUpMargin,
      padding = kMaterialPadding * 5,
      recommendedPanes = 2,
      maxPanes = 3;

  /// A set of [TargetPlatform]s that the [Breakpoint] will be active on
  /// desktop.
  static const Set<TargetPlatform> desktop = <TargetPlatform>{
    TargetPlatform.linux,
    TargetPlatform.macOS,
    TargetPlatform.windows,
  };

  /// A set of [TargetPlatform]s that the [Breakpoint] will be active on mobile.
  static const Set<TargetPlatform> mobile = <TargetPlatform>{
    TargetPlatform.android,
    TargetPlatform.fuchsia,
    TargetPlatform.iOS,
  };

  /// When set to true, it will include any size above the set width and set
  /// height.
  final bool andUp;

  /// The beginning width dp value. If left null then the [Breakpoint] will have
  /// no lower bound.
  final double? beginWidth;

  /// The end width dp value. If left null then the [Breakpoint] will have no
  /// upper bound.
  final double? endWidth;

  /// The beginning height dp value. If left null then the [Breakpoint] will
  /// have no lower bound.
  final double? beginHeight;

  /// The end height dp value. If left null then the [Breakpoint] will have no
  /// upper bound.
  final double? endHeight;

  /// A Set of [TargetPlatform]s that the [Breakpoint] will be active on. If
  /// left null then it will be active on all platforms.
  final Set<TargetPlatform>? platform;

  /// The default material spacing for the [Breakpoint].
  final double spacing;

  /// The default material margin for the [Breakpoint].
  final double margin;

  /// The default material padding for the [Breakpoint].
  final double padding;

  /// The material recommended number of panes for the [Breakpoint].
  final int recommendedPanes;

  /// The material maximum number of panes that can be displayed on the
  /// [Breakpoint].
  final int maxPanes;

  /// A method that returns true based on conditions related to the context of
  /// the screen such as MediaQuery.sizeOf(context).width,
  /// MediaQuery.sizeOf(context).height and MediaQuery.orientationOf(context).
  bool isActive(BuildContext context) {
    final host = Theme.of(context).platform;
    final isRightPlatform = platform?.contains(host) ?? true;

    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final orientation = MediaQuery.orientationOf(context);
    final isPortrait = orientation == Orientation.portrait;

    final lowerBoundWidth = beginWidth ?? double.negativeInfinity;
    final upperBoundWidth = endWidth ?? double.infinity;

    final lowerBoundHeight = beginHeight ?? double.negativeInfinity;
    final upperBoundHeight = endHeight ?? double.infinity;

    final isWidthActive = andUp
        ? width >= lowerBoundWidth
        : width >= lowerBoundWidth && width < upperBoundWidth;

    final isHeightActive = isPortrait || isWidthActive || andUp
        ? isWidthActive || height >= lowerBoundHeight
        : height >= lowerBoundHeight && height < upperBoundHeight;

    return isWidthActive && isHeightActive && isRightPlatform;
  }

  /// Returns the default [Breakpoint] based on the [BuildContext].
  static Breakpoint defaultBreakpointOf(BuildContext context) {
    return activeBreakpointIn(context, Breakpoints.all) ?? Breakpoints.standard;
  }

  /// Returns the currently active [Breakpoint] based on the [BuildContext] and
  /// a list of [Breakpoint]s.
  static Breakpoint? activeBreakpointIn(
    BuildContext context,
    List<Breakpoint> breakpoints,
  ) {
    Breakpoint? currentBreakpoint;

    for (final breakpoint in breakpoints) {
      if (breakpoint.isActive(context)) {
        if (breakpoint.platform != null) {
          // Prioritize platform-specific breakpoints.
          return breakpoint;
        } else {
          // Fallback to non-platform-specific.
          currentBreakpoint = breakpoint;
        }
      }
    }
    return currentBreakpoint;
  }

  /// Returns true if the current platform is Desktop.
  static bool isDesktop(BuildContext context) {
    return Breakpoint.desktop.contains(Theme.of(context).platform);
  }

  /// Returns true if the current platform is Mobile.
  static bool isMobile(BuildContext context) {
    return Breakpoint.mobile.contains(Theme.of(context).platform);
  }

  /// Returns true if this [Breakpoint] is greater than the given [Breakpoint].
  bool operator >(Breakpoint breakpoint) {
    return (beginWidth ?? double.negativeInfinity) >
            (breakpoint.beginWidth ?? double.negativeInfinity) &&
        (endWidth ?? double.infinity) >
            (breakpoint.endWidth ?? double.infinity) &&
        (beginHeight ?? double.negativeInfinity) >
            (breakpoint.beginHeight ?? double.negativeInfinity) &&
        (endHeight ?? double.infinity) >
            (breakpoint.endHeight ?? double.infinity);
  }

  /// Returns true if this [Breakpoint] is less than the given [Breakpoint].
  bool operator <(Breakpoint breakpoint) {
    return (endWidth ?? double.infinity) <
            (breakpoint.endWidth ?? double.infinity) &&
        (beginWidth ?? double.negativeInfinity) <
            (breakpoint.beginWidth ?? double.negativeInfinity) &&
        (endHeight ?? double.infinity) <
            (breakpoint.endHeight ?? double.infinity) &&
        (beginHeight ?? double.negativeInfinity) <
            (breakpoint.beginHeight ?? double.negativeInfinity);
  }

  /// Returns true if this [Breakpoint] is greater than or equal to the
  /// given [Breakpoint].
  bool operator >=(Breakpoint breakpoint) {
    return (beginWidth ?? double.negativeInfinity) >=
            (breakpoint.beginWidth ?? double.negativeInfinity) &&
        (endWidth ?? double.infinity) >=
            (breakpoint.endWidth ?? double.infinity) &&
        (beginHeight ?? double.negativeInfinity) >=
            (breakpoint.beginHeight ?? double.negativeInfinity) &&
        (endHeight ?? double.infinity) >=
            (breakpoint.endHeight ?? double.infinity);
  }

  /// Returns true if this [Breakpoint] is less than or equal to the
  /// given [Breakpoint].
  bool operator <=(Breakpoint breakpoint) {
    return (endWidth ?? double.infinity) <=
            (breakpoint.endWidth ?? double.infinity) &&
        (beginWidth ?? double.negativeInfinity) <=
            (breakpoint.beginWidth ?? double.negativeInfinity) &&
        (endHeight ?? double.infinity) <=
            (breakpoint.endHeight ?? double.infinity) &&
        (beginHeight ?? double.negativeInfinity) <=
            (breakpoint.beginHeight ?? double.negativeInfinity);
  }

  /// Returns true if this [Breakpoint] is between the given [Breakpoint]s.
  bool between(Breakpoint lower, Breakpoint upper) {
    return this >= lower && this < upper;
  }
}

const _breakpoints = [
  Breakpoint.extraLarge(),
  Breakpoint.large(),
  Breakpoint.mediumLarge(),
  Breakpoint.medium(),
  Breakpoint.small(),
];

Breakpoint getBreakpointOf(BuildContext context) {
  final biggestBreakpoint = _breakpoints.firstWhere(
    (breakpoint) => breakpoint.isActive(context),
    orElse: () {
      // Should never happen, but a safe fallback regardless
      return Breakpoints.standard;
    },
  );
  return biggestBreakpoint;
}

/// returns 0 for smallest [Breakpoint] and increases accordingly.
int getBreakpointSize(Breakpoint breakpoint) {
  final index = _breakpoints.indexWhere((element) => element == breakpoint);
  if (index < 0) {
    return 0;
  }
  return (_breakpoints.length - 1) - index;
}

extension BuildContextBreakpointsExtension on BuildContext {
  bool get mediumLargeAndUp {
    return const Breakpoint.mediumLarge(andUp: true).isActive(this);
  }

  bool get largeAndUp {
    return const Breakpoint.large(andUp: true).isActive(this);
  }

  /// Show a standard drawer if true, else show modal drawer.
  ///
  /// https://m3.material.io/components/navigation-drawer/guidelines#38800092-0149-4251-ac75-4ce8a144042a
  bool get showStandardDrawer {
    return MediaQuery.sizeOf(this).width > 840;
  }
}
