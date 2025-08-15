// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agents_overview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AgentsOverviewNotifier)
const agentsOverviewNotifierProvider = AgentsOverviewNotifierProvider._();

final class AgentsOverviewNotifierProvider
    extends $NotifierProvider<AgentsOverviewNotifier, AgentsOverviewState> {
  const AgentsOverviewNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'agentsOverviewNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$agentsOverviewNotifierHash();

  @$internal
  @override
  AgentsOverviewNotifier create() => AgentsOverviewNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AgentsOverviewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AgentsOverviewState>(value),
    );
  }
}

String _$agentsOverviewNotifierHash() =>
    r'ae79671ba21db1a6aaeab49f3dc304ab4f06ebbe';

abstract class _$AgentsOverviewNotifier extends $Notifier<AgentsOverviewState> {
  AgentsOverviewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AgentsOverviewState, AgentsOverviewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AgentsOverviewState, AgentsOverviewState>,
              AgentsOverviewState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(agentsRepository)
const agentsRepositoryProvider = AgentsRepositoryProvider._();

final class AgentsRepositoryProvider
    extends
        $FunctionalProvider<
          AgentsRepository,
          AgentsRepository,
          AgentsRepository
        >
    with $Provider<AgentsRepository> {
  const AgentsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'agentsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$agentsRepositoryHash();

  @$internal
  @override
  $ProviderElement<AgentsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AgentsRepository create(Ref ref) {
    return agentsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AgentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AgentsRepository>(value),
    );
  }
}

String _$agentsRepositoryHash() => r'499e347f42c7a30b920f9ab0ce9c81ca7a818cd7';

@ProviderFor(defaultRosterName)
const defaultRosterNameProvider = DefaultRosterNameProvider._();

final class DefaultRosterNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const DefaultRosterNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultRosterNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultRosterNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return defaultRosterName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$defaultRosterNameHash() => r'1ea4d5b221a1a83c0619a8a0e9620545d8aed593';

@ProviderFor(availableRosters)
const availableRostersProvider = AvailableRostersProvider._();

final class AvailableRostersProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  const AvailableRostersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableRostersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableRostersHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return availableRosters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$availableRostersHash() => r'b1485f6ff44f090b67d1dd19ac95917ce181e9bf';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
