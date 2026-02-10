// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_overview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchesCollectionList)
final matchesCollectionListProvider = MatchesCollectionListProvider._();

final class MatchesCollectionListProvider
    extends $NotifierProvider<MatchesCollectionList, List<MatchesCollection>> {
  MatchesCollectionListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchesCollectionListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchesCollectionListHash();

  @$internal
  @override
  MatchesCollectionList create() => MatchesCollectionList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MatchesCollection> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MatchesCollection>>(value),
    );
  }
}

String _$matchesCollectionListHash() =>
    r'05d37c5a6cb2844eabd16d908594e48a970d24a8';

abstract class _$MatchesCollectionList
    extends $Notifier<List<MatchesCollection>> {
  List<MatchesCollection> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<MatchesCollection>, List<MatchesCollection>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<MatchesCollection>, List<MatchesCollection>>,
              List<MatchesCollection>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
