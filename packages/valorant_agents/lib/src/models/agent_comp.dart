import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

sealed class AgentsParserException extends Equatable implements Exception {
  const AgentsParserException(this.message);

  final String message;
}

class InvalidTeamSizeException extends AgentsParserException {
  const InvalidTeamSizeException(super.message);

  @override
  List<Object> get props => [message];
}

class AgentNotFoundException extends AgentsParserException {
  const AgentNotFoundException(super.message);

  @override
  List<Object> get props => [message];
}

class AgentComp extends Equatable {
  AgentComp(
    Agent agent1,
    Agent agent2,
    Agent agent3,
    Agent agent4,
    Agent agent5,
  ) : agents = List.unmodifiable(
        [agent1, agent2, agent3, agent4, agent5].sorted((a, b) {
          if (a.role == b.role) {
            return a.name.compareTo(b.name);
          }
          return a.role.index.compareTo(b.role.index);
        }),
      ),
      stylePoints =
          agent1.stylePoints +
          agent2.stylePoints +
          agent3.stylePoints +
          agent4.stylePoints +
          agent5.stylePoints;

  factory AgentComp.fromAgentNames(
    String agents, {
    required Map<String, Agent> agentsMap,
  }) {
    final agentNames = agents.split(',');
    if (agentNames.length != 5) {
      throw InvalidTeamSizeException(
        'Team must have 5 agents. $agents is not valid',
      );
    }
    Agent getAgent(String name) {
      switch (agentsMap[name]) {
        case final agent?:
          return agent;
        default:
          throw AgentNotFoundException('Agent $name not found');
      }
    }

    return AgentComp(
      getAgent(agentNames[0]),
      getAgent(agentNames[1]),
      getAgent(agentNames[2]),
      getAgent(agentNames[3]),
      getAgent(agentNames[4]),
    );
  }

  final List<Agent> agents;

  final StylePoints stylePoints;

  late final Set<String> agentNames = Set.unmodifiable(
    agents.map((e) => e.name),
  );

  late final Map<Role, int> roleCounts = Map.unmodifiable({
    for (final group in agentsGroup) group.first.role: group.length,
  });

  List<List<Agent>> get agentsGroup {
    final group = <List<Agent>>[];
    var role = agents[0].role;
    var roleAgents = <Agent>[];
    for (final agent in agents) {
      if (agent.role == role) {
        roleAgents.add(agent);
      } else {
        role = agent.role;
        group.add(roleAgents);
        roleAgents = [agent];
      }
    }
    group.add(roleAgents);
    return group;
  }

  /// Agent names of same roles are separated by ',' and agents of
  /// different roles are then separated by ' - '.
  late final String groupedAgentNames = agentsGroup
      .map((group) => group.map((agent) => agent.name).join(', '))
      .join(' - ');

  bool hasAgent(Agent agent) {
    return agents.contains(agent);
  }

  bool hasAgentName(String name) {
    return agentNames.contains(name);
  }

  bool hasRole(Role role) {
    return roleCounts.keys.contains(role);
  }

  @override
  String toString() {
    return 'Agents(${agents.map((e) => e.name).join(',')})';
  }

  String prettyPrint({required String name}) {
    return '$name(agents: $groupedAgentNames, acm: ${stylePoints.acm})';
  }

  @override
  List<Object> get props => [agents];
}
