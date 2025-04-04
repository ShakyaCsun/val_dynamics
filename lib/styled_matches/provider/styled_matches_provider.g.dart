// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$styledMatchesHash() => r'77524b31cfb2c86ad44708601b741430d99f5bfc';

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

abstract class _$StyledMatches
    extends BuildlessAutoDisposeNotifier<StyledMatchesState> {
  late final String collectionId;
  late final ({double aggro, double control, double midrange}) acm;

  StyledMatchesState build({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  });
}

/// See also [StyledMatches].
@ProviderFor(StyledMatches)
const styledMatchesProvider = StyledMatchesFamily();

/// See also [StyledMatches].
class StyledMatchesFamily extends Family<StyledMatchesState> {
  /// See also [StyledMatches].
  const StyledMatchesFamily();

  /// See also [StyledMatches].
  StyledMatchesProvider call({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) {
    return StyledMatchesProvider(collectionId: collectionId, acm: acm);
  }

  @override
  StyledMatchesProvider getProviderOverride(
    covariant StyledMatchesProvider provider,
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
  String? get name => r'styledMatchesProvider';
}

/// See also [StyledMatches].
class StyledMatchesProvider
    extends AutoDisposeNotifierProviderImpl<StyledMatches, StyledMatchesState> {
  /// See also [StyledMatches].
  StyledMatchesProvider({
    required String collectionId,
    required ({double aggro, double control, double midrange}) acm,
  }) : this._internal(
         () =>
             StyledMatches()
               ..collectionId = collectionId
               ..acm = acm,
         from: styledMatchesProvider,
         name: r'styledMatchesProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$styledMatchesHash,
         dependencies: StyledMatchesFamily._dependencies,
         allTransitiveDependencies:
             StyledMatchesFamily._allTransitiveDependencies,
         collectionId: collectionId,
         acm: acm,
       );

  StyledMatchesProvider._internal(
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
  StyledMatchesState runNotifierBuild(covariant StyledMatches notifier) {
    return notifier.build(collectionId: collectionId, acm: acm);
  }

  @override
  Override overrideWith(StyledMatches Function() create) {
    return ProviderOverride(
      origin: this,
      override: StyledMatchesProvider._internal(
        () =>
            create()
              ..collectionId = collectionId
              ..acm = acm,
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
  AutoDisposeNotifierProviderElement<StyledMatches, StyledMatchesState>
  createElement() {
    return _StyledMatchesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StyledMatchesProvider &&
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
mixin StyledMatchesRef on AutoDisposeNotifierProviderRef<StyledMatchesState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;

  /// The parameter `acm` of this provider.
  ({double aggro, double control, double midrange}) get acm;
}

class _StyledMatchesProviderElement
    extends
        AutoDisposeNotifierProviderElement<StyledMatches, StyledMatchesState>
    with StyledMatchesRef {
  _StyledMatchesProviderElement(super.provider);

  @override
  String get collectionId => (origin as StyledMatchesProvider).collectionId;
  @override
  ({double aggro, double control, double midrange}) get acm =>
      (origin as StyledMatchesProvider).acm;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
