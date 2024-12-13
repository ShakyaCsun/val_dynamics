// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$compFiltersHash() => r'04e7febceff2a03ee5816d0abfe30e69ef53ff6c';

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

abstract class _$CompFilters
    extends BuildlessAutoDisposeNotifier<CompFiltersState> {
  late final String rosterName;

  CompFiltersState build({required String rosterName});
}

/// See also [CompFilters].
@ProviderFor(CompFilters)
const compFiltersProvider = CompFiltersFamily();

/// See also [CompFilters].
class CompFiltersFamily extends Family<CompFiltersState> {
  /// See also [CompFilters].
  const CompFiltersFamily();

  /// See also [CompFilters].
  CompFiltersProvider call({required String rosterName}) {
    return CompFiltersProvider(rosterName: rosterName);
  }

  @override
  CompFiltersProvider getProviderOverride(
    covariant CompFiltersProvider provider,
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
  String? get name => r'compFiltersProvider';
}

/// See also [CompFilters].
class CompFiltersProvider
    extends AutoDisposeNotifierProviderImpl<CompFilters, CompFiltersState> {
  /// See also [CompFilters].
  CompFiltersProvider({required String rosterName})
    : this._internal(
        () => CompFilters()..rosterName = rosterName,
        from: compFiltersProvider,
        name: r'compFiltersProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$compFiltersHash,
        dependencies: CompFiltersFamily._dependencies,
        allTransitiveDependencies: CompFiltersFamily._allTransitiveDependencies,
        rosterName: rosterName,
      );

  CompFiltersProvider._internal(
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
  CompFiltersState runNotifierBuild(covariant CompFilters notifier) {
    return notifier.build(rosterName: rosterName);
  }

  @override
  Override overrideWith(CompFilters Function() create) {
    return ProviderOverride(
      origin: this,
      override: CompFiltersProvider._internal(
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
  AutoDisposeNotifierProviderElement<CompFilters, CompFiltersState>
  createElement() {
    return _CompFiltersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompFiltersProvider && other.rosterName == rosterName;
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
mixin CompFiltersRef
    on AutoDisposeNotifierProviderRef<CompFiltersState> {
  /// The parameter `rosterName` of this provider.
  String get rosterName;
}

class _CompFiltersProviderElement
    extends AutoDisposeNotifierProviderElement<CompFilters, CompFiltersState>
    with CompFiltersRef {
  _CompFiltersProviderElement(super.provider);

  @override
  String get rosterName => (origin as CompFiltersProvider).rosterName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
