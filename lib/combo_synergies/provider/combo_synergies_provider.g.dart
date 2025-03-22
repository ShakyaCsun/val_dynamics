// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_synergies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableMapsHash() => r'7ad80f8e643500ac0fc327b0af733c3e546fe180';

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

/// See also [availableMaps].
@ProviderFor(availableMaps)
const availableMapsProvider = AvailableMapsFamily();

/// See also [availableMaps].
class AvailableMapsFamily extends Family<Set<String>> {
  /// See also [availableMaps].
  const AvailableMapsFamily();

  /// See also [availableMaps].
  AvailableMapsProvider call({required String collectionId}) {
    return AvailableMapsProvider(collectionId: collectionId);
  }

  @override
  AvailableMapsProvider getProviderOverride(
    covariant AvailableMapsProvider provider,
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
  String? get name => r'availableMapsProvider';
}

/// See also [availableMaps].
class AvailableMapsProvider extends AutoDisposeProvider<Set<String>> {
  /// See also [availableMaps].
  AvailableMapsProvider({required String collectionId})
    : this._internal(
        (ref) =>
            availableMaps(ref as AvailableMapsRef, collectionId: collectionId),
        from: availableMapsProvider,
        name: r'availableMapsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$availableMapsHash,
        dependencies: AvailableMapsFamily._dependencies,
        allTransitiveDependencies:
            AvailableMapsFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  AvailableMapsProvider._internal(
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
  Override overrideWith(
    Set<String> Function(AvailableMapsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AvailableMapsProvider._internal(
        (ref) => create(ref as AvailableMapsRef),
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
  AutoDisposeProviderElement<Set<String>> createElement() {
    return _AvailableMapsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableMapsProvider && other.collectionId == collectionId;
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
mixin AvailableMapsRef on AutoDisposeProviderRef<Set<String>> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _AvailableMapsProviderElement
    extends AutoDisposeProviderElement<Set<String>>
    with AvailableMapsRef {
  _AvailableMapsProviderElement(super.provider);

  @override
  String get collectionId => (origin as AvailableMapsProvider).collectionId;
}

String _$comboSynergiesHash() => r'e63a83323ec98b537e90873018cca1c7345b844a';

abstract class _$ComboSynergies
    extends BuildlessAutoDisposeNotifier<SynergiesState> {
  late final String collectionId;

  SynergiesState build({required String collectionId});
}

/// See also [ComboSynergies].
@ProviderFor(ComboSynergies)
const comboSynergiesProvider = ComboSynergiesFamily();

/// See also [ComboSynergies].
class ComboSynergiesFamily extends Family<SynergiesState> {
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
    extends AutoDisposeNotifierProviderImpl<ComboSynergies, SynergiesState> {
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
  SynergiesState runNotifierBuild(covariant ComboSynergies notifier) {
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
  AutoDisposeNotifierProviderElement<ComboSynergies, SynergiesState>
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
mixin ComboSynergiesRef on AutoDisposeNotifierProviderRef<SynergiesState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _ComboSynergiesProviderElement
    extends AutoDisposeNotifierProviderElement<ComboSynergies, SynergiesState>
    with ComboSynergiesRef {
  _ComboSynergiesProviderElement(super.provider);

  @override
  String get collectionId => (origin as ComboSynergiesProvider).collectionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
