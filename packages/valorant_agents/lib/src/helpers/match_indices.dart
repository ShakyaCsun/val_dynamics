import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

class MatchIndices extends Equatable {
  const MatchIndices({
    required this.teamOne,
    required this.teamTwo,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.teamOneAttackScore,
    required this.teamTwoAttackScore,
    required this.teamOneAgents,
    required this.teamTwoAgents,
    required this.mapName,
  });

  factory MatchIndices.populate({required List<String> headersRow}) {
    var indices = MatchIndices.initial;
    for (final (index, element) in headersRow.indexed) {
      switch (element) {
        case MatchHeader.mapName:
          indices = indices.copyWith(mapName: index);
        case MatchHeader.teamOne:
          indices = indices.copyWith(teamOne: index);
        case MatchHeader.teamTwo:
          indices = indices.copyWith(teamTwo: index);
        case MatchHeader.teamOneScore:
          indices = indices.copyWith(teamOneScore: index);
        case MatchHeader.teamTwoScore:
          indices = indices.copyWith(teamTwoScore: index);
        case MatchHeader.teamOneAttackScore:
          indices = indices.copyWith(teamOneAttackScore: index);
        case MatchHeader.teamTwoAttackScore:
          indices = indices.copyWith(teamTwoAttackScore: index);
        case MatchHeader.teamOneAgents:
          indices = indices.copyWith(teamOneAgents: index);
        case MatchHeader.teamTwoAgents:
          indices = indices.copyWith(teamTwoAgents: index);
      }
    }
    if (!indices.isValid) {
      throw InvalidCsvHeadersException(indices.errorMessage);
    }
    return indices;
  }

  final int teamOne;
  final int teamTwo;
  final int teamOneScore;
  final int teamTwoScore;
  final int teamOneAttackScore;
  final int teamTwoAttackScore;
  final int teamOneAgents;
  final int teamTwoAgents;
  final int mapName;

  static const initial = MatchIndices(
    teamOne: -1,
    teamTwo: -1,
    teamOneScore: -1,
    teamTwoScore: -1,
    teamOneAttackScore: -1,
    teamTwoAttackScore: -1,
    teamOneAgents: -1,
    teamTwoAgents: -1,
    mapName: -1,
  );

  bool get isValid => _indices.every((element) => element >= 0);

  String get errorMessage {
    if (isValid) {
      return '';
    }
    final errorHeadings = _indices
        .mapIndexed<String?>((index, element) {
          if (element < 0) {
            return MatchHeader.all[index];
          }
          return null;
        })
        .nonNulls
        .join(',');

    return 'Could not find headers for: $errorHeadings';
  }

  String minifiedCsv(List<List<String>> csvRows) {
    final minifiedRows = csvRows.map<List<String>>((row) {
      return [for (final index in _indices) row[index]];
    }).toList();
    return writeCsv([MatchHeader.all, ...minifiedRows]);
  }

  RawMatch parseRawMatch(List<String> row) {
    return RawMatch(
      mapName: row[mapName],
      teamOneName: row[teamOne],
      teamTwoName: row[teamTwo],
      teamOneScore: parseInt(row[teamOneScore]),
      teamTwoScore: parseInt(row[teamTwoScore]),
      teamOneAttackScore: parseInt(row[teamOneAttackScore]),
      teamTwoAttackScore: parseInt(row[teamTwoAttackScore]),
      teamOneAgents: row[teamOneAgents],
      teamTwoAgents: row[teamTwoAgents],
    );
  }

  ValorantMatch parseMatch(
    List<String> row, {
    required Map<String, Agent> agentsMap,
  }) {
    final team1 = Team(
      name: row[teamOne],
      score: parseInt(row[teamOneScore]),
      attackScore: parseInt(row[teamOneAttackScore]),
      agents: AgentComp.fromAgentNames(
        row[teamOneAgents],
        agentsMap: agentsMap,
      ),
    );
    final team2 = Team(
      name: row[teamTwo],
      score: parseInt(row[teamTwoScore]),
      attackScore: parseInt(row[teamTwoAttackScore]),
      agents: AgentComp.fromAgentNames(
        row[teamTwoAgents],
        agentsMap: agentsMap,
      ),
    );
    return ValorantMatch(mapName: row[mapName], teamOne: team1, teamTwo: team2);
  }

  MatchIndices copyWith({
    int? teamOne,
    int? teamTwo,
    int? teamOneScore,
    int? teamTwoScore,
    int? teamOneAttackScore,
    int? teamTwoAttackScore,
    int? teamOneAgents,
    int? teamTwoAgents,
    int? mapName,
  }) {
    return MatchIndices(
      teamOne: teamOne ?? this.teamOne,
      teamTwo: teamTwo ?? this.teamTwo,
      teamOneScore: teamOneScore ?? this.teamOneScore,
      teamTwoScore: teamTwoScore ?? this.teamTwoScore,
      teamOneAttackScore: teamOneAttackScore ?? this.teamOneAttackScore,
      teamTwoAttackScore: teamTwoAttackScore ?? this.teamTwoAttackScore,
      teamOneAgents: teamOneAgents ?? this.teamOneAgents,
      teamTwoAgents: teamTwoAgents ?? this.teamTwoAgents,
      mapName: mapName ?? this.mapName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => _indices;

  List<int> get _indices {
    /// Important: This should be same as [MatchHeader.all]
    return [
      mapName,
      teamOne,
      teamTwo,
      teamOneScore,
      teamTwoScore,
      teamOneAttackScore,
      teamTwoAttackScore,
      teamOneAgents,
      teamTwoAgents,
    ];
  }
}

class MatchHeader {
  const MatchHeader._();

  // Important: the order of variable names here should be same as
  // [MatchIndices.all]
  static const all = <String>[
    mapName,
    teamOne,
    teamTwo,
    teamOneScore,
    teamTwoScore,
    teamOneAttackScore,
    teamTwoAttackScore,
    teamOneAgents,
    teamTwoAgents,
  ];

  static const mapName = 'Map Name';
  static const teamOne = 'Team 1 Name';
  static const teamTwo = 'Team 2 Name';
  static const teamOneScore = 'Team 1 Score';
  static const teamTwoScore = 'Team 2 Score';
  static const teamOneAttackScore = 'Team 1 Attacking Wins';
  static const teamTwoAttackScore = 'Team 2 Attacking Wins';
  static const teamOneAgents = 'Team 1 Agents';
  static const teamTwoAgents = 'Team 2 Agents';
}
