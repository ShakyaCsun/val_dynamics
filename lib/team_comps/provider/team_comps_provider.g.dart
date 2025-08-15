// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_comps_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(filteredCompositions)
const filteredCompositionsProvider = FilteredCompositionsFamily._();

final class FilteredCompositionsProvider
    extends
        $FunctionalProvider<
          Iterable<AgentComp>,
          Iterable<AgentComp>,
          Iterable<AgentComp>
        >
    with $Provider<Iterable<AgentComp>> {
  const FilteredCompositionsProvider._({
    required FilteredCompositionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredCompositionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredCompositionsHash();

  @override
  String toString() {
    return r'filteredCompositionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Iterable<AgentComp>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Iterable<AgentComp> create(Ref ref) {
    final argument = this.argument as String;
    return filteredCompositions(ref, rosterName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<AgentComp> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<AgentComp>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredCompositionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredCompositionsHash() =>
    r'e4dfe1dffed3852dfcc359930f8106b94ad723c6';

final class FilteredCompositionsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<AgentComp>, String> {
  const FilteredCompositionsFamily._()
    : super(
        retry: null,
        name: r'filteredCompositionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredCompositionsProvider call({required String rosterName}) =>
      FilteredCompositionsProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'filteredCompositionsProvider';
}

@ProviderFor(teamCompsTernaryData)
const teamCompsTernaryDataProvider = TeamCompsTernaryDataFamily._();

final class TeamCompsTernaryDataProvider
    extends
        $FunctionalProvider<
          Map<AgentCompsTernaryData, TernaryPoint>,
          Map<AgentCompsTernaryData, TernaryPoint>,
          Map<AgentCompsTernaryData, TernaryPoint>
        >
    with $Provider<Map<AgentCompsTernaryData, TernaryPoint>> {
  const TeamCompsTernaryDataProvider._({
    required TeamCompsTernaryDataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'teamCompsTernaryDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamCompsTernaryDataHash();

  @override
  String toString() {
    return r'teamCompsTernaryDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<AgentCompsTernaryData, TernaryPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<AgentCompsTernaryData, TernaryPoint> create(Ref ref) {
    final argument = this.argument as String;
    return teamCompsTernaryData(ref, rosterName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<AgentCompsTernaryData, TernaryPoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Map<AgentCompsTernaryData, TernaryPoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamCompsTernaryDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamCompsTernaryDataHash() =>
    r'058db8a0da1872513141bb103bce387b8325a507';

final class TeamCompsTernaryDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Map<AgentCompsTernaryData, TernaryPoint>,
          String
        > {
  const TeamCompsTernaryDataFamily._()
    : super(
        retry: null,
        name: r'teamCompsTernaryDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeamCompsTernaryDataProvider call({required String rosterName}) =>
      TeamCompsTernaryDataProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'teamCompsTernaryDataProvider';
}

@ProviderFor(compositionsReady)
const compositionsReadyProvider = CompositionsReadyFamily._();

final class CompositionsReadyProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const CompositionsReadyProvider._({
    required CompositionsReadyFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'compositionsReadyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$compositionsReadyHash();

  @override
  String toString() {
    return r'compositionsReadyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return compositionsReady(ref, rosterName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompositionsReadyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$compositionsReadyHash() => r'073d41e77f154dd94f4b964411f4bd7c9b96f76f';

final class CompositionsReadyFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const CompositionsReadyFamily._()
    : super(
        retry: null,
        name: r'compositionsReadyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompositionsReadyProvider call({required String rosterName}) =>
      CompositionsReadyProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'compositionsReadyProvider';
}

@ProviderFor(Compositions)
const compositionsProvider = CompositionsFamily._();

final class CompositionsProvider
    extends $AsyncNotifierProvider<Compositions, CompositionsState> {
  const CompositionsProvider._({
    required CompositionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'compositionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$compositionsHash();

  @override
  String toString() {
    return r'compositionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Compositions create() => Compositions();

  @override
  bool operator ==(Object other) {
    return other is CompositionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$compositionsHash() => r'3302bb15a1bb2d2c2d26f4a85d469407f3914c5e';

final class CompositionsFamily extends $Family
    with
        $ClassFamilyOverride<
          Compositions,
          AsyncValue<CompositionsState>,
          CompositionsState,
          FutureOr<CompositionsState>,
          String
        > {
  const CompositionsFamily._()
    : super(
        retry: null,
        name: r'compositionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompositionsProvider call({required String rosterName}) =>
      CompositionsProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'compositionsProvider';
}

abstract class _$Compositions extends $AsyncNotifier<CompositionsState> {
  late final _$args = ref.$arg as String;
  String get rosterName => _$args;

  FutureOr<CompositionsState> build({required String rosterName});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(rosterName: _$args);
    final ref =
        this.ref as $Ref<AsyncValue<CompositionsState>, CompositionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CompositionsState>, CompositionsState>,
              AsyncValue<CompositionsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
