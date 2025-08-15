// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(matchesRepository)
const matchesRepositoryProvider = MatchesRepositoryFamily._();

final class MatchesRepositoryProvider
    extends
        $FunctionalProvider<
          MatchesRepository,
          MatchesRepository,
          MatchesRepository
        >
    with $Provider<MatchesRepository> {
  const MatchesRepositoryProvider._({
    required MatchesRepositoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchesRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchesRepositoryHash();

  @override
  String toString() {
    return r'matchesRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MatchesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MatchesRepository create(Ref ref) {
    final argument = this.argument as String;
    return matchesRepository(ref, collectionId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchesRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchesRepositoryHash() => r'2570457637d02aa38fa33943af48e7ce4355feb5';

final class MatchesRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<MatchesRepository, String> {
  const MatchesRepositoryFamily._()
    : super(
        retry: null,
        name: r'matchesRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchesRepositoryProvider call({required String collectionId}) =>
      MatchesRepositoryProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'matchesRepositoryProvider';
}

@ProviderFor(availableMaps)
const availableMapsProvider = AvailableMapsFamily._();

final class AvailableMapsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  const AvailableMapsProvider._({
    required AvailableMapsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'availableMapsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$availableMapsHash();

  @override
  String toString() {
    return r'availableMapsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    final argument = this.argument as String;
    return availableMaps(ref, collectionName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableMapsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$availableMapsHash() => r'290dccdc7138e2c65994e4988b9ab69286d304ce';

final class AvailableMapsFamily extends $Family
    with $FunctionalFamilyOverride<Set<String>, String> {
  const AvailableMapsFamily._()
    : super(
        retry: null,
        name: r'availableMapsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AvailableMapsProvider call({required String collectionName}) =>
      AvailableMapsProvider._(argument: collectionName, from: this);

  @override
  String toString() => r'availableMapsProvider';
}

@ProviderFor(selectedMaps)
const selectedMapsProvider = SelectedMapsFamily._();

final class SelectedMapsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  const SelectedMapsProvider._({
    required SelectedMapsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'selectedMapsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedMapsHash();

  @override
  String toString() {
    return r'selectedMapsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    final argument = this.argument as String;
    return selectedMaps(ref, collectionName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedMapsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedMapsHash() => r'b3c07a8afd429fb9844a36bf209f96556062895a';

final class SelectedMapsFamily extends $Family
    with $FunctionalFamilyOverride<Set<String>, String> {
  const SelectedMapsFamily._()
    : super(
        retry: null,
        name: r'selectedMapsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedMapsProvider call({required String collectionName}) =>
      SelectedMapsProvider._(argument: collectionName, from: this);

  @override
  String toString() => r'selectedMapsProvider';
}

@ProviderFor(Matches)
const matchesProvider = MatchesFamily._();

final class MatchesProvider
    extends $NotifierProvider<Matches, ValorantMatches> {
  const MatchesProvider._({
    required MatchesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchesHash();

  @override
  String toString() {
    return r'matchesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Matches create() => Matches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValorantMatches value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValorantMatches>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchesHash() => r'f5f8c2b5beefd480b84cea698a59c7e2028c3508';

final class MatchesFamily extends $Family
    with
        $ClassFamilyOverride<
          Matches,
          ValorantMatches,
          ValorantMatches,
          ValorantMatches,
          String
        > {
  const MatchesFamily._()
    : super(
        retry: null,
        name: r'matchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchesProvider call({required String collectionId}) =>
      MatchesProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'matchesProvider';
}

abstract class _$Matches extends $Notifier<ValorantMatches> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  ValorantMatches build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(collectionId: _$args);
    final ref = this.ref as $Ref<ValorantMatches, ValorantMatches>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ValorantMatches, ValorantMatches>,
              ValorantMatches,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MatchesFilter)
const matchesFilterProvider = MatchesFilterFamily._();

final class MatchesFilterProvider
    extends $NotifierProvider<MatchesFilter, MatchesFilterState> {
  const MatchesFilterProvider._({
    required MatchesFilterFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchesFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchesFilterHash();

  @override
  String toString() {
    return r'matchesFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchesFilter create() => MatchesFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchesFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchesFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchesFilterHash() => r'8fccfeb0a893a7a5d58e6dc0c7b9d8f7ac67c3cd';

final class MatchesFilterFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchesFilter,
          MatchesFilterState,
          MatchesFilterState,
          MatchesFilterState,
          String
        > {
  const MatchesFilterFamily._()
    : super(
        retry: null,
        name: r'matchesFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchesFilterProvider call({required String collectionId}) =>
      MatchesFilterProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'matchesFilterProvider';
}

abstract class _$MatchesFilter extends $Notifier<MatchesFilterState> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  MatchesFilterState build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(collectionId: _$args);
    final ref = this.ref as $Ref<MatchesFilterState, MatchesFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchesFilterState, MatchesFilterState>,
              MatchesFilterState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
