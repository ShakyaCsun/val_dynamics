import 'package:agents_repository/agents_repository.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/bundled_csv/bundled_csv.dart';

part 'matches_overview_provider.freezed.dart';
part 'matches_overview_provider.g.dart';

@Riverpod(keepAlive: true)
class MatchesCollectionList extends _$MatchesCollectionList {
  @override
  List<MatchesCollection> build() {
    final matches = ref.watch(bundledMatchesCsvsProvider);
    final matchesList = <MatchesCollection>[];
    for (final MapEntry(key: name, value: rawMatches) in matches.entries) {
      switch (name) {
        case 'April to October 7 2024.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'April-October 7',
              rawMatches: rawMatches,
              rosterName: 'Default SD2',
            ),
          );
        case 'August-November-24.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'August-November 2024',
              rawMatches: rawMatches,
              rosterName: 'Default SD2',
            ),
          );
        case 'Champions 2024.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'Champions 2024',
              rawMatches: rawMatches,
              rosterName: 'Champions 2024 SD2',
            ),
          );
        case 'Champions and Ascension 2024.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'Champions and Ascension 2024',
              rawMatches: rawMatches,
              rosterName: 'Champions 2024 SD2',
            ),
          );
        case 'Game Changers 2024.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'Game Changers 2024',
              rawMatches: rawMatches,
              rosterName: 'Default SD2',
            ),
          );
        case 'Masters Tokyo and Champions 2023.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: 'Masters Tokyo and Champions 2023',
              rawMatches: rawMatches,
              rosterName: 'agent_ratings_2023.csv',
            ),
          );
        case _:
          matchesList.add(
            MatchesCollection(
              collectionName: name,
              rawMatches: rawMatches,
              rosterName: 'Default SD2',
            ),
          );
      }
    }
    return matchesList;
  }

  void changeRosterToUse(int index, String newRosterName) {
    state = [
      for (final (i, matchesCol) in state.indexed)
        if (i == index)
          matchesCol.copyWith(rosterName: newRosterName)
        else
          matchesCol,
    ];
  }

  String addCollection(MatchesCollection collection) {
    if (_collectionNames.contains(collection.collectionName)) {
      return addCollection(
        collection.copyWith(
          collectionName: collection.collectionName.withRandomSuffix(),
        ),
      );
    }
    state = [...state, collection];
    return collection.collectionName;
  }

  MatchesCollection? getCollection(String collectionName) {
    return state.firstWhereOrNull(
      (element) => element.collectionName == collectionName,
    );
  }

  List<String> get _collectionNames => state
      .map(
        (e) => e.collectionName,
      )
      .toList();
}

@freezed
class MatchesCollection with _$MatchesCollection {
  const factory MatchesCollection({
    required String collectionName,
    required List<RawMatch> rawMatches,
    required String rosterName,
  }) = _MatchesCollection;

  const MatchesCollection._();

  int get matchesCount => rawMatches.length;
}
