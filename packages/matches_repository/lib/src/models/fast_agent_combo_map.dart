import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template fast_agent_combo_map}
/// Creates a fast [Map] that uses (Agent, Agent) tuple as keys.
///
/// The faster map is due to using combo's simplified name string as a
/// canonicalized key.
/// Comparing string keys is faster than comparing (Agent, Agent) tuples.
///
/// Note: This fast AgentCombo map won't work in cases where agents can have
/// same name but are not equal to one another. Thankfully this is not the case
/// for our current use-cases.
/// {@endtemplate}
class FastAgentComboMap<V> extends CanonicalizedMap<String, (Agent, Agent), V> {
  /// {@macro fast_agent_combo_map}
  FastAgentComboMap() : super(_canonicalize);

  /// Creates a [FastAgentComboMap] that is initialized with the key/value pairs
  /// of [other].
  /// {@macro fast_agent_combo_map}
  FastAgentComboMap.from(Map<(Agent, Agent), V> other)
    : super.from(other, _canonicalize);

  /// Creates a [FastAgentComboMap] that is initialized with the key/value pairs
  /// of [entries].
  /// {@macro fast_agent_combo_map}
  FastAgentComboMap.fromEntries(Iterable<MapEntry<(Agent, Agent), V>> entries)
    : super.fromEntries(entries, _canonicalize);

  static String _canonicalize((Agent, Agent) agentCombo) {
    assert(
      agentCombo == agentCombo.normalized,
      'AgentCombo ${agentCombo.comboName} is not normalized.',
    );
    return agentCombo.comboName;
  }
}
