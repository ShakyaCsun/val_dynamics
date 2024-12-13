// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rosterNameHash() => r'bec4ddf348c3698ff3b5d06887aa2a0294675ea1';

/// See also [rosterName].
@ProviderFor(rosterName)
final rosterNameProvider = AutoDisposeProvider<String>.internal(
  rosterName,
  name: r'rosterNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rosterNameHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RosterNameRef = AutoDisposeProviderRef<String>;
String _$agentsHash() => r'bf123aaa9a70a62997255260e04f41ebc5949f0e';

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

/// See also [agents].
@ProviderFor(agents)
const agentsProvider = AgentsFamily();

/// See also [agents].
class AgentsFamily extends Family<Agents> {
  /// See also [agents].
  const AgentsFamily();

  /// See also [agents].
  AgentsProvider call({required String rosterName}) {
    return AgentsProvider(rosterName: rosterName);
  }

  @override
  AgentsProvider getProviderOverride(covariant AgentsProvider provider) {
    return call(rosterName: provider.rosterName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'agentsProvider';
}

/// See also [agents].
class AgentsProvider extends AutoDisposeProvider<Agents> {
  /// See also [agents].
  AgentsProvider({required String rosterName})
    : this._internal(
        (ref) => agents(ref as AgentsRef, rosterName: rosterName),
        from: agentsProvider,
        name: r'agentsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$agentsHash,
        dependencies: AgentsFamily._dependencies,
        allTransitiveDependencies: AgentsFamily._allTransitiveDependencies,
        rosterName: rosterName,
      );

  AgentsProvider._internal(
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
  Override overrideWith(Agents Function(AgentsRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AgentsProvider._internal(
        (ref) => create(ref as AgentsRef),
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
  AutoDisposeProviderElement<Agents> createElement() {
    return _AgentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentsProvider && other.rosterName == rosterName;
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
mixin AgentsRef
    on AutoDisposeProviderRef<Agents> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _AgentsProviderElement extends AutoDisposeProviderElement<Agents>
    with AgentsRef {
  _AgentsProviderElement(super.provider);

  @override
  String get rosterName => (origin as AgentsProvider).rosterName;
}

String _$selectedAgentHash() => r'65a4a711658b47d00291bd585d0639717ab67407';

abstract class _$SelectedAgent extends BuildlessAutoDisposeNotifier<Agent?> {
  late final String rosterName;

  Agent? build({required String rosterName});
}

/// See also [SelectedAgent].
@ProviderFor(SelectedAgent)
const selectedAgentProvider = SelectedAgentFamily();

/// See also [SelectedAgent].
class SelectedAgentFamily extends Family<Agent?> {
  /// See also [SelectedAgent].
  const SelectedAgentFamily();

  /// See also [SelectedAgent].
  SelectedAgentProvider call({required String rosterName}) {
    return SelectedAgentProvider(rosterName: rosterName);
  }

  @override
  SelectedAgentProvider getProviderOverride(
    covariant SelectedAgentProvider provider,
  ) {
    return call(rosterName: provider.rosterName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedAgentProvider';
}

/// See also [SelectedAgent].
class SelectedAgentProvider
    extends AutoDisposeNotifierProviderImpl<SelectedAgent, Agent?> {
  /// See also [SelectedAgent].
  SelectedAgentProvider({required String rosterName})
    : this._internal(
        () => SelectedAgent()..rosterName = rosterName,
        from: selectedAgentProvider,
        name: r'selectedAgentProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$selectedAgentHash,
        dependencies: SelectedAgentFamily._dependencies,
        allTransitiveDependencies:
            SelectedAgentFamily._allTransitiveDependencies,
        rosterName: rosterName,
      );

  SelectedAgentProvider._internal(
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
  Agent? runNotifierBuild(covariant SelectedAgent notifier) {
    return notifier.build(rosterName: rosterName);
  }

  @override
  Override overrideWith(SelectedAgent Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedAgentProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectedAgent, Agent?> createElement() {
    return _SelectedAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedAgentProvider && other.rosterName == rosterName;
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
mixin SelectedAgentRef
    on AutoDisposeNotifierProviderRef<Agent?> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _SelectedAgentProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedAgent, Agent?>
    with SelectedAgentRef {
  _SelectedAgentProviderElement(super.provider);

  @override
  String get rosterName => (origin as SelectedAgentProvider).rosterName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
