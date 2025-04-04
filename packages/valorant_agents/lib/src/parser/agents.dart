import 'package:valorant_agents/valorant_agents.dart';

/// {@template agents}
/// [Agents] is just a [List<Agent>] but forces unmodifiable/immutable
/// list and unique [Agent]s along with helpful extension methods.
/// {@endtemplate}
extension type const Agents._(List<Agent> agents) implements List<Agent> {
  /// {@macro agents}
  Agents(List<Agent> agents) : agents = List.unmodifiable(agents.toSet());

  factory Agents.fromCsv(String csv) {
    final (headers, rows) = readCsvWithHeaders(csv);
    var indices = _AgentCsvIndices.initial;
    for (final (index, element) in headers.indexed) {
      switch (element) {
        case 'Name':
          indices = indices.copyWith(name: index);
        case 'Aggro':
          indices = indices.copyWith(aggro: index);
        case 'Control':
          indices = indices.copyWith(control: index);
        case 'Midrange':
          indices = indices.copyWith(midrange: index);
        case 'Role':
          indices = indices.copyWith(role: index);
        case 'Image':
          indices = indices.copyWith(image: index);
      }
    }
    if (!indices.isValid) {
      throw InvalidCsvHeadersException(indices.errorMessage);
    }
    return Agents(
      rows.map<Agent>((row) {
        try {
          return indices.parseAgent(row);
        } on InvalidFormatException catch (e) {
          throw InvalidFormatException(
            '${e.message}\nError Line: ${row.join(',')}',
          );
        }
      }).toList(),
    );
  }

  List<Map<String, dynamic>> toJson({bool minimal = false}) {
    return [
      for (final agent in agents)
        minimal ? agent.toMinimalJson() : agent.toJson(),
    ];
  }

  /// All [Agent] have the same [Agent.totalPoints] allocated.
  bool get validPowerLevels {
    if (isEmpty) {
      return true;
    }
    final firstTotal = agents[0].totalPoints;
    return agents.every((agent) => agent.totalPoints == firstTotal);
  }

  /// Check if all [Agent]s have close to same [Agent.totalPoints] allocated
  /// within floating/double error with [tolerance].
  bool haveCloseToEqualPower({double tolerance = 1e-10}) {
    return validPowerLevels || powerDifference <= tolerance;
  }

  /// Difference in power i.e. [Agent.totalPoints] of [Agent]s.
  ///
  /// Ideally this should be 0, which is the case if [validPowerLevels] is true
  double get powerDifference {
    if (isEmpty) {
      return 0;
    }
    final agentPowers = [...agents.map((agent) => agent.totalPoints).toSet()]
      ..sort();
    return agentPowers.last - agentPowers.first;
  }

  String toCsv({bool includeImage = true}) {
    final agentsList = <List<String>>[
      [
        'Name',
        'Aggro',
        'Control',
        'Midrange',
        'Role',
        if (includeImage) 'Image',
      ],
      ...map<List<String>>(
        (agent) => [
          agent.name,
          '${agent.aggro}',
          '${agent.control}',
          '${agent.midrange}',
          agent.role.toJson(),
          if (includeImage) agent.iconUrl ?? '',
        ],
      ),
    ];
    return writeCsv(agentsList);
  }

  static Future<Agents> fromCsvFile(String path) async {
    final csv = await readFile(path);
    return Agents.fromCsv(csv);
  }

  static final defaultRoster = Agents([
    Agent.astra,
    Agent.breach,
    Agent.brimstone,
    Agent.chamber,
    Agent.clove,
    Agent.cypher,
    Agent.deadlock,
    Agent.fade,
    Agent.gekko,
    Agent.harbor,
    Agent.iso,
    Agent.jett,
    Agent.kayo,
    Agent.killjoy,
    Agent.neon,
    Agent.omen,
    Agent.phoenix,
    Agent.raze,
    Agent.reyna,
    Agent.sage,
    Agent.skye,
    Agent.sova,
    Agent.tejo,
    Agent.viper,
    Agent.vyse,
    Agent.yoru,
    Agent.waylay,
  ]);

  static final champs24Roster = Agents([
    Agent.astra,
    Agent.breach,
    Agent.brimstone,
    Agent.chamber,
    const Agent(
      name: 'Clove',
      aggro: 5,
      control: 1,
      midrange: 4,
      role: Role.controller,
      abilityOne: AbilityOne(
        name: 'Meddle',
        aggro: 2,
        control: 1,
        reasons: ['High Potency', 'Short Range', 'Non-Catalytic'],
      ),
      abilityTwo: AbilityTwo(
        name: 'Ruse',
        aggro: 1,
        midrange: 2,
        reasons: ['Burst Smokes', 'Cooldown', 'Post mortem'],
      ),
      abilityThree: AbilityThree(
        name: 'Pick-me-up',
        aggro: 2,
        midrange: 1,
        reasons: ['', '', ''],
      ),
      ultimateAbility: UltimateAbility(
        name: 'Not Dead Yet',
        midrange: 1,
        reasons: ['Post mortem'],
      ),
    ),
    Agent.cypher,
    Agent.deadlock,
    Agent.fade,
    Agent.gekko,
    Agent.harbor,
    Agent.iso,
    Agent.jett,
    Agent.kayo,
    Agent.killjoy,
    Agent.neon,
    Agent.omen,
    Agent.phoenix,
    Agent.raze,
    Agent.reyna,
    Agent.sage,
    Agent.skye,
    Agent.sova,
    Agent.viper,
    Agent.yoru,
  ]);

  Map<String, Agent> get nameMap => <String, Agent>{
    for (final agent in this) agent.name: agent,
  };
}

final class _AgentCsvIndices {
  const _AgentCsvIndices({
    required this.name,
    required this.aggro,
    required this.control,
    required this.midrange,
    required this.role,
    required this.image,
  });

  final int name;
  final int aggro;
  final int control;
  final int midrange;
  final int role;
  final int image;

  static const initial = _AgentCsvIndices(
    name: -1,
    aggro: -1,
    control: -1,
    midrange: -1,
    role: -1,
    image: -1,
  );

  String get errorMessage {
    if (isValid) {
      return '';
    }
    final buffer = StringBuffer()..write('Could not find headers for: ');
    if (name < 0) {
      buffer.write('Name,');
    }
    if (aggro < 0) {
      buffer.write('Aggro,');
    }
    if (control < 0) {
      buffer.write('Control,');
    }
    if (midrange < 0) {
      buffer.write('Midrange,');
    }
    return buffer.toString().replaceFirst(RegExp(r'.$'), '');
  }

  bool get isValid =>
      [name, aggro, control, midrange].every((element) => element >= 0);
  bool get hasImage => image >= 0;
  bool get hasRole => role >= 0;

  Agent parseAgent(List<String> csvRow) {
    final imageUrl =
        hasImage
            ? switch (csvRow[image].trim()) {
              '' => null,
              _ => csvRow[image],
            }
            : null;
    final agentRole = hasRole ? Role.fromJson(csvRow[role]) : Role.unknown;
    return Agent(
      name: csvRow[name],
      aggro: parseDouble(csvRow[aggro]),
      control: parseDouble(csvRow[control]),
      midrange: parseDouble(csvRow[midrange]),
      role: agentRole,
      iconUrl: imageUrl,
    );
  }

  _AgentCsvIndices copyWith({
    int? name,
    int? aggro,
    int? control,
    int? midrange,
    int? role,
    int? image,
  }) {
    return _AgentCsvIndices(
      name: name ?? this.name,
      aggro: aggro ?? this.aggro,
      control: control ?? this.control,
      midrange: midrange ?? this.midrange,
      role: role ?? this.role,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'AgentIndices(name: $name, aggro: $aggro, control: $control, '
        'midrange: $midrange, role: $role, image: $image)';
  }
}
