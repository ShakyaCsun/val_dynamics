import 'package:flutter/foundation.dart';

const isRunningWasm = bool.fromEnvironment('dart.tool.dart2wasm');

// Hack to ensure comps Icon doesn't get incorrectly tree-shaken in web
// ignore: prefer_const_declarations
bool isRunningJs = kIsWeb && !isRunningWasm;
