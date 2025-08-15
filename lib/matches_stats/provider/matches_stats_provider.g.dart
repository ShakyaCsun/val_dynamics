// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MatchesStats)
const matchesStatsProvider = MatchesStatsFamily._();

final class MatchesStatsProvider
    extends $NotifierProvider<MatchesStats, List<StyledMatchesStat>> {
  const MatchesStatsProvider._({
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
  Override overrideWithValue(List<StyledMatchesStat> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StyledMatchesStat>>(value),
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

String _$matchesStatsHash() => r'dc85173723c6711dd88ff8ac93398c272ad6e82b';

final class MatchesStatsFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchesStats,
          List<StyledMatchesStat>,
          List<StyledMatchesStat>,
          List<StyledMatchesStat>,
          String
        > {
  const MatchesStatsFamily._()
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

abstract class _$MatchesStats extends $Notifier<List<StyledMatchesStat>> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  List<StyledMatchesStat> build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(collectionId: _$args);
    final ref =
        this.ref as $Ref<List<StyledMatchesStat>, List<StyledMatchesStat>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<StyledMatchesStat>, List<StyledMatchesStat>>,
              List<StyledMatchesStat>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
