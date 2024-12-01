import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.builder,
    this.isScrollControlled = false,
    this.showDragHandle = true,
    this.constraints,
  });

  final Widget Function(BuildContext context) builder;
  final bool isScrollControlled;

  /// Defines minimum and maximum sizes for a [BottomSheet].
  ///
  /// If null, the ambient [ThemeData.bottomSheetTheme]'s
  /// [BottomSheetThemeData.constraints] will be used. If that
  /// is null and [ThemeData.useMaterial3] is true, then the bottom sheet
  /// will have a max width of 640dp. If [ThemeData.useMaterial3] is false, then
  /// the bottom sheet's size will be constrained by its parent
  /// (usually a [Scaffold]). In this case, consider limiting the width by
  /// setting smaller constraints for large screens.
  ///
  /// If constraints are specified (either in this property or in the
  /// theme), the bottom sheet will be aligned to the bottom-center of
  /// the available space. Otherwise, no alignment is applied.
  final BoxConstraints? constraints;

  /// Specifies whether a drag handle is shown.
  ///
  /// The drag handle appears at the top of the bottom sheet. The default color
  /// is [ColorScheme.onSurfaceVariant] with an opacity of 0.4 and can be
  /// customized using dragHandleColor. The default size is `Size(32,4)` and
  /// can be customized with dragHandleSize.
  final bool showDragHandle;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      builder: builder,
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      enableDrag: false,
    );
  }
}

class DialogPage<T> extends Page<T> {
  const DialogPage({
    required this.builder,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
  });

  final WidgetBuilder builder;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute(
      settings: this,
      context: context,
      builder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
    );
  }
}
