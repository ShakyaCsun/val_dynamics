// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_overview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MatchesCollectionList)
const matchesCollectionListProvider = MatchesCollectionListProvider._();

final class MatchesCollectionListProvider
    extends $NotifierProvider<MatchesCollectionList, List<MatchesCollection>> {
  const MatchesCollectionListProvider._()
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
    r'd9e306170c938fb71b32e2655b32e7229ab09cf8';

abstract class _$MatchesCollectionList
    extends $Notifier<List<MatchesCollection>> {
  List<MatchesCollection> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
