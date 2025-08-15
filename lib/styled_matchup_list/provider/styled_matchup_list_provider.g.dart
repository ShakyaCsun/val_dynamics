// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matchup_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(styledMatchupList)
const styledMatchupListProvider = StyledMatchupListFamily._();

final class StyledMatchupListProvider
    extends
        $FunctionalProvider<ValorantMatches, ValorantMatches, ValorantMatches>
    with $Provider<ValorantMatches> {
  const StyledMatchupListProvider._({
    required StyledMatchupListFamily super.from,
    required ({String collectionId, StylePoints acm, StylePoints opponentAcm})
    super.argument,
  }) : super(
         retry: null,
         name: r'styledMatchupListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$styledMatchupListHash();

  @override
  String toString() {
    return r'styledMatchupListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ValorantMatches> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ValorantMatches create(Ref ref) {
    final argument =
        this.argument
            as ({
              String collectionId,
              StylePoints acm,
              StylePoints opponentAcm,
            });
    return styledMatchupList(
      ref,
      collectionId: argument.collectionId,
      acm: argument.acm,
      opponentAcm: argument.opponentAcm,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValorantMatches value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValorantMatches>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchupListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$styledMatchupListHash() => r'cf57e7f62d6fb34defae498844cc5e9ea85fa8fc';

final class StyledMatchupListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ValorantMatches,
          ({String collectionId, StylePoints acm, StylePoints opponentAcm})
        > {
  const StyledMatchupListFamily._()
    : super(
        retry: null,
        name: r'styledMatchupListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StyledMatchupListProvider call({
    required String collectionId,
    required StylePoints acm,
    required StylePoints opponentAcm,
  }) => StyledMatchupListProvider._(
    argument: (collectionId: collectionId, acm: acm, opponentAcm: opponentAcm),
    from: this,
  );

  @override
  String toString() => r'styledMatchupListProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
