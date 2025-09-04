import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

void main() {
  group('AcmString', () {
    group('.fromStyles', () {
      test('generates correct ACM string', () {
        const stylePoints = (aggro: 26.1, control: 18.3, midrange: 5.6);
        final acmString = AcmString.fromStyles(stylePoints);

        expect(acmString, equals(AcmString('26.1-18.3-5.6')));
      });

      test('can be converted back to correct StylePoints', () {
        const stylePoints = (aggro: 26.10, control: 18.30, midrange: 5.60);
        final acmString = AcmString.fromStyles(stylePoints);

        expect(stylePoints, equals(acmString.stylePoints));
        expect(stylePoints, equals(AcmString('26.10-18.30-5.60').stylePoints));
      });
    });
  });
}
