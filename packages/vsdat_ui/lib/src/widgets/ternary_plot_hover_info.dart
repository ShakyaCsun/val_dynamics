import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

enum HoverAnchor { left, right }

/// {@template ternary_plot_hover_info}
/// A Widget to easily show items info on hover for [TernaryPlot].
///
/// Note: This widget uses [PortalTarget] to show hovered items info on top of
/// widget returned by [builder], so you have to add [Portal] to your app if you
/// use this widget.
/// {@endtemplate}
class TernaryPlotHoverInfo<T> extends StatefulWidget {
  /// {@macro ternary_plot_hover_info}
  const TernaryPlotHoverInfo({
    required this.builder,
    required this.itemBuilder,
    this.anchor = HoverAnchor.right,
    this.maxItems = 5,
    super.key,
  });

  /// Build a [Widget] for individual hovered item.
  ///
  /// The Widgets for each hovered item is shown in a [Column]
  final Widget Function(T item) itemBuilder;

  /// Usually build the [TernaryPlot] here and use the given function as
  /// callback for [TernaryPlot.onPointHovered].
  final Widget Function(
    BuildContext context,
    void Function(List<T> hoveredItems) hoveredItemsChanged,
  ) builder;

  final HoverAnchor anchor;

  /// Limit the number of items shown in the hover info column.
  ///
  /// Default is 5.
  final int maxItems;

  @override
  State<TernaryPlotHoverInfo<T>> createState() => _TernaryPlotHoverInfoState();
}

class _TernaryPlotHoverInfoState<T> extends State<TernaryPlotHoverInfo<T>> {
  final ValueNotifier<List<T>> itemsNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      anchor: switch (widget.anchor) {
        HoverAnchor.left => const Aligned(
            follower: Alignment.topLeft,
            target: Alignment.topLeft,
          ),
        HoverAnchor.right => const Aligned(
            follower: Alignment.topRight,
            target: Alignment.topRight,
          )
      },
      // visible: itemsNotifier.value.isNotEmpty,
      portalFollower: ValueListenableBuilder(
        valueListenable: itemsNotifier,
        builder: (context, items, child) {
          return ResponsivePadding(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: switch (widget.anchor) {
                HoverAnchor.left => CrossAxisAlignment.start,
                HoverAnchor.right => CrossAxisAlignment.end,
              },
              children: items.take(widget.maxItems).map((item) {
                return widget.itemBuilder(item);
              }).toList(),
            ),
          );
        },
      ),
      child: widget.builder(
        context,
        (hoveredItems) {
          itemsNotifier.value = hoveredItems;
        },
      ),
    );
  }
}
