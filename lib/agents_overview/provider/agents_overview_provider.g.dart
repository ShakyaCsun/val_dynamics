// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agents_overview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$agentsRepositoryHash() => r'f8fa8073049773b81537988ad031fc2ea9573f49';

/// See also [agentsRepository].
@ProviderFor(agentsRepository)
final agentsRepositoryProvider = Provider<AgentsRepository>.internal(
  agentsRepository,
  name: r'agentsRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$agentsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AgentsRepositoryRef = ProviderRef<AgentsRepository>;
String _$defaultRosterNameHash() => r'1ea4d5b221a1a83c0619a8a0e9620545d8aed593';

/// See also [defaultRosterName].
@ProviderFor(defaultRosterName)
final defaultRosterNameProvider = AutoDisposeProvider<String>.internal(
  defaultRosterName,
  name: r'defaultRosterNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$defaultRosterNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DefaultRosterNameRef = AutoDisposeProviderRef<String>;
String _$availableRostersHash() => r'b1485f6ff44f090b67d1dd19ac95917ce181e9bf';

/// See also [availableRosters].
@ProviderFor(availableRosters)
final availableRostersProvider = AutoDisposeProvider<List<String>>.internal(
  availableRosters,
  name: r'availableRostersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availableRostersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableRostersRef = AutoDisposeProviderRef<List<String>>;
String _$agentsOverviewNotifierHash() =>
    r'ae79671ba21db1a6aaeab49f3dc304ab4f06ebbe';

/// See also [AgentsOverviewNotifier].
@ProviderFor(AgentsOverviewNotifier)
final agentsOverviewNotifierProvider = AutoDisposeNotifierProvider<
  AgentsOverviewNotifier,
  AgentsOverviewState
>.internal(
  AgentsOverviewNotifier.new,
  name: r'agentsOverviewNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$agentsOverviewNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AgentsOverviewNotifier = AutoDisposeNotifier<AgentsOverviewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
