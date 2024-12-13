sealed class ParserException implements Exception {
  const ParserException(this.message);

  final String message;
}

class IncorrectFilePathException extends ParserException {
  const IncorrectFilePathException(String path)
    : super('File: $path cannot be read');
}

class InvalidCsvHeadersException extends ParserException {
  const InvalidCsvHeadersException(super.message);

  @override
  String toString() {
    return 'InvalidCsvHeadersException($message)';
  }
}

class InvalidFormatException extends ParserException {
  const InvalidFormatException(super.message);
}
