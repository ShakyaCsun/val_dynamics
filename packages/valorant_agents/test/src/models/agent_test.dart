import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

final knownAgentBreakdowns = <Agent>{
  Agent.astra,
  Agent.clove,
  Agent.deadlock,
  Agent.iso,
  Agent.neon,
  Agent.omen,
  Agent.phoenix,
  Agent.raze,
  Agent.sage,
  Agent.tejo,
  Agent.viper,
  Agent.vyse,
  Agent.yoru,
  Agent.waylay,
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
