import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';

part 'matches_stats_provider.g.dart';

@riverpod
class MatchesStats extends _$MatchesStats {
  @override
  List<StyleTypeMatches> build({required String collectionId}) {
    return ref.watch(
      matchesProvider(
        collectionId: collectionId,
      ).select((state) => state.styleTypeClashes),
    );
  }
}

@riverpod
class TriangularInteractions extends _$TriangularInteractions {
  @override
  List<NonTransitiveInteraction> build({required String collectionId}) {
    return ref.watch(
      matchesProvider(
        collectionId: collectionId,
      ).select((state) => state.getTriangularInteractions()),
    );
  }
}

enum MatchUpNote {
  prey('>>'),
  predator('<<'),
  preyType('>'),
  predatorType('<'),
  mirror('='),
  mirrorType('≈'),
  none('');

  const MatchUpNote(this.symbol);

  factory MatchUpNote.fromStyles(StylePoints styleOne, StylePoints styleTwo) {
    if (styleOne.prey == styleTwo) {
      return MatchUpNote.prey;
    }
    if (styleOne.predator == styleTwo) {
      return MatchUpNote.predator;
    }
    if (styleOne == styleTwo) {
      return MatchUpNote.mirror;
    }
    final typeOne = styleOne.styleType;
    final typeTwo = styleTwo.styleType;
    if (typeOne.beats == typeTwo) {
      return MatchUpNote.preyType;
    }
    if (typeOne == typeTwo.beats) {
      return MatchUpNote.predatorType;
    }
    if (typeOne == typeTwo) {
      return MatchUpNote.mirrorType;
    }
    return MatchUpNote.none;
  }

  final String symbol;
}
