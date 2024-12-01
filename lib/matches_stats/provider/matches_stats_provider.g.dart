// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchesStatsHash() => r'36bb7ebd5701782f63a258af5a194dae0018cde8';

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

abstract class _$MatchesStats
    extends BuildlessAutoDisposeNotifier<List<StyledMatchesStat>> {
  late final String collectionId;

  List<StyledMatchesStat> build({
    required String collectionId,
  });
}

/// See also [MatchesStats].
@ProviderFor(MatchesStats)
const matchesStatsProvider = MatchesStatsFamily();

/// See also [MatchesStats].
class MatchesStatsFamily extends Family<List<StyledMatchesStat>> {
  /// See also [MatchesStats].
  const MatchesStatsFamily();

  /// See also [MatchesStats].
  MatchesStatsProvider call({
    required String collectionId,
  }) {
    return MatchesStatsProvider(
      collectionId: collectionId,
    );
  }

  @override
  MatchesStatsProvider getProviderOverride(
    covariant MatchesStatsProvider provider,
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
  String? get name => r'matchesStatsProvider';
}

/// See also [MatchesStats].
class MatchesStatsProvider extends AutoDisposeNotifierProviderImpl<MatchesStats,
    List<StyledMatchesStat>> {
  /// See also [MatchesStats].
  MatchesStatsProvider({
    required String collectionId,
  }) : this._internal(
          () => MatchesStats()..collectionId = collectionId,
          from: matchesStatsProvider,
          name: r'matchesStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchesStatsHash,
          dependencies: MatchesStatsFamily._dependencies,
          allTransitiveDependencies:
              MatchesStatsFamily._allTransitiveDependencies,
          collectionId: collectionId,
        );

  MatchesStatsProvider._internal(
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
  List<StyledMatchesStat> runNotifierBuild(
    covariant MatchesStats notifier,
  ) {
    return notifier.build(
      collectionId: collectionId,
    );
  }

  @override
  Override overrideWith(MatchesStats Function() create) {
    return ProviderOverride(
      origin: this,
      override: MatchesStatsProvider._internal(
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
  AutoDisposeNotifierProviderElement<MatchesStats, List<StyledMatchesStat>>
      createElement() {
    return _MatchesStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesStatsProvider && other.collectionId == collectionId;
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
mixin MatchesStatsRef
    on AutoDisposeNotifierProviderRef<List<StyledMatchesStat>> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _MatchesStatsProviderElement extends AutoDisposeNotifierProviderElement<
    MatchesStats, List<StyledMatchesStat>> with MatchesStatsRef {
  _MatchesStatsProviderElement(super.provider);

  @override
  String get collectionId => (origin as MatchesStatsProvider).collectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
