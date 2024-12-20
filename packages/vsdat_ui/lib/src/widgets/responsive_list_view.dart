import 'package:flutter/material.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ResponsiveListView<T> extends StatelessWidget {
  const ResponsiveListView({
    required this.items,
    required this.itemBuilder,
    this.padding,
    super.key,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return WidthConstrainedBox(child: itemBuilder(context, items[index]));
      },
      padding: padding,
    );
  }
}
