// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matches_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$styledMatchesListHash() => r'971e650b9134ba40b6f4ae9d5b4a9c38154606fe';

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

/// See also [styledMatchesList].
@ProviderFor(styledMatchesList)
const styledMatchesListProvider = StyledMatchesListFamily();

/// See also [styledMatchesList].
class StyledMatchesListFamily extends Family<ValorantMatches> {
  /// See also [styledMatchesList].
  const StyledMatchesListFamily();

  /// See also [styledMatchesList].
  StyledMatchesListProvider call({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) {
    return StyledMatchesListProvider(collectionId: collectionId, acm: acm);
  }

  @override
  StyledMatchesListProvider getProviderOverride(
    covariant StyledMatchesListProvider provider,
  ) {
    return call(collectionId: provider.collectionId, acm: provider.acm);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'styledMatchesListProvider';
}

/// See also [styledMatchesList].
class StyledMatchesListProvider extends AutoDisposeProvider<ValorantMatches> {
  /// See also [styledMatchesList].
  StyledMatchesListProvider({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) : this._internal(
         (ref) => styledMatchesList(
           ref as StyledMatchesListRef,
           collectionId: collectionId,
           acm: acm,
         ),
         from: styledMatchesListProvider,
         name: r'styledMatchesListProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$styledMatchesListHash,
         dependencies: StyledMatchesListFamily._dependencies,
         allTransitiveDependencies:
             StyledMatchesListFamily._allTransitiveDependencies,
         collectionId: collectionId,
         acm: acm,
       );

  StyledMatchesListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.acm,
  }) : super.internal();

  final String collectionId;
  final ({double aggro, double control, double midrange}) acm;

  @override
  Override overrideWith(
    ValorantMatches Function(StyledMatchesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StyledMatchesListProvider._internal(
        (ref) => create(ref as StyledMatchesListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        acm: acm,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ValorantMatches> createElement() {
    return _StyledMatchesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchesListProvider &&
        other.collectionId == collectionId &&
        other.acm == acm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, acm.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StyledMatchesListRef on AutoDisposeProviderRef<ValorantMatches> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;

  /// The parameter `acm` of this provider.
  ({double aggro, double control, double midrange}) get acm;
}

class _StyledMatchesListProviderElement
    extends AutoDisposeProviderElement<ValorantMatches>
    with StyledMatchesListRef {
  _StyledMatchesListProviderElement(super.provider);

  @override
  String get collectionId => (origin as StyledMatchesListProvider).collectionId;
  @override
  ({double aggro, double control, double midrange}) get acm =>
      (origin as StyledMatchesListProvider).acm;
}

String _$styledMatchesDataListHash() =>
    r'94b0011320a0c5ccb22c9818dfbc745907244a8c';

/// See also [styledMatchesDataList].
@ProviderFor(styledMatchesDataList)
const styledMatchesDataListProvider = StyledMatchesDataListFamily();

/// See also [styledMatchesDataList].
class StyledMatchesDataListFamily
    extends Family<List<(StyledMatchesSummaryData, ValorantMatches)>> {
  /// See also [styledMatchesDataList].
  const StyledMatchesDataListFamily();

  /// See also [styledMatchesDataList].
  StyledMatchesDataListProvider call({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) {
    return StyledMatchesDataListProvider(collectionId: collectionId, acm: acm);
  }

  @override
  StyledMatchesDataListProvider getProviderOverride(
    covariant StyledMatchesDataListProvider provider,
  ) {
    return call(collectionId: provider.collectionId, acm: provider.acm);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'styledMatchesDataListProvider';
}

/// See also [styledMatchesDataList].
class StyledMatchesDataListProvider
    extends
        AutoDisposeProvider<List<(StyledMatchesSummaryData, ValorantMatches)>> {
  /// See also [styledMatchesDataList].
  StyledMatchesDataListProvider({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) : this._internal(
         (ref) => styledMatchesDataList(
           ref as StyledMatchesDataListRef,
           collectionId: collectionId,
           acm: acm,
         ),
         from: styledMatchesDataListProvider,
         name: r'styledMatchesDataListProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$styledMatchesDataListHash,
         dependencies: StyledMatchesDataListFamily._dependencies,
         allTransitiveDependencies:
             StyledMatchesDataListFamily._allTransitiveDependencies,
         collectionId: collectionId,
         acm: acm,
       );

  StyledMatchesDataListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.acm,
  }) : super.internal();

  final String collectionId;
  final ({double aggro, double control, double midrange}) acm;

  @override
  Override overrideWith(
    List<(StyledMatchesSummaryData, ValorantMatches)> Function(
      StyledMatchesDataListRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StyledMatchesDataListProvider._internal(
        (ref) => create(ref as StyledMatchesDataListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        acm: acm,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<(StyledMatchesSummaryData, ValorantMatches)>>
  createElement() {
    return _StyledMatchesDataListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchesDataListProvider &&
        other.collectionId == collectionId &&
        other.acm == acm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, acm.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StyledMatchesDataListRef
    on
        AutoDisposeProviderRef<
          List<(StyledMatchesSummaryData, ValorantMatches)>
        > {
  /// The parameter `collectionId` of this provider.
  String get collectionId;

  /// The parameter `acm` of this provider.
  ({double aggro, double control, double midrange}) get acm;
}

class _StyledMatchesDataListProviderElement
    extends
        AutoDisposeProviderElement<
          List<(StyledMatchesSummaryData, ValorantMatches)>
        >
    with StyledMatchesDataListRef {
  _StyledMatchesDataListProviderElement(super.provider);

  @override
  String get collectionId =>
      (origin as StyledMatchesDataListProvider).collectionId;
  @override
  ({double aggro, double control, double midrange}) get acm =>
      (origin as StyledMatchesDataListProvider).acm;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
