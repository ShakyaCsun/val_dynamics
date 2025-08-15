// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_synergies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(comboSynergies)
const comboSynergiesProvider = ComboSynergiesFamily._();

final class ComboSynergiesProvider
    extends
        $FunctionalProvider<
          Map<(Agent, Agent), ComboSynergyStat>,
          Map<(Agent, Agent), ComboSynergyStat>,
          Map<(Agent, Agent), ComboSynergyStat>
        >
    with $Provider<Map<(Agent, Agent), ComboSynergyStat>> {
  const ComboSynergiesProvider._({
    required ComboSynergiesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'comboSynergiesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$comboSynergiesHash();

  @override
  String toString() {
    return r'comboSynergiesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<(Agent, Agent), ComboSynergyStat>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<(Agent, Agent), ComboSynergyStat> create(Ref ref) {
    final argument = this.argument as String;
    return comboSynergies(ref, collectionId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<(Agent, Agent), ComboSynergyStat> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Map<(Agent, Agent), ComboSynergyStat>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ComboSynergiesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$comboSynergiesHash() => r'e9fc749b34b6338b9bd586bef89a68e6d407e120';

final class ComboSynergiesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Map<(Agent, Agent), ComboSynergyStat>,
          String
        > {
  const ComboSynergiesFamily._()
    : super(
        retry: null,
        name: r'comboSynergiesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ComboSynergiesProvider call({required String collectionId}) =>
      ComboSynergiesProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'comboSynergiesProvider';
}

@ProviderFor(sortedComboSynergiesList)
const sortedComboSynergiesListProvider = SortedComboSynergiesListFamily._();

final class SortedComboSynergiesListProvider
    extends
        $FunctionalProvider<
          List<ComboSynergyTableData>,
          List<ComboSynergyTableData>,
          List<ComboSynergyTableData>
        >
    with $Provider<List<ComboSynergyTableData>> {
  const SortedComboSynergiesListProvider._({
    required SortedComboSynergiesListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sortedComboSynergiesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sortedComboSynergiesListHash();

  @override
  String toString() {
    return r'sortedComboSynergiesListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ComboSynergyTableData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ComboSynergyTableData> create(Ref ref) {
    final argument = this.argument as String;
    return sortedComboSynergiesList(ref, collectionId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ComboSynergyTableData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ComboSynergyTableData>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SortedComboSynergiesListProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sortedComboSynergiesListHash() =>
    r'6be6446c36be0799d843530cc31bd530efc9cb48';

final class SortedComboSynergiesListFamily extends $Family
    with $FunctionalFamilyOverride<List<ComboSynergyTableData>, String> {
  const SortedComboSynergiesListFamily._()
    : super(
        retry: null,
        name: r'sortedComboSynergiesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SortedComboSynergiesListProvider call({required String collectionId}) =>
      SortedComboSynergiesListProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'sortedComboSynergiesListProvider';
}

@ProviderFor(ComboSynergySort)
const comboSynergySortProvider = ComboSynergySortProvider._();

final class ComboSynergySortProvider
    extends $NotifierProvider<ComboSynergySort, SynergySort> {
  const ComboSynergySortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'comboSynergySortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$comboSynergySortHash();

  @$internal
  @override
  ComboSynergySort create() => ComboSynergySort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SynergySort value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SynergySort>(value),
    );
  }
}

String _$comboSynergySortHash() => r'fc6256e9eee27e259b57bc78ee1b90db912e47f4';

abstract class _$ComboSynergySort extends $Notifier<SynergySort> {
  SynergySort build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SynergySort, SynergySort>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SynergySort, SynergySort>,
              SynergySort,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ComboSynergyFilter)
const comboSynergyFilterProvider = ComboSynergyFilterFamily._();

final class ComboSynergyFilterProvider
    extends $NotifierProvider<ComboSynergyFilter, SynergiesFilterState> {
  const ComboSynergyFilterProvider._({
    required ComboSynergyFilterFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'comboSynergyFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$comboSynergyFilterHash();

  @override
  String toString() {
    return r'comboSynergyFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ComboSynergyFilter create() => ComboSynergyFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SynergiesFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SynergiesFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ComboSynergyFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$comboSynergyFilterHash() =>
    r'85d7a22647572ccbc0c3c131ce981b9da95132ef';

final class ComboSynergyFilterFamily extends $Family
    with
        $ClassFamilyOverride<
          ComboSynergyFilter,
          SynergiesFilterState,
          SynergiesFilterState,
          SynergiesFilterState,
          String
        > {
  const ComboSynergyFilterFamily._()
    : super(
        retry: null,
        name: r'comboSynergyFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ComboSynergyFilterProvider call({required String collectionId}) =>
      ComboSynergyFilterProvider._(argument: collectionId, from: this);

  @override
  String toString() => r'comboSynergyFilterProvider';
}

abstract class _$ComboSynergyFilter extends $Notifier<SynergiesFilterState> {
  late final _$args = ref.$arg as String;
  String get collectionId => _$args;

  SynergiesFilterState build({required String collectionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(collectionId: _$args);
    final ref = this.ref as $Ref<SynergiesFilterState, SynergiesFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SynergiesFilterState, SynergiesFilterState>,
              SynergiesFilterState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
