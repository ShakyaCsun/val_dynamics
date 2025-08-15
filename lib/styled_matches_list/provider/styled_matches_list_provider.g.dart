// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matches_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(styledMatchesList)
const styledMatchesListProvider = StyledMatchesListFamily._();

final class StyledMatchesListProvider
    extends
        $FunctionalProvider<ValorantMatches, ValorantMatches, ValorantMatches>
    with $Provider<ValorantMatches> {
  const StyledMatchesListProvider._({
    required StyledMatchesListFamily super.from,
    required ({String collectionId, StylePoints acm}) super.argument,
  }) : super(
         retry: null,
         name: r'styledMatchesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$styledMatchesListHash();

  @override
  String toString() {
    return r'styledMatchesListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ValorantMatches> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ValorantMatches create(Ref ref) {
    final argument = this.argument as ({String collectionId, StylePoints acm});
    return styledMatchesList(
      ref,
      collectionId: argument.collectionId,
      acm: argument.acm,
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
    return other is StyledMatchesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$styledMatchesListHash() => r'971e650b9134ba40b6f4ae9d5b4a9c38154606fe';

final class StyledMatchesListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ValorantMatches,
          ({String collectionId, StylePoints acm})
        > {
  const StyledMatchesListFamily._()
    : super(
        retry: null,
        name: r'styledMatchesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StyledMatchesListProvider call({
    required String collectionId,
    required StylePoints acm,
  }) => StyledMatchesListProvider._(
    argument: (collectionId: collectionId, acm: acm),
    from: this,
  );

  @override
  String toString() => r'styledMatchesListProvider';
}

@ProviderFor(styledMatchesDataList)
const styledMatchesDataListProvider = StyledMatchesDataListFamily._();

final class StyledMatchesDataListProvider
    extends
        $FunctionalProvider<
          List<(StyledMatchesSummaryData, ValorantMatches)>,
          List<(StyledMatchesSummaryData, ValorantMatches)>,
          List<(StyledMatchesSummaryData, ValorantMatches)>
        >
    with $Provider<List<(StyledMatchesSummaryData, ValorantMatches)>> {
  const StyledMatchesDataListProvider._({
    required StyledMatchesDataListFamily super.from,
    required ({String collectionId, StylePoints acm}) super.argument,
  }) : super(
         retry: null,
         name: r'styledMatchesDataListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$styledMatchesDataListHash();

  @override
  String toString() {
    return r'styledMatchesDataListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<(StyledMatchesSummaryData, ValorantMatches)>>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<(StyledMatchesSummaryData, ValorantMatches)> create(Ref ref) {
    final argument = this.argument as ({String collectionId, StylePoints acm});
    return styledMatchesDataList(
      ref,
      collectionId: argument.collectionId,
      acm: argument.acm,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    List<(StyledMatchesSummaryData, ValorantMatches)> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<(StyledMatchesSummaryData, ValorantMatches)>>(
            value,
          ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchesDataListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$styledMatchesDataListHash() =>
    r'94b0011320a0c5ccb22c9818dfbc745907244a8c';

final class StyledMatchesDataListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<(StyledMatchesSummaryData, ValorantMatches)>,
          ({String collectionId, StylePoints acm})
        > {
  const StyledMatchesDataListFamily._()
    : super(
        retry: null,
        name: r'styledMatchesDataListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StyledMatchesDataListProvider call({
    required String collectionId,
    required StylePoints acm,
  }) => StyledMatchesDataListProvider._(
    argument: (collectionId: collectionId, acm: acm),
    from: this,
  );

  @override
  String toString() => r'styledMatchesDataListProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
