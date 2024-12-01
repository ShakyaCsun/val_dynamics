// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableMapsHash() => r'894e78c61efba3be795864523a144232e2d8ce34';

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
  AvailableMapsProvider call({
    required String collectionName,
  }) {
    return AvailableMapsProvider(
      collectionName: collectionName,
    );
  }

  @override
  AvailableMapsProvider getProviderOverride(
    covariant AvailableMapsProvider provider,
  ) {
    return call(
      collectionName: provider.collectionName,
    );
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
  AvailableMapsProvider({
    required String collectionName,
  }) : this._internal(
          (ref) => availableMaps(
            ref as AvailableMapsRef,
            collectionName: collectionName,
          ),
          from: availableMapsProvider,
          name: r'availableMapsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
    extends AutoDisposeProviderElement<Set<String>> with AvailableMapsRef {
  _AvailableMapsProviderElement(super.provider);

  @override
  String get collectionName => (origin as AvailableMapsProvider).collectionName;
}

String _$selectedMapsHash() => r'327c96ea31d1b87a5a7e615ef2d80c2658dcc6f1';

/// See also [selectedMaps].
@ProviderFor(selectedMaps)
const selectedMapsProvider = SelectedMapsFamily();

/// See also [selectedMaps].
class SelectedMapsFamily extends Family<Set<String>> {
  /// See also [selectedMaps].
  const SelectedMapsFamily();

  /// See also [selectedMaps].
  SelectedMapsProvider call({
    required String collectionName,
  }) {
    return SelectedMapsProvider(
      collectionName: collectionName,
    );
  }

  @override
  SelectedMapsProvider getProviderOverride(
    covariant SelectedMapsProvider provider,
  ) {
    return call(
      collectionName: provider.collectionName,
    );
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
  SelectedMapsProvider({
    required String collectionName,
  }) : this._internal(
          (ref) => selectedMaps(
            ref as SelectedMapsRef,
            collectionName: collectionName,
          ),
          from: selectedMapsProvider,
          name: r'selectedMapsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
  Override overrideWith(
    Set<String> Function(SelectedMapsRef provider) create,
  ) {
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
    extends AutoDisposeProviderElement<Set<String>> with SelectedMapsRef {
  _SelectedMapsProviderElement(super.provider);

  @override
  String get collectionName => (origin as SelectedMapsProvider).collectionName;
}

String _$matchesHash() => r'b68c639c8c032367e6916b91ad8d90e372f60eb0';

abstract class _$Matches extends BuildlessAutoDisposeNotifier<MatchesState> {
  late final String collectionId;

  MatchesState build({
    required String collectionId,
  });
}

/// See also [Matches].
@ProviderFor(Matches)
const matchesProvider = MatchesFamily();

/// See also [Matches].
class MatchesFamily extends Family<MatchesState> {
  /// See also [Matches].
  const MatchesFamily();

  /// See also [Matches].
  MatchesProvider call({
    required String collectionId,
  }) {
    return MatchesProvider(
      collectionId: collectionId,
    );
  }

  @override
  MatchesProvider getProviderOverride(
    covariant MatchesProvider provider,
  ) {
    return call(
      collectionId: provider.collectionId,
    );
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
    extends AutoDisposeNotifierProviderImpl<Matches, MatchesState> {
  /// See also [Matches].
  MatchesProvider({
    required String collectionId,
  }) : this._internal(
          () => Matches()..collectionId = collectionId,
          from: matchesProvider,
          name: r'matchesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
  MatchesState runNotifierBuild(
    covariant Matches notifier,
  ) {
    return notifier.build(
      collectionId: collectionId,
    );
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
  AutoDisposeNotifierProviderElement<Matches, MatchesState> createElement() {
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
mixin MatchesRef on AutoDisposeNotifierProviderRef<MatchesState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _MatchesProviderElement
    extends AutoDisposeNotifierProviderElement<Matches, MatchesState>
    with MatchesRef {
  _MatchesProviderElement(super.provider);

  @override
  String get collectionId => (origin as MatchesProvider).collectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
