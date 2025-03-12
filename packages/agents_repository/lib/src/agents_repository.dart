import 'package:agents_repository/src/string_suffix_extension.dart';
import 'package:rxdart/rxdart.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template agents_repository}
/// A repository for agents and their style points scoring
/// {@endtemplate}
class AgentsRepository {
  /// {@macro agents_repository}
  ///
  /// [AgentsRepository.basic] creates a basic initial roster using latest Style
  /// Dynamics 2.0 agent scoring as default and a SD2 rated agents of Champions
  /// 2024.
  AgentsRepository.basic({Map<String, Agents>? agentsCsvs})
    : _builtInRosterNames = [
        'Default SD2',
        'Champions 2024 SD2',
        ...?agentsCsvs?.keys,
      ] {
    final rosters = {
      'Default SD2': Agents.defaultRoster,
      'Champions 2024 SD2': Agents.champs24Roster,
      for (final MapEntry(:key, value: agents)
          in (agentsCsvs ?? <String, Agents>{}).entries)
        key: agents,
    };
    _rosterStreamController.add(rosters);
    _defaultNameStreamController.add(_builtInRosterNames[0]);
  }

  final List<String> _builtInRosterNames;

  /// List of built-in roster names that cannot be edited.
  List<String> get builtInRosterNames => _builtInRosterNames;

  final _defaultNameStreamController = BehaviorSubject<String>.seeded('');

  /// Default roster name.
  Stream<String> get defaultName {
    return _defaultNameStreamController.asBroadcastStream();
  }

  final _rosterStreamController = BehaviorSubject<Map<String, Agents>>.seeded(
    {},
  );

  /// Current [Agents] name map
  Stream<Map<String, Agents>> getRosters() {
    return _rosterStreamController.asBroadcastStream();
  }

  /// Changes the default roster to [name] if available.
  void changeDefaultRoster(String name) {
    final rosters = {..._rosterStreamController.value};
    if (rosters.keys.contains(name)) {
      _defaultNameStreamController.add(name);
    }
  }

  /// Get the names of available [Agents] roster.
  List<String> getRosterNames() {
    final rosters = {..._rosterStreamController.value};
    return rosters.keys.toList();
  }

  /// Get the [Agents] associated with given [name].
  ///
  /// If no `name` is provided, it uses [AgentsRepository.defaultName].
  ///
  /// Throws [RosterNotFoundException] if an associated [Agents] is not found.
  Agents getAgents({String? name}) {
    final rosters = {..._rosterStreamController.value};
    if (name == null) {
      final defaultAgents = rosters[_defaultNameStreamController.value];
      if (defaultAgents == null) {
        throw RosterNotFoundException(
          'Roster for default roster name of '
          '${_defaultNameStreamController.value} does not exist. '
          'This means you messed up big.',
        );
      }
      return defaultAgents;
    }
    final agents = rosters[name];
    if (agents == null) {
      throw RosterNotFoundException('Roster for name $name is not available');
    }
    return agents;
  }

  /// Adds the given [agents] roster with associated [name].
  ///
  /// Returns the name
  ///
  /// Throws:
  /// * [DefaultRosterEditException] if [name] is one of the default names.
  /// * [RosterAlreadyExistsException] if [name] already exists but [override]
  /// is `false`.
  Future<String> addNewAgentRoster(Agents agents, String name) async {
    final rosters = {..._rosterStreamController.value};
    String validKey(String name) {
      if (rosters.containsKey(name)) {
        var newKey = name.withRandomSuffix();

        while (rosters.containsKey(newKey)) {
          newKey = name.withRandomSuffix();
        }
        return newKey;
      }
      return name;
    }

    final key = validKey(name);
    rosters[key] = agents;
    _rosterStreamController.add(rosters);
    return key;
  }

  /// Deletes the [Agents] entry associated with [name].
  ///
  /// Throws [DefaultRosterEditException] if [name] is one of the default names.
  Future<void> deleteAgentRoster(String name) async {
    if (_builtInRosterNames.contains(name)) {
      throw DefaultRosterEditException(
        'Default Agent Roster $name cannot be deleted',
      );
    }
    final rosters = {..._rosterStreamController.value}..remove(name);
    _rosterStreamController.add(rosters);
    if (name == _defaultNameStreamController.value) {
      _defaultNameStreamController.add(_builtInRosterNames[0]);
    }
  }

  Future<void> dispose() async {
    await _rosterStreamController.close();
    await _defaultNameStreamController.close();
  }
}

class DefaultRosterEditException implements Exception {
  const DefaultRosterEditException(this.message);

  final String message;

  @override
  String toString() {
    return 'DefaultRosterEditException: $message';
  }
}

class RosterAlreadyExistsException implements Exception {
  const RosterAlreadyExistsException(this.message);

  final String message;

  @override
  String toString() {
    return 'RosterAlreadyExistsException: $message';
  }
}

class RosterNotFoundException implements Exception {
  const RosterNotFoundException(this.message);

  final String message;

  @override
  String toString() {
    return 'RosterNotFoundException: $message';
  }
}
