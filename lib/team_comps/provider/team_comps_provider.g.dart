// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_comps_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredCompositionsHash() =>
    r'0875f264a1e69c79bc7df7bcc379e0ecc0987003';

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

/// See also [filteredCompositions].
@ProviderFor(filteredCompositions)
const filteredCompositionsProvider = FilteredCompositionsFamily();

/// See also [filteredCompositions].
class FilteredCompositionsFamily extends Family<List<AgentComp>> {
  /// See also [filteredCompositions].
  const FilteredCompositionsFamily();

  /// See also [filteredCompositions].
  FilteredCompositionsProvider call({
    required String rosterName,
  }) {
    return FilteredCompositionsProvider(
      rosterName: rosterName,
    );
  }

  @override
  FilteredCompositionsProvider getProviderOverride(
    covariant FilteredCompositionsProvider provider,
  ) {
    return call(
      rosterName: provider.rosterName,
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
  String? get name => r'filteredCompositionsProvider';
}

/// See also [filteredCompositions].
class FilteredCompositionsProvider
    extends AutoDisposeProvider<List<AgentComp>> {
  /// See also [filteredCompositions].
  FilteredCompositionsProvider({
    required String rosterName,
  }) : this._internal(
          (ref) => filteredCompositions(
            ref as FilteredCompositionsRef,
            rosterName: rosterName,
          ),
          from: filteredCompositionsProvider,
          name: r'filteredCompositionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredCompositionsHash,
          dependencies: FilteredCompositionsFamily._dependencies,
          allTransitiveDependencies:
              FilteredCompositionsFamily._allTransitiveDependencies,
          rosterName: rosterName,
        );

  FilteredCompositionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rosterName,
  }) : super.internal();

  final String rosterName;

  @override
  Override overrideWith(
    List<AgentComp> Function(FilteredCompositionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredCompositionsProvider._internal(
        (ref) => create(ref as FilteredCompositionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rosterName: rosterName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AgentComp>> createElement() {
    return _FilteredCompositionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredCompositionsProvider &&
        other.rosterName == rosterName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rosterName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredCompositionsRef on AutoDisposeProviderRef<List<AgentComp>> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _FilteredCompositionsProviderElement
    extends AutoDisposeProviderElement<List<AgentComp>>
    with FilteredCompositionsRef {
  _FilteredCompositionsProviderElement(super.provider);

  @override
  String get rosterName => (origin as FilteredCompositionsProvider).rosterName;
}

String _$teamCompsTernaryDataHash() =>
    r'058db8a0da1872513141bb103bce387b8325a507';

/// See also [teamCompsTernaryData].
@ProviderFor(teamCompsTernaryData)
const teamCompsTernaryDataProvider = TeamCompsTernaryDataFamily();

/// See also [teamCompsTernaryData].
class TeamCompsTernaryDataFamily
    extends Family<Map<AgentCompsTernaryData, TernaryPoint>> {
  /// See also [teamCompsTernaryData].
  const TeamCompsTernaryDataFamily();

  /// See also [teamCompsTernaryData].
  TeamCompsTernaryDataProvider call({
    required String rosterName,
  }) {
    return TeamCompsTernaryDataProvider(
      rosterName: rosterName,
    );
  }

  @override
  TeamCompsTernaryDataProvider getProviderOverride(
    covariant TeamCompsTernaryDataProvider provider,
  ) {
    return call(
      rosterName: provider.rosterName,
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
  String? get name => r'teamCompsTernaryDataProvider';
}

/// See also [teamCompsTernaryData].
class TeamCompsTernaryDataProvider
    extends AutoDisposeProvider<Map<AgentCompsTernaryData, TernaryPoint>> {
  /// See also [teamCompsTernaryData].
  TeamCompsTernaryDataProvider({
    required String rosterName,
  }) : this._internal(
          (ref) => teamCompsTernaryData(
            ref as TeamCompsTernaryDataRef,
            rosterName: rosterName,
          ),
          from: teamCompsTernaryDataProvider,
          name: r'teamCompsTernaryDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$teamCompsTernaryDataHash,
          dependencies: TeamCompsTernaryDataFamily._dependencies,
          allTransitiveDependencies:
              TeamCompsTernaryDataFamily._allTransitiveDependencies,
          rosterName: rosterName,
        );

  TeamCompsTernaryDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rosterName,
  }) : super.internal();

  final String rosterName;

  @override
  Override overrideWith(
    Map<AgentCompsTernaryData, TernaryPoint> Function(
            TeamCompsTernaryDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TeamCompsTernaryDataProvider._internal(
        (ref) => create(ref as TeamCompsTernaryDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rosterName: rosterName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Map<AgentCompsTernaryData, TernaryPoint>>
      createElement() {
    return _TeamCompsTernaryDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamCompsTernaryDataProvider &&
        other.rosterName == rosterName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rosterName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TeamCompsTernaryDataRef
    on AutoDisposeProviderRef<Map<AgentCompsTernaryData, TernaryPoint>> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _TeamCompsTernaryDataProviderElement
    extends AutoDisposeProviderElement<Map<AgentCompsTernaryData, TernaryPoint>>
    with TeamCompsTernaryDataRef {
  _TeamCompsTernaryDataProviderElement(super.provider);

  @override
  String get rosterName => (origin as TeamCompsTernaryDataProvider).rosterName;
}

String _$compositionsReadyHash() => r'073d41e77f154dd94f4b964411f4bd7c9b96f76f';

/// See also [compositionsReady].
@ProviderFor(compositionsReady)
const compositionsReadyProvider = CompositionsReadyFamily();

/// See also [compositionsReady].
class CompositionsReadyFamily extends Family<bool> {
  /// See also [compositionsReady].
  const CompositionsReadyFamily();

  /// See also [compositionsReady].
  CompositionsReadyProvider call({
    required String rosterName,
  }) {
    return CompositionsReadyProvider(
      rosterName: rosterName,
    );
  }

  @override
  CompositionsReadyProvider getProviderOverride(
    covariant CompositionsReadyProvider provider,
  ) {
    return call(
      rosterName: provider.rosterName,
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
  String? get name => r'compositionsReadyProvider';
}

/// See also [compositionsReady].
class CompositionsReadyProvider extends AutoDisposeProvider<bool> {
  /// See also [compositionsReady].
  CompositionsReadyProvider({
    required String rosterName,
  }) : this._internal(
          (ref) => compositionsReady(
            ref as CompositionsReadyRef,
            rosterName: rosterName,
          ),
          from: compositionsReadyProvider,
          name: r'compositionsReadyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compositionsReadyHash,
          dependencies: CompositionsReadyFamily._dependencies,
          allTransitiveDependencies:
              CompositionsReadyFamily._allTransitiveDependencies,
          rosterName: rosterName,
        );

  CompositionsReadyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rosterName,
  }) : super.internal();

  final String rosterName;

  @override
  Override overrideWith(
    bool Function(CompositionsReadyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompositionsReadyProvider._internal(
        (ref) => create(ref as CompositionsReadyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rosterName: rosterName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _CompositionsReadyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompositionsReadyProvider && other.rosterName == rosterName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rosterName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CompositionsReadyRef on AutoDisposeProviderRef<bool> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _CompositionsReadyProviderElement extends AutoDisposeProviderElement<bool>
    with CompositionsReadyRef {
  _CompositionsReadyProviderElement(super.provider);

  @override
  String get rosterName => (origin as CompositionsReadyProvider).rosterName;
}

String _$compositionsHash() => r'6b2992dddd26c6fc1d0702a57cb18480b75fa151';

abstract class _$Compositions
    extends BuildlessAutoDisposeAsyncNotifier<CompositionsState> {
  late final String rosterName;

  FutureOr<CompositionsState> build({
    required String rosterName,
  });
}

/// See also [Compositions].
@ProviderFor(Compositions)
const compositionsProvider = CompositionsFamily();

/// See also [Compositions].
class CompositionsFamily extends Family<AsyncValue<CompositionsState>> {
  /// See also [Compositions].
  const CompositionsFamily();

  /// See also [Compositions].
  CompositionsProvider call({
    required String rosterName,
  }) {
    return CompositionsProvider(
      rosterName: rosterName,
    );
  }

  @override
  CompositionsProvider getProviderOverride(
    covariant CompositionsProvider provider,
  ) {
    return call(
      rosterName: provider.rosterName,
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
  String? get name => r'compositionsProvider';
}

/// See also [Compositions].
class CompositionsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    Compositions, CompositionsState> {
  /// See also [Compositions].
  CompositionsProvider({
    required String rosterName,
  }) : this._internal(
          () => Compositions()..rosterName = rosterName,
          from: compositionsProvider,
          name: r'compositionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compositionsHash,
          dependencies: CompositionsFamily._dependencies,
          allTransitiveDependencies:
              CompositionsFamily._allTransitiveDependencies,
          rosterName: rosterName,
        );

  CompositionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rosterName,
  }) : super.internal();

  final String rosterName;

  @override
  FutureOr<CompositionsState> runNotifierBuild(
    covariant Compositions notifier,
  ) {
    return notifier.build(
      rosterName: rosterName,
    );
  }

  @override
  Override overrideWith(Compositions Function() create) {
    return ProviderOverride(
      origin: this,
      override: CompositionsProvider._internal(
        () => create()..rosterName = rosterName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rosterName: rosterName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Compositions, CompositionsState>
      createElement() {
    return _CompositionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompositionsProvider && other.rosterName == rosterName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rosterName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CompositionsRef
    on AutoDisposeAsyncNotifierProviderRef<CompositionsState> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _CompositionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Compositions,
        CompositionsState> with CompositionsRef {
  _CompositionsProviderElement(super.provider);

  @override
  String get rosterName => (origin as CompositionsProvider).rosterName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
