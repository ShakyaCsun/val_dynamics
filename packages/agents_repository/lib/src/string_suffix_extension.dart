import 'dart:math';

final _validCharacters =
    <(int, int)>[
      // Uppercase Alphabets
      (65, 90),
      // Lowercase Alphabets
      (97, 122),
    ].fold<List<String>>([], (result, pair) {
      final (begin, end) = pair;
      return [
        ...result,
        for (var i = begin; i <= end; i++) String.fromCharCode(i),
      ];
    });

final _count = _validCharacters.length;

final _random = Random.secure();

extension StringSuffixExtension on String {
  /// Returns the [String] with a random suffix of given [characterCount]
  String withRandomSuffix({int characterCount = 4}) {
    final suffix = [
      for (var i = 0; i < characterCount; i++)
        _validCharacters[_random.nextInt(_count)],
    ].join();
    return '$this-$suffix';
  }
}
