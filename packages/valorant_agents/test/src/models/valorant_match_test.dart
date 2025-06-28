import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

void main() {
  group('ValorantMatch', () {
    final valorantMatch = ValorantMatch(
      mapName: 'Lotus',
      teamOne: Team(
        name: 'Team One',
        score: 13,
        attackScore: 6,
        agents: AgentComp(
          Agent.raze,
          Agent.fade,
          Agent.chamber,
          Agent.vyse,
          Agent.astra,
        ),
      ),
      teamTwo: Team(
        name: 'Team Two',
        score: 10,
        attackScore: 5,
        agents: AgentComp(
          Agent.raze,
          Agent.fade,
          Agent.killjoy,
          Agent.viper,
          Agent.omen,
        ),
      ),
    );
    group('.checkAgentNonMirror', () {
      test('returns yes for non-mirror agents in teamOne', () {
        expect(
          [
            Agent.chamber,
            Agent.vyse,
            Agent.astra,
          ].map(valorantMatch.checkAgentNonMirror),
          everyElement(NonMirror.yes),
        );
      });
      test('returns yesIfReversed for non-mirror agents in teamTwo', () {
        expect(
          [
            Agent.killjoy,
            Agent.viper,
            Agent.omen,
          ].map(valorantMatch.checkAgentNonMirror),
          everyElement(NonMirror.yesIfReversed),
        );
      });
      test('returns no for mirror agents', () {
        expect(
          [Agent.raze, Agent.fade].map(valorantMatch.checkAgentNonMirror),
          everyElement(NonMirror.no),
        );
      });
      test('returns no for non-existent agents', () {
        expect(
          [
            Agent.tejo,
            Agent.harbor,
            Agent.skye,
            Agent.clove,
          ].map(valorantMatch.checkAgentNonMirror),
          everyElement(NonMirror.no),
        );
      });
    });
    group('.satisfiesComboNM', () {
      NonMirror checkComboNM(
        (Agent, Agent) combo, {
        required ComboCriteria criteria,
      }) {
        final (agentOne, agentTwo) = combo;
        return valorantMatch.satisfiesComboNM(
          agentOne,
          agentTwo,
          criteria: criteria,
        );
      }

      test('returns yes for non-mirror agent combos in teamOne', () {
        final soloNonMirrorCombos = [
          (Agent.chamber, Agent.vyse),
          (Agent.astra, Agent.vyse),
          (Agent.chamber, Agent.astra),
        ];
        final compositeNonMirrorCombos = [
          ...soloNonMirrorCombos,
          (Agent.raze, Agent.chamber),
          (Agent.raze, Agent.vyse),
          (Agent.raze, Agent.astra),
          (Agent.fade, Agent.chamber),
          (Agent.fade, Agent.vyse),
          (Agent.fade, Agent.astra),
        ];
        expect(
          soloNonMirrorCombos.map(
            (combo) => checkComboNM(combo, criteria: ComboCriteria.solo),
          ),
          everyElement(NonMirror.yes),
        );
        expect(
          compositeNonMirrorCombos.map(
            (combo) => checkComboNM(combo, criteria: ComboCriteria.composite),
          ),
          everyElement(NonMirror.yes),
        );
      });
      test('returns yesIfReversed for non-mirror agent combos in teamTwo', () {
        final soloNonMirrorCombos = [
          (Agent.killjoy, Agent.viper),
          (Agent.omen, Agent.viper),
          (Agent.killjoy, Agent.omen),
        ];
        final compositeNonMirrorCombos = [
          ...soloNonMirrorCombos,
          (Agent.raze, Agent.killjoy),
          (Agent.raze, Agent.viper),
          (Agent.raze, Agent.omen),
          (Agent.fade, Agent.killjoy),
          (Agent.fade, Agent.viper),
          (Agent.fade, Agent.omen),
        ];
        expect(
          soloNonMirrorCombos.map(
            (combo) => checkComboNM(combo, criteria: ComboCriteria.solo),
          ),
          everyElement(NonMirror.yesIfReversed),
        );
        expect(
          compositeNonMirrorCombos.map(
            (combo) => checkComboNM(combo, criteria: ComboCriteria.composite),
          ),
          everyElement(NonMirror.yesIfReversed),
        );
      });
      test('returns no for mirrored agent combos', () {
        const mirroredCombo = (Agent.raze, Agent.fade);
        expect(
          checkComboNM(mirroredCombo, criteria: ComboCriteria.solo),
          equals(NonMirror.no),
        );
        expect(
          checkComboNM(mirroredCombo, criteria: ComboCriteria.composite),
          equals(NonMirror.no),
        );
      });
      test(
        'returns no for when combo criteria is solo and one agent is mirrored',
        () {
          expect(
            [
              (Agent.raze, Agent.killjoy),
              (Agent.raze, Agent.viper),
              (Agent.raze, Agent.omen),
              (Agent.fade, Agent.chamber),
              (Agent.fade, Agent.vyse),
              (Agent.fade, Agent.astra),
            ].map((combo) => checkComboNM(combo, criteria: ComboCriteria.solo)),
            everyElement(NonMirror.no),
          );
        },
      );
    });
  });
}
