// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_comps_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedAgentCompsHash() =>
    r'8e40ebc2777a7a795097e3d2571ff137a136137d';

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

/// See also [selectedAgentComps].
@ProviderFor(selectedAgentComps)
const selectedAgentCompsProvider = SelectedAgentCompsFamily();

/// See also [selectedAgentComps].
class SelectedAgentCompsFamily extends Family<List<AgentComp>> {
  /// See also [selectedAgentComps].
  const SelectedAgentCompsFamily();

  /// See also [selectedAgentComps].
  SelectedAgentCompsProvider call({
    required String rosterName,
    required ({double aggro, double control, double midrange}) stylePoints,
  }) {
    return SelectedAgentCompsProvider(
      rosterName: rosterName,
      stylePoints: stylePoints,
    );
  }

  @override
  SelectedAgentCompsProvider getProviderOverride(
    covariant SelectedAgentCompsProvider provider,
  ) {
    return call(
      rosterName: provider.rosterName,
      stylePoints: provider.stylePoints,
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
  String? get name => r'selectedAgentCompsProvider';
}

/// See also [selectedAgentComps].
class SelectedAgentCompsProvider extends AutoDisposeProvider<List<AgentComp>> {
  /// See also [selectedAgentComps].
  SelectedAgentCompsProvider({
    required String rosterName,
    required ({double aggro, double control, double midrange}) stylePoints,
  }) : this._internal(
         (ref) => selectedAgentComps(
           ref as SelectedAgentCompsRef,
           rosterName: rosterName,
           stylePoints: stylePoints,
         ),
         from: selectedAgentCompsProvider,
         name: r'selectedAgentCompsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$selectedAgentCompsHash,
         dependencies: SelectedAgentCompsFamily._dependencies,
         allTransitiveDependencies:
             SelectedAgentCompsFamily._allTransitiveDependencies,
         rosterName: rosterName,
         stylePoints: stylePoints,
       );

  SelectedAgentCompsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rosterName,
    required this.stylePoints,
  }) : super.internal();

  final String rosterName;
  final ({double aggro, double control, double midrange}) stylePoints;

  @override
  Override overrideWith(
    List<AgentComp> Function(SelectedAgentCompsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedAgentCompsProvider._internal(
        (ref) => create(ref as SelectedAgentCompsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rosterName: rosterName,
        stylePoints: stylePoints,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AgentComp>> createElement() {
    return _SelectedAgentCompsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedAgentCompsProvider &&
        other.rosterName == rosterName &&
        other.stylePoints == stylePoints;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rosterName.hashCode);
    hash = _SystemHash.combine(hash, stylePoints.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedAgentCompsRef on AutoDisposeProviderRef<List<AgentComp>> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;

  /// The parameter `stylePoints` of this provider.
  ({double aggro, double control, double midrange}) get stylePoints;
}

class _SelectedAgentCompsProviderElement
    extends AutoDisposeProviderElement<List<AgentComp>>
    with SelectedAgentCompsRef {
  _SelectedAgentCompsProviderElement(super.provider);

  @override
  String get rosterName => (origin as SelectedAgentCompsProvider).rosterName;
  @override
  ({double aggro, double control, double midrange}) get stylePoints =>
      (origin as SelectedAgentCompsProvider).stylePoints;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
