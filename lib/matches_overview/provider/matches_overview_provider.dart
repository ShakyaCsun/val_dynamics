import 'package:agents_repository/agents_repository.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app/app.dart';

part 'matches_overview_provider.freezed.dart';
part 'matches_overview_provider.g.dart';

@Riverpod(keepAlive: true)
class MatchesCollectionList extends _$MatchesCollectionList {
  @override
  List<MatchesCollection> build() {
    final matches = ref.watch(bundledMatchesProvider);
    final matchesList = <MatchesCollection>[];
    for (final MapEntry(key: name, value: rawMatches) in matches.entries) {
      switch (name) {
        case '2024 Game Changers and Ascension.csv':
        case '2024 July-December.csv':
        case '2024 VCT Season.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: name.csvFileName,
              rawMatches: rawMatches,
              rosterName: AgentsRepository.champs24SD2,
            ),
          );
        case '2023 Masters Tokyo and Champions.csv':
          matchesList.add(
            MatchesCollection(
              collectionName: name.csvFileName,
              rawMatches: rawMatches,
              rosterName: AgentsRepository.sd2_2023,
            ),
          );
        case _:
          matchesList.add(
            MatchesCollection(
              collectionName: name.csvFileName,
              rawMatches: rawMatches,
              rosterName: AgentsRepository.defaultSD2,
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

  List<String> get _collectionNames =>
      state.map((e) => e.collectionName).toList();
}

@freezed
abstract class MatchesCollection with _$MatchesCollection {
  const factory MatchesCollection({
    required String collectionName,
    required List<RawMatch> rawMatches,
    required String rosterName,
  }) = _MatchesCollection;

  const MatchesCollection._();

  int get matchesCount => rawMatches.length;
}

extension on String {
  /// Removes last 4 characters from the String.
  ///
  /// It is assumed that those 4 characters are '.csv'.
  String get csvFileName {
    return substring(0, length - 4);
  }
}
