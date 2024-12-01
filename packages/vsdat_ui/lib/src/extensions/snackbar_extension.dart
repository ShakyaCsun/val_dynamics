import 'package:flutter/material.dart';

extension SnackbarContextExtension on BuildContext {
  void showSnackbar(SnackBar snackBar) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
