// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(StyledMatches)
const styledMatchesProvider = StyledMatchesFamily._();

final class StyledMatchesProvider
    extends $NotifierProvider<StyledMatches, StyledMatchesState> {
  const StyledMatchesProvider._({
    required StyledMatchesFamily super.from,
    required ({String collectionId, StylePoints acm}) super.argument,
  }) : super(
         retry: null,
         name: r'styledMatchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$styledMatchesHash();

  @override
  String toString() {
    return r'styledMatchesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  StyledMatches create() => StyledMatches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StyledMatchesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StyledMatchesState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$styledMatchesHash() => r'befa3d61ca54ca9453a12524a35e16007b503315';

final class StyledMatchesFamily extends $Family
    with
        $ClassFamilyOverride<
          StyledMatches,
          StyledMatchesState,
          StyledMatchesState,
          StyledMatchesState,
          ({String collectionId, StylePoints acm})
        > {
  const StyledMatchesFamily._()
    : super(
        retry: null,
        name: r'styledMatchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StyledMatchesProvider call({
    required String collectionId,
    required StylePoints acm,
  }) => StyledMatchesProvider._(
    argument: (collectionId: collectionId, acm: acm),
    from: this,
  );

  @override
  String toString() => r'styledMatchesProvider';
}

abstract class _$StyledMatches extends $Notifier<StyledMatchesState> {
  late final _$args = ref.$arg as ({String collectionId, StylePoints acm});
  String get collectionId => _$args.collectionId;
  StylePoints get acm => _$args.acm;

  StyledMatchesState build({
    required String collectionId,
    required StylePoints acm,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(collectionId: _$args.collectionId, acm: _$args.acm);
    final ref = this.ref as $Ref<StyledMatchesState, StyledMatchesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StyledMatchesState, StyledMatchesState>,
              StyledMatchesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
