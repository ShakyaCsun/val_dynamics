// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(bundledAgents)
const bundledAgentsProvider = BundledAgentsProvider._();

final class BundledAgentsProvider
    extends
        $FunctionalProvider<
          Map<String, Agents>,
          Map<String, Agents>,
          Map<String, Agents>
        >
    with $Provider<Map<String, Agents>> {
  const BundledAgentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bundledAgentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bundledAgentsHash();

  @$internal
  @override
  $ProviderElement<Map<String, Agents>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, Agents> create(Ref ref) {
    return bundledAgents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Agents> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Agents>>(value),
    );
  }
}

String _$bundledAgentsHash() => r'a4f31ca7cd4e912bd8de8be7e0924c0dc2065537';

@ProviderFor(bundledMatches)
const bundledMatchesProvider = BundledMatchesProvider._();

final class BundledMatchesProvider
    extends
        $FunctionalProvider<
          Map<String, List<RawMatch>>,
          Map<String, List<RawMatch>>,
          Map<String, List<RawMatch>>
        >
    with $Provider<Map<String, List<RawMatch>>> {
  const BundledMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bundledMatchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bundledMatchesHash();

  @$internal
  @override
  $ProviderElement<Map<String, List<RawMatch>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, List<RawMatch>> create(Ref ref) {
    return bundledMatches(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<RawMatch>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<RawMatch>>>(value),
    );
  }
}

String _$bundledMatchesHash() => r'dd87da23995bcb59b569a645b167e7a63bff8c80';

@ProviderFor(appDataInitializationStatus)
const appDataInitializationStatusProvider =
    AppDataInitializationStatusProvider._();

final class AppDataInitializationStatusProvider
    extends
        $FunctionalProvider<
          (String message, bool isInitialized),
          (String message, bool isInitialized),
          (String message, bool isInitialized)
        >
    with $Provider<(String message, bool isInitialized)> {
  const AppDataInitializationStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDataInitializationStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDataInitializationStatusHash();

  @$internal
  @override
  $ProviderElement<(String message, bool isInitialized)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  (String message, bool isInitialized) create(Ref ref) {
    return appDataInitializationStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((String message, bool isInitialized) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<(String message, bool isInitialized)>(value),
    );
  }
}

String _$appDataInitializationStatusHash() =>
    r'b39423b6cf4096572a75818f4bc577b12ab38aab';

@ProviderFor(AppDataNotifier)
const appDataNotifierProvider = AppDataNotifierProvider._();

final class AppDataNotifierProvider
    extends $NotifierProvider<AppDataNotifier, AppData> {
  const AppDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDataNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDataNotifierHash();

  @$internal
  @override
  AppDataNotifier create() => AppDataNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppData>(value),
    );
  }
}

String _$appDataNotifierHash() => r'b979ec5e40626cc6217f3d67bbdfc0b69ebc4db4';

abstract class _$AppDataNotifier extends $Notifier<AppData> {
  AppData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppData, AppData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppData, AppData>,
              AppData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
