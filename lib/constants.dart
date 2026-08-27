import 'package:flutter/foundation.dart';

const isRunningWasm = bool.fromEnvironment('dart.tool.dart2wasm');

const bool isRunningJs = kIsWeb && !isRunningWasm;
