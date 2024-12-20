// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matchup_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$styledMatchupListHash() => r'f69f5954ef76330de66310a39f40439b852e5043';

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

/// See also [styledMatchupList].
@ProviderFor(styledMatchupList)
const styledMatchupListProvider = StyledMatchupListFamily();

/// See also [styledMatchupList].
class StyledMatchupListFamily extends Family<ValorantMatches> {
  /// See also [styledMatchupList].
  const StyledMatchupListFamily();

  /// See also [styledMatchupList].
  StyledMatchupListProvider call({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
    required ({double aggro, double control, double midrange}) opponentAcm,
  }) {
    return StyledMatchupListProvider(
      collectionId: collectionId,
      acm: acm,
      opponentAcm: opponentAcm,
    );
  }

  @override
  StyledMatchupListProvider getProviderOverride(
    covariant StyledMatchupListProvider provider,
  ) {
    return call(
      collectionId: provider.collectionId,
      acm: provider.acm,
      opponentAcm: provider.opponentAcm,
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
  String? get name => r'styledMatchupListProvider';
}

/// See also [styledMatchupList].
class StyledMatchupListProvider extends AutoDisposeProvider<ValorantMatches> {
  /// See also [styledMatchupList].
  StyledMatchupListProvider({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
    required ({double aggro, double control, double midrange}) opponentAcm,
  }) : this._internal(
         (ref) => styledMatchupList(
           ref as StyledMatchupListRef,
           collectionId: collectionId,
           acm: acm,
           opponentAcm: opponentAcm,
         ),
         from: styledMatchupListProvider,
         name: r'styledMatchupListProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$styledMatchupListHash,
         dependencies: StyledMatchupListFamily._dependencies,
         allTransitiveDependencies:
             StyledMatchupListFamily._allTransitiveDependencies,
         collectionId: collectionId,
         acm: acm,
         opponentAcm: opponentAcm,
       );

  StyledMatchupListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.acm,
    required this.opponentAcm,
  }) : super.internal();

  final String collectionId;
  final ({double aggro, double control, double midrange}) acm;
  final ({double aggro, double control, double midrange}) opponentAcm;

  @override
  Override overrideWith(
    ValorantMatches Function(StyledMatchupListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StyledMatchupListProvider._internal(
        (ref) => create(ref as StyledMatchupListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        acm: acm,
        opponentAcm: opponentAcm,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ValorantMatches> createElement() {
    return _StyledMatchupListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchupListProvider &&
        other.collectionId == collectionId &&
        other.acm == acm &&
        other.opponentAcm == opponentAcm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, acm.hashCode);
    hash = _SystemHash.combine(hash, opponentAcm.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StyledMatchupListRef
    on AutoDisposeProviderRef<ValorantMatches> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;

  /// The parameter `acm` of this provider.
  ({double aggro, double control, double midrange}) get acm;

  /// The parameter `opponentAcm` of this provider.
  ({double aggro, double control, double midrange}) get opponentAcm;
}

class _StyledMatchupListProviderElement
    extends AutoDisposeProviderElement<ValorantMatches>
    with StyledMatchupListRef {
  _StyledMatchupListProviderElement(super.provider);

  @override
  String get collectionId => (origin as StyledMatchupListProvider).collectionId;
  @override
  ({double aggro, double control, double midrange}) get acm =>
      (origin as StyledMatchupListProvider).acm;
  @override
  ({double aggro, double control, double midrange}) get opponentAcm =>
      (origin as StyledMatchupListProvider).opponentAcm;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
