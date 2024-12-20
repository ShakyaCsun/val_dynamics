import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

final knownAgentBreakdowns = <Agent>{
  Agent.astra,
  Agent.clove,
  Agent.deadlock,
  Agent.iso,
  Agent.neon,
  Agent.phoenix,
  Agent.raze,
  Agent.sage,
  Agent.viper,
  Agent.vyse,
  Agent.yoru,
};

void main() {
  group('Agent', () {
    test('.validAbilitiesPoints', () {
      expect(
        knownAgentBreakdowns.map((e) {
          return e.validAbilityPoints;
        }).toList(),
        equals(List<bool>.generate(knownAgentBreakdowns.length, (_) => true)),
      );
    });
  });
}
