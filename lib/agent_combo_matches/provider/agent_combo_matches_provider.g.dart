// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_combo_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$agentComboMatchesHash() => r'da823bd093ec22465917428c330172a10c7026fd';

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

/// See also [agentComboMatches].
@ProviderFor(agentComboMatches)
const agentComboMatchesProvider = AgentComboMatchesFamily();

/// See also [agentComboMatches].
class AgentComboMatchesFamily extends Family<ValorantMatches> {
  /// See also [agentComboMatches].
  const AgentComboMatchesFamily();

  /// See also [agentComboMatches].
  AgentComboMatchesProvider call({
    required String collectionId,
    required String comboName,
  }) {
    return AgentComboMatchesProvider(
      collectionId: collectionId,
      comboName: comboName,
    );
  }

  @override
  AgentComboMatchesProvider getProviderOverride(
    covariant AgentComboMatchesProvider provider,
  ) {
    return call(
      collectionId: provider.collectionId,
      comboName: provider.comboName,
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
  String? get name => r'agentComboMatchesProvider';
}

/// See also [agentComboMatches].
class AgentComboMatchesProvider extends AutoDisposeProvider<ValorantMatches> {
  /// See also [agentComboMatches].
  AgentComboMatchesProvider({
    required String collectionId,
    required String comboName,
  }) : this._internal(
         (ref) => agentComboMatches(
           ref as AgentComboMatchesRef,
           collectionId: collectionId,
           comboName: comboName,
         ),
         from: agentComboMatchesProvider,
         name: r'agentComboMatchesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$agentComboMatchesHash,
         dependencies: AgentComboMatchesFamily._dependencies,
         allTransitiveDependencies:
             AgentComboMatchesFamily._allTransitiveDependencies,
         collectionId: collectionId,
         comboName: comboName,
       );

  AgentComboMatchesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.comboName,
  }) : super.internal();

  final String collectionId;
  final String comboName;

  @override
  Override overrideWith(
    ValorantMatches Function(AgentComboMatchesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AgentComboMatchesProvider._internal(
        (ref) => create(ref as AgentComboMatchesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        comboName: comboName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ValorantMatches> createElement() {
    return _AgentComboMatchesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentComboMatchesProvider &&
        other.collectionId == collectionId &&
        other.comboName == comboName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, comboName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AgentComboMatchesRef on AutoDisposeProviderRef<ValorantMatches> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;

  /// The parameter `comboName` of this provider.
  String get comboName;
}

class _AgentComboMatchesProviderElement
    extends AutoDisposeProviderElement<ValorantMatches>
    with AgentComboMatchesRef {
  _AgentComboMatchesProviderElement(super.provider);

  @override
  String get collectionId => (origin as AgentComboMatchesProvider).collectionId;
  @override
  String get comboName => (origin as AgentComboMatchesProvider).comboName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
