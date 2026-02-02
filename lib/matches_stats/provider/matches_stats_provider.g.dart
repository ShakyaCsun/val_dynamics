// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchesStats)
final matchesStatsProvider = MatchesStatsFamily._();

final class MatchesStatsProvider
    extends $NotifierProvider<MatchesStats, List<StyleTypeMatches>> {
  MatchesStatsProvider._({
    required MatchesStatsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchesStatsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchesStatsHash();

  @override
  String toString() {
    return r'matchesStatsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchesStats create() => MatchesStats();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StyleTypeMatches> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StyleTypeMatches>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesStatsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchesStatsHash() => r'dc242430ec182a39c397b2633ffbf87ed972a6e4';

final class MatchesStatsFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchesStats,
          List<StyleTypeMatches>,
          List<StyleTypeMatches>,
          List<StyleTypeMatches>,
          String
        > {
  MatchesStatsFamily._()
    : super(
        retry: null,
        name: r'matchesStatsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchesStatsProvider call({required String collectionId}) =>
      MatchesStatsProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'matchesStatsProvider';
}

abstract class _$MatchesStats extends $Notifier<List<StyleTypeMatches>> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  List<StyleTypeMatches> build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<StyleTypeMatches>, List<StyleTypeMatches>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<StyleTypeMatches>, List<StyleTypeMatches>>,
              List<StyleTypeMatches>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(collectionId: _$args));
  }
}

@ProviderFor(TriangularInteractions)
final triangularInteractionsProvider = TriangularInteractionsFamily._();

final class TriangularInteractionsProvider
    extends
        $NotifierProvider<
          TriangularInteractions,
          List<NonTransitiveInteraction>
        > {
  TriangularInteractionsProvider._({
    required TriangularInteractionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'triangularInteractionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$triangularInteractionsHash();

  @override
  String toString() {
    return r'triangularInteractionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TriangularInteractions create() => TriangularInteractions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NonTransitiveInteraction> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NonTransitiveInteraction>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TriangularInteractionsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$triangularInteractionsHash() =>
    r'94948161ee0c3b5483363f1722371621c6a61a3d';

final class TriangularInteractionsFamily extends $Family
    with
        $ClassFamilyOverride<
          TriangularInteractions,
          List<NonTransitiveInteraction>,
          List<NonTransitiveInteraction>,
          List<NonTransitiveInteraction>,
          String
        > {
  TriangularInteractionsFamily._()
    : super(
        retry: null,
        name: r'triangularInteractionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TriangularInteractionsProvider call({required String collectionId}) =>
      TriangularInteractionsProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'triangularInteractionsProvider';
}

abstract class _$TriangularInteractions
    extends $Notifier<List<NonTransitiveInteraction>> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  List<NonTransitiveInteraction> build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              List<NonTransitiveInteraction>,
              List<NonTransitiveInteraction>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<NonTransitiveInteraction>,
                List<NonTransitiveInteraction>
              >,
              List<NonTransitiveInteraction>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(collectionId: _$args));
  }
}
