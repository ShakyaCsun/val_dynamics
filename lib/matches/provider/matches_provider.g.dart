// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchesRepositoryHash() => r'2570457637d02aa38fa33943af48e7ce4355feb5';

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

/// See also [matchesRepository].
@ProviderFor(matchesRepository)
const matchesRepositoryProvider = MatchesRepositoryFamily();

/// See also [matchesRepository].
class MatchesRepositoryFamily extends Family<MatchesRepository> {
  /// See also [matchesRepository].
  const MatchesRepositoryFamily();

  /// See also [matchesRepository].
  MatchesRepositoryProvider call({required String collectionId}) {
    return MatchesRepositoryProvider(collectionId: collectionId);
  }

  @override
  MatchesRepositoryProvider getProviderOverride(
    covariant MatchesRepositoryProvider provider,
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
  String? get name => r'matchesRepositoryProvider';
}

/// See also [matchesRepository].
class MatchesRepositoryProvider extends AutoDisposeProvider<MatchesRepository> {
  /// See also [matchesRepository].
  MatchesRepositoryProvider({required String collectionId})
    : this._internal(
        (ref) => matchesRepository(
          ref as MatchesRepositoryRef,
          collectionId: collectionId,
        ),
        from: matchesRepositoryProvider,
        name: r'matchesRepositoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$matchesRepositoryHash,
        dependencies: MatchesRepositoryFamily._dependencies,
        allTransitiveDependencies:
            MatchesRepositoryFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  MatchesRepositoryProvider._internal(
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
    MatchesRepository Function(MatchesRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchesRepositoryProvider._internal(
        (ref) => create(ref as MatchesRepositoryRef),
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
  AutoDisposeProviderElement<MatchesRepository> createElement() {
    return _MatchesRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesRepositoryProvider &&
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
mixin MatchesRepositoryRef on AutoDisposeProviderRef<MatchesRepository> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _MatchesRepositoryProviderElement
    extends AutoDisposeProviderElement<MatchesRepository>
    with MatchesRepositoryRef {
  _MatchesRepositoryProviderElement(super.provider);

  @override
  String get collectionId => (origin as MatchesRepositoryProvider).collectionId;
}

String _$availableMapsHash() => r'290dccdc7138e2c65994e4988b9ab69286d304ce';

/// See also [availableMaps].
@ProviderFor(availableMaps)
const availableMapsProvider = AvailableMapsFamily();

/// See also [availableMaps].
class AvailableMapsFamily extends Family<Set<String>> {
  /// See also [availableMaps].
  const AvailableMapsFamily();

  /// See also [availableMaps].
  AvailableMapsProvider call({required String collectionName}) {
    return AvailableMapsProvider(collectionName: collectionName);
  }

  @override
  AvailableMapsProvider getProviderOverride(
    covariant AvailableMapsProvider provider,
  ) {
    return call(collectionName: provider.collectionName);
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
  AvailableMapsProvider({required String collectionName})
    : this._internal(
        (ref) => availableMaps(
          ref as AvailableMapsRef,
          collectionName: collectionName,
        ),
        from: availableMapsProvider,
        name: r'availableMapsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$availableMapsHash,
        dependencies: AvailableMapsFamily._dependencies,
        allTransitiveDependencies:
            AvailableMapsFamily._allTransitiveDependencies,
        collectionName: collectionName,
      );

  AvailableMapsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionName,
  }) : super.internal();

  final String collectionName;

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
        collectionName: collectionName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Set<String>> createElement() {
    return _AvailableMapsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableMapsProvider &&
        other.collectionName == collectionName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AvailableMapsRef on AutoDisposeProviderRef<Set<String>> {
  /// The parameter `collectionName` of this provider.
  String get collectionName;
}

class _AvailableMapsProviderElement
    extends AutoDisposeProviderElement<Set<String>>
    with AvailableMapsRef {
  _AvailableMapsProviderElement(super.provider);

  @override
  String get collectionName => (origin as AvailableMapsProvider).collectionName;
}

String _$selectedMapsHash() => r'b3c07a8afd429fb9844a36bf209f96556062895a';

/// See also [selectedMaps].
@ProviderFor(selectedMaps)
const selectedMapsProvider = SelectedMapsFamily();

/// See also [selectedMaps].
class SelectedMapsFamily extends Family<Set<String>> {
  /// See also [selectedMaps].
  const SelectedMapsFamily();

  /// See also [selectedMaps].
  SelectedMapsProvider call({required String collectionName}) {
    return SelectedMapsProvider(collectionName: collectionName);
  }

  @override
  SelectedMapsProvider getProviderOverride(
    covariant SelectedMapsProvider provider,
  ) {
    return call(collectionName: provider.collectionName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedMapsProvider';
}

/// See also [selectedMaps].
class SelectedMapsProvider extends AutoDisposeProvider<Set<String>> {
  /// See also [selectedMaps].
  SelectedMapsProvider({required String collectionName})
    : this._internal(
        (ref) => selectedMaps(
          ref as SelectedMapsRef,
          collectionName: collectionName,
        ),
        from: selectedMapsProvider,
        name: r'selectedMapsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$selectedMapsHash,
        dependencies: SelectedMapsFamily._dependencies,
        allTransitiveDependencies:
            SelectedMapsFamily._allTransitiveDependencies,
        collectionName: collectionName,
      );

  SelectedMapsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionName,
  }) : super.internal();

  final String collectionName;

  @override
  Override overrideWith(Set<String> Function(SelectedMapsRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SelectedMapsProvider._internal(
        (ref) => create(ref as SelectedMapsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionName: collectionName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Set<String>> createElement() {
    return _SelectedMapsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedMapsProvider &&
        other.collectionName == collectionName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedMapsRef on AutoDisposeProviderRef<Set<String>> {
  /// The parameter `collectionName` of this provider.
  String get collectionName;
}

class _SelectedMapsProviderElement
    extends AutoDisposeProviderElement<Set<String>>
    with SelectedMapsRef {
  _SelectedMapsProviderElement(super.provider);

  @override
  String get collectionName => (origin as SelectedMapsProvider).collectionName;
}

String _$matchesHash() => r'f5f8c2b5beefd480b84cea698a59c7e2028c3508';

abstract class _$Matches extends BuildlessAutoDisposeNotifier<ValorantMatches> {
  late final String collectionId;

  ValorantMatches build({required String collectionId});
}

/// See also [Matches].
@ProviderFor(Matches)
const matchesProvider = MatchesFamily();

/// See also [Matches].
class MatchesFamily extends Family<ValorantMatches> {
  /// See also [Matches].
  const MatchesFamily();

  /// See also [Matches].
  MatchesProvider call({required String collectionId}) {
    return MatchesProvider(collectionId: collectionId);
  }

  @override
  MatchesProvider getProviderOverride(covariant MatchesProvider provider) {
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
  String? get name => r'matchesProvider';
}

/// See also [Matches].
class MatchesProvider
    extends AutoDisposeNotifierProviderImpl<Matches, ValorantMatches> {
  /// See also [Matches].
  MatchesProvider({required String collectionId})
    : this._internal(
        () => Matches()..collectionId = collectionId,
        from: matchesProvider,
        name: r'matchesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$matchesHash,
        dependencies: MatchesFamily._dependencies,
        allTransitiveDependencies: MatchesFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  MatchesProvider._internal(
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
  ValorantMatches runNotifierBuild(covariant Matches notifier) {
    return notifier.build(collectionId: collectionId);
  }

  @override
  Override overrideWith(Matches Function() create) {
    return ProviderOverride(
      origin: this,
      override: MatchesProvider._internal(
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
  AutoDisposeNotifierProviderElement<Matches, ValorantMatches> createElement() {
    return _MatchesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesProvider && other.collectionId == collectionId;
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
mixin MatchesRef on AutoDisposeNotifierProviderRef<ValorantMatches> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _MatchesProviderElement
    extends AutoDisposeNotifierProviderElement<Matches, ValorantMatches>
    with MatchesRef {
  _MatchesProviderElement(super.provider);

  @override
  String get collectionId => (origin as MatchesProvider).collectionId;
}

String _$matchesFilterHash() => r'8fccfeb0a893a7a5d58e6dc0c7b9d8f7ac67c3cd';

abstract class _$MatchesFilter
    extends BuildlessAutoDisposeNotifier<MatchesFilterState> {
  late final String collectionId;

  MatchesFilterState build({required String collectionId});
}

/// See also [MatchesFilter].
@ProviderFor(MatchesFilter)
const matchesFilterProvider = MatchesFilterFamily();

/// See also [MatchesFilter].
class MatchesFilterFamily extends Family<MatchesFilterState> {
  /// See also [MatchesFilter].
  const MatchesFilterFamily();

  /// See also [MatchesFilter].
  MatchesFilterProvider call({required String collectionId}) {
    return MatchesFilterProvider(collectionId: collectionId);
  }

  @override
  MatchesFilterProvider getProviderOverride(
    covariant MatchesFilterProvider provider,
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
  String? get name => r'matchesFilterProvider';
}

/// See also [MatchesFilter].
class MatchesFilterProvider
    extends AutoDisposeNotifierProviderImpl<MatchesFilter, MatchesFilterState> {
  /// See also [MatchesFilter].
  MatchesFilterProvider({required String collectionId})
    : this._internal(
        () => MatchesFilter()..collectionId = collectionId,
        from: matchesFilterProvider,
        name: r'matchesFilterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$matchesFilterHash,
        dependencies: MatchesFilterFamily._dependencies,
        allTransitiveDependencies:
            MatchesFilterFamily._allTransitiveDependencies,
        collectionId: collectionId,
      );

  MatchesFilterProvider._internal(
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
  MatchesFilterState runNotifierBuild(covariant MatchesFilter notifier) {
    return notifier.build(collectionId: collectionId);
  }

  @override
  Override overrideWith(MatchesFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: MatchesFilterProvider._internal(
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
  AutoDisposeNotifierProviderElement<MatchesFilter, MatchesFilterState>
  createElement() {
    return _MatchesFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesFilterProvider && other.collectionId == collectionId;
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
mixin MatchesFilterRef on AutoDisposeNotifierProviderRef<MatchesFilterState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _MatchesFilterProviderElement
    extends
        AutoDisposeNotifierProviderElement<MatchesFilter, MatchesFilterState>
    with MatchesFilterRef {
  _MatchesFilterProviderElement(super.provider);

  @override
  String get collectionId => (origin as MatchesFilterProvider).collectionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
