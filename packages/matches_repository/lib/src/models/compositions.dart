import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

typedef Compositions = ({AgentComp compOne, AgentComp compTwo});

extension CompositionsExtension on ({AgentComp compOne, AgentComp compTwo}) {
  String get key => '${compOne.groupedAgentNames}-${compTwo.groupedAgentNames}';

  FastAgentComboMap<ComboNonMirror> calculateAvailableCombos() {
    final result = FastAgentComboMap<ComboNonMirror>();
    if (compOne == compTwo) {
      return result;
    }
    final (
      compOne: AgentComp(agents: agentsOne),
      compTwo: AgentComp(agents: agentsTwo),
    ) = this;

    for (final (i, agent) in agentsOne.indexed) {
      for (final otherAgent in agentsOne.skip(i + 1)) {
        final comboKey = (agent, otherAgent);
        switch ((agentsTwo.contains(agent), agentsTwo.contains(otherAgent))) {
          case (false, false):
            result[comboKey] = ComboNonMirror.yes;
          case (true, false) || (false, true):
            result[comboKey] = ComboNonMirror.composite;
          case (true, true):
            break;
        }
      }
    }
    for (final (i, agent) in agentsTwo.indexed) {
      for (final otherAgent in agentsTwo.skip(i + 1)) {
        final comboKey = (agent, otherAgent);
        switch ((agentsOne.contains(agent), agentsOne.contains(otherAgent))) {
          case (false, false):
            result[comboKey] = ComboNonMirror.yesIfReversed;
          case (true, false) || (false, true):
            result[comboKey] = ComboNonMirror.compositeIfReversed;
          case (true, true):
            break;
        }
      }
    }
    return result;
  }
}

extension MatchCompositionsExtension on ValorantMatch {
  Compositions get agentComps {
    return (compOne: teamOne.agents, compTwo: teamTwo.agents);
  }
}

enum ComboNonMirror {
  /// Indicates the agent combo is used in comp one but neither are used in two
  yes,

  /// Indicates the agent combo is used in comp two but neither are used in one
  yesIfReversed,

  /// Indicates the agent combo is used in comp one but one agent is used in two
  composite,

  /// Indicates the agent combo is used in comp two but one agent is used in one
  compositeIfReversed,

  /// Indicates the agent combo is not used in either comp.
  no,
}
