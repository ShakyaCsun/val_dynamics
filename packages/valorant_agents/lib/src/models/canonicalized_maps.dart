import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template agent_map}
/// Creates a fast [Map] that uses [Agent] as keys.
///
/// The faster map is due to using agent's name as a canonicalized key.
/// Comparing string keys is faster than comparing [Agent] objects.
///
/// Note: This fast Agent map won't work in cases where agents can have same
/// name but are not equal to one another. Thankfully this is not the case for
/// our current use-cases.
/// {@endtemplate}
class AgentMap<V> extends CanonicalizedMap<String, Agent, V> {
  /// {@macro agent_map}
  AgentMap() : super(_canonicalize);

  /// Creates a [AgentMap] that is initialized with the key/value pairs
  /// of [other].
  /// {@macro agent_map}
  AgentMap.from(Map<Agent, V> other) : super.from(other, _canonicalize);

  /// Creates a [AgentMap] that is initialized with the key/value pairs
  /// of [entries].
  /// {@macro agent_map}
  AgentMap.fromEntries(Iterable<MapEntry<Agent, V>> entries)
    : super.fromEntries(entries, _canonicalize);

  static String _canonicalize(Agent agent) {
    return agent.name;
  }
}

/// {@template agent_combo_map}
/// Creates a [Map] that uses (Agent, Agent) tuple as keys.
///
/// The faster map is due to using combo's simplified name string as a
/// canonicalized key.
/// Comparing string keys is faster than comparing (Agent, Agent) tuples.
///
/// Note: This fast AgentCombo map won't work in cases where agents can have
/// same name but are not equal to one another. Thankfully this is not the case
/// for our current use-cases.
/// {@endtemplate}
class AgentComboMap<V> extends CanonicalizedMap<String, (Agent, Agent), V> {
  /// {@macro agent_combo_map}
  AgentComboMap() : super(_canonicalize);

  /// Creates a [AgentComboMap] that is initialized with the key/value pairs
  /// of [other].
  /// {@macro agent_combo_map}
  AgentComboMap.from(Map<(Agent, Agent), V> other)
    : super.from(other, _canonicalize);

  /// Creates a [AgentComboMap] that is initialized with the key/value pairs
  /// of [entries].
  /// {@macro agent_combo_map}
  AgentComboMap.fromEntries(Iterable<MapEntry<(Agent, Agent), V>> entries)
    : super.fromEntries(entries, _canonicalize);

  static String _canonicalize((Agent, Agent) agentCombo) {
    assert(
      agentCombo == agentCombo.normalized,
      'AgentCombo ${agentCombo.comboName} is not normalized.',
    );
    return agentCombo.comboName;
  }
}

/// {@template agent_comp_map}
/// Creates a [Map] that uses [AgentComp] tuple as keys.
///
/// The faster map is due to using combo's simplified name string as a
/// canonicalized key.
/// Comparing string keys is faster than comparing AgentComp tuples.
///
/// Note: This fast AgentComp map won't work in cases where agents can have
/// same name but are not equal to one another. Thankfully this is not the case
/// for our current use-cases.
/// {@endtemplate}
class AgentCompMap<V> extends CanonicalizedMap<String, AgentComp, V> {
  /// {@macro agent_comp_map}
  AgentCompMap() : super(_canonicalize);

  /// Creates a [AgentCompMap] that is initialized with the key/value pairs
  /// of [other].
  /// {@macro agent_comp_map}
  AgentCompMap.from(Map<AgentComp, V> other) : super.from(other, _canonicalize);

  /// Creates a [AgentCompMap] that is initialized with the key/value pairs
  /// of [entries].
  /// {@macro agent_comp_map}
  AgentCompMap.fromEntries(Iterable<MapEntry<AgentComp, V>> entries)
    : super.fromEntries(entries, _canonicalize);

  static String _canonicalize(AgentComp agentComp) {
    return '$agentComp';
  }
}
