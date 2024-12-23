// Const constructors mess with testing value equality between objects
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

void main() {
  group('Agent', () {
    test('can be instantiated', () {
      expect(
        Agent(
          name: 'Viper',
          aggro: 3,
          control: 5,
          midrange: 2,
          role: Role.controller,
        ),
        isNotNull,
      );
    });
  });
}
