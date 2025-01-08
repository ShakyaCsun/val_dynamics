// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bundledAgentsHash() => r'dbc8ee8b8882885aa9f3fbfd8255915c340d656f';

/// See also [bundledAgents].
@ProviderFor(bundledAgents)
final bundledAgentsProvider = AutoDisposeProvider<Map<String, Agents>>.internal(
  bundledAgents,
  name: r'bundledAgentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bundledAgentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BundledAgentsRef = AutoDisposeProviderRef<Map<String, Agents>>;
String _$bundledMatchesHash() => r'39456424b7fa9ffaca3cf1df3f697b0d72bd4e93';

/// See also [bundledMatches].
@ProviderFor(bundledMatches)
final bundledMatchesProvider =
    AutoDisposeProvider<Map<String, List<RawMatch>>>.internal(
      bundledMatches,
      name: r'bundledMatchesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$bundledMatchesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BundledMatchesRef = AutoDisposeProviderRef<Map<String, List<RawMatch>>>;
String _$appDataInitializationStatusHash() =>
    r'b39423b6cf4096572a75818f4bc577b12ab38aab';

/// See also [appDataInitializationStatus].
@ProviderFor(appDataInitializationStatus)
final appDataInitializationStatusProvider =
    AutoDisposeProvider<(String message, bool isInitialized)>.internal(
      appDataInitializationStatus,
      name: r'appDataInitializationStatusProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$appDataInitializationStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDataInitializationStatusRef =
    AutoDisposeProviderRef<(String message, bool isInitialized)>;
String _$appDataNotifierHash() => r'b9be886166cd3b802944683ec0177b39a48ab085';

/// See also [AppDataNotifier].
@ProviderFor(AppDataNotifier)
final appDataNotifierProvider =
    AutoDisposeNotifierProvider<AppDataNotifier, AppData>.internal(
      AppDataNotifier.new,
      name: r'appDataNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$appDataNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppDataNotifier = AutoDisposeNotifier<AppData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
