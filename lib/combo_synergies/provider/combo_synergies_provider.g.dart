// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_synergies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$comboSynergiesHash() => r'f637ea99a0692dbb2e5444120edb43d168cd0ea2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ComboSynergies
    extends
        BuildlessAutoDisposeNotifier<Map<(Agent, Agent), ComboSynergyStat>> {
  late final String collectionId;

  Map<(Agent, Agent), ComboSynergyStat> build({required String collectionId});
}

/// See also [ComboSynergies].
@ProviderFor(ComboSynergies)
const comboSynergiesProvider = ComboSynergiesFamily();

/// See also [ComboSynergies].
class ComboSynergiesFamily
    extends Family<Map<(Agent, Agent), ComboSynergyStat>> {
  /// See also [ComboSynergies].
  const ComboSynergiesFamily();

  /// See also [ComboSynergies].
  ComboSynergiesProvider call({required String collectionId}) {
    return ComboSynergiesProvider(collectionId: collectionId);
  }

  @override
  ComboSynergiesProvider getProviderOverride(
    covariant ComboSynergiesProvider provider,
  ) {
    return call(collectionId: provider.collectionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'comboSynergiesProvider';
}

/// See also [ComboSynergies].
class ComboSynergiesProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ComboSynergies,
          Map<(Agent, Agent), ComboSynergyStat>
        > {
  /// See also [ComboSynergies].
  ComboSynergiesProvider({required String collectionId})
    : this._internal(
        () => ComboSynergies()..collectionId = collectionId,
        from: comboSynergiesProvider,
        name: r'comboSynergiesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$comboSynergiesHash,
        dependencies: ComboSynergiesFamily._dependencies,
        allTransitiveDependencies:
            ComboSynergiesFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  ComboSynergiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final String collectionId;

  @override
  Map<(Agent, Agent), ComboSynergyStat> runNotifierBuild(
    covariant ComboSynergies notifier,
  ) {
    return notifier.build(collectionId: collectionId);
  }

  @override
  Override overrideWith(ComboSynergies Function() create) {
    return ProviderOverride(
      origin: this,
      override: ComboSynergiesProvider._internal(
        () => create()..collectionId = collectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    ComboSynergies,
    Map<(Agent, Agent), ComboSynergyStat>
  >
  createElement() {
    return _ComboSynergiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ComboSynergiesProvider &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ComboSynergiesRef
    on AutoDisposeNotifierProviderRef<Map<(Agent, Agent), ComboSynergyStat>> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _ComboSynergiesProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ComboSynergies,
          Map<(Agent, Agent), ComboSynergyStat>
        >
    with ComboSynergiesRef {
  _ComboSynergiesProviderElement(super.provider);

  @override
  String get collectionId => (origin as ComboSynergiesProvider).collectionId;
}

String _$comboSynergyFilterHash() =>
    r'36d5b50cd24c2349bcf372dad8ad7fa83e206311';

abstract class _$ComboSynergyFilter
    extends BuildlessAutoDisposeNotifier<SynergiesFilterState> {
  late final String collectionId;

  SynergiesFilterState build({required String collectionId});
}

/// See also [ComboSynergyFilter].
@ProviderFor(ComboSynergyFilter)
const comboSynergyFilterProvider = ComboSynergyFilterFamily();

/// See also [ComboSynergyFilter].
class ComboSynergyFilterFamily extends Family<SynergiesFilterState> {
  /// See also [ComboSynergyFilter].
  const ComboSynergyFilterFamily();

  /// See also [ComboSynergyFilter].
  ComboSynergyFilterProvider call({required String collectionId}) {
    return ComboSynergyFilterProvider(collectionId: collectionId);
  }

  @override
  ComboSynergyFilterProvider getProviderOverride(
    covariant ComboSynergyFilterProvider provider,
  ) {
    return call(collectionId: provider.collectionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'comboSynergyFilterProvider';
}

/// See also [ComboSynergyFilter].
class ComboSynergyFilterProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ComboSynergyFilter,
          SynergiesFilterState
        > {
  /// See also [ComboSynergyFilter].
  ComboSynergyFilterProvider({required String collectionId})
    : this._internal(
        () => ComboSynergyFilter()..collectionId = collectionId,
        from: comboSynergyFilterProvider,
        name: r'comboSynergyFilterProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$comboSynergyFilterHash,
        dependencies: ComboSynergyFilterFamily._dependencies,
        allTransitiveDependencies:
            ComboSynergyFilterFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  ComboSynergyFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final String collectionId;

  @override
  SynergiesFilterState runNotifierBuild(covariant ComboSynergyFilter notifier) {
    return notifier.build(collectionId: collectionId);
  }

  @override
  Override overrideWith(ComboSynergyFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ComboSynergyFilterProvider._internal(
        () => create()..collectionId = collectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ComboSynergyFilter, SynergiesFilterState>
  createElement() {
    return _ComboSynergyFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ComboSynergyFilterProvider &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ComboSynergyFilterRef
    on AutoDisposeNotifierProviderRef<SynergiesFilterState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _ComboSynergyFilterProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ComboSynergyFilter,
          SynergiesFilterState
        >
    with ComboSynergyFilterRef {
  _ComboSynergyFilterProviderElement(super.provider);

  @override
  String get collectionId =>
      (origin as ComboSynergyFilterProvider).collectionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
