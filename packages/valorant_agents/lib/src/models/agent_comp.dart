import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

sealed class AgentsParserException implements Exception {
  const AgentsParserException(this.message);

  final String message;
}

class InvalidTeamSizeException extends AgentsParserException {
  const InvalidTeamSizeException(super.message);
}

class AgentNotFoundException extends AgentsParserException {
  const AgentNotFoundException(super.message);
}

class AgentComp extends Equatable {
  const AgentComp(
    this.agent1,
    this.agent2,
    this.agent3,
    this.agent4,
    this.agent5,
  );

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
        case final Agent agent:
          return agent;
        case null:
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

  final Agent agent1;
  final Agent agent2;
  final Agent agent3;
  final Agent agent4;
  final Agent agent5;

  (Agent, Agent, Agent, Agent, Agent) get tuple {
    return (
      agents[0],
      agents[1],
      agents[2],
      agents[3],
      agents[4],
    );
  }

  List<Agent> get agents => [agent1, agent2, agent3, agent4, agent5]..sort(
      (a, b) {
        if (a.role == b.role) {
          return a.name.compareTo(b.name);
        }
        return a.role.index.compareTo(b.role.index);
      },
    );

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

  String get agentNames {
    return agentsGroup
        .map((group) => group.map((agent) => agent.name).join(', '))
        .join(' - ');
  }

  StylePoints get stylePoints {
    return agents.fold(
      (aggro: 0, control: 0, midrange: 0),
      (previousValue, element) {
        return previousValue + element.stylePoints;
      },
    );
  }

  bool hasAgent(Agent agent) {
    return agents.contains(agent);
  }

  bool hasRole(Role role) {
    return agents.map((agent) => agent.role).contains(role);
  }

  @override
  String toString() {
    return 'Agents(${agents.map((e) => e.name).join(',')})';
  }

  String prettyPrint({required String name}) {
    return '$name(agents: ${agents.map((e) => e.name).toList()}, '
        'acm: ${stylePoints.acm})';
  }

  @override
  List<Object> get props => [tuple];
}
