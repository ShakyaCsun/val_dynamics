import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

void main() {
  group('Light Theme', () {
    late Color background;
    setUp(() {
      background = const VsdatTheme().lightTheme.colorScheme.surfaceContainer;
    });
    testWidgets('aggro color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.aggro.dark,
      );
    });
    testWidgets('control color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.control.dark,
      );
    });
    testWidgets('midrange color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.midrange.dark,
      );
    });
  });
  group('Dark Theme', () {
    late Color background;
    setUp(() {
      background = const VsdatTheme().darkTheme.colorScheme.surfaceContainer;
    });
    testWidgets('aggro color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.aggro.light,
      );
    });
    testWidgets('control color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.control.light,
      );
    });
    testWidgets('midrange color meets textContrastGuideline', (tester) async {
      await tester.testTextContrast(
        background: background,
        foreground: ValColors.midrange.light,
      );
    });
  });
}

extension TextContrastTester on WidgetTester {
  Future<void> testTextContrast({
    required Color background,
    required Color foreground,
  }) async {
    final handle = ensureSemantics();
    final content = ColoredBox(
      color: background,
      child: Text(
        'Text contrast test',
        style: TextStyle(fontSize: 20, color: foreground),
      ),
    );
    await pumpWidget(MaterialApp(home: Scaffold(body: content)));
    await expectLater(this, meetsGuideline(textContrastGuideline));
    handle.dispose();
  }
}
