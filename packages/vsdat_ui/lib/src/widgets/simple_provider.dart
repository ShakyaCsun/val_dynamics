import 'package:flutter/widgets.dart';

class SimpleProvider<T> extends InheritedWidget {
  const SimpleProvider({required this.value, required super.child, super.key});

  final T value;

  static SimpleProvider<T>? maybeOf<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SimpleProvider<T>>();
  }

  static SimpleProvider<T> of<T>(BuildContext context) {
    final result = maybeOf<T>(context);
    assert(result != null, 'No InheritedProperty<T> found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SimpleProvider<T> oldWidget) =>
      value != oldWidget.value;
}

extension SimpleProviderExtension on BuildContext {
  T getProperty<T>() {
    return SimpleProvider.of<T>(this).value;
  }
}
