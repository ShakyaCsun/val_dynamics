import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template fast_agent_map}
/// Creates a fast [Map] that uses [Agent] as keys.
///
/// The faster map is due to using agent's name as a canonicalized key.
/// Comparing string keys is faster than comparing [Agent] objects.
///
/// Note: This fast Agent map won't work in cases where agents can have same
/// name but are not equal to one another. Thankfully this is not the case for
/// our current use-cases.
/// {@endtemplate}
class FastAgentMap<V> extends CanonicalizedMap<String, Agent, V> {
  /// {@macro fast_agent_map}
  FastAgentMap() : super(_canonicalize);

  /// Creates a [FastAgentMap] that is initialized with the key/value pairs
  /// of [other].
  /// {@macro fast_agent_map}
  FastAgentMap.from(Map<Agent, V> other) : super.from(other, _canonicalize);

  /// Creates a [FastAgentMap] that is initialized with the key/value pairs
  /// of [entries].
  /// {@macro fast_agent_map}
  FastAgentMap.fromEntries(Iterable<MapEntry<Agent, V>> entries)
    : super.fromEntries(entries, _canonicalize);

  static String _canonicalize(Agent agent) {
    return agent.name;
  }
}
