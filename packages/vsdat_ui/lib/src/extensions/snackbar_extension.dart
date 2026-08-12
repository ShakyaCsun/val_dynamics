import 'package:material_ui/material_ui.dart';

extension SnackbarContextExtension on BuildContext {
  void showSnackbar(SnackBar snackBar) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
