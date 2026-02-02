// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bundledAgents)
final bundledAgentsProvider = BundledAgentsProvider._();

final class BundledAgentsProvider
    extends
        $FunctionalProvider<
          Map<String, Agents>,
          Map<String, Agents>,
          Map<String, Agents>
        >
    with $Provider<Map<String, Agents>> {
  BundledAgentsProvider._()
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

String _$bundledAgentsHash() => r'a01f1fd64d0d40ca651213a381378bcd51c5193d';

@ProviderFor(bundledMatches)
final bundledMatchesProvider = BundledMatchesProvider._();

final class BundledMatchesProvider
    extends
        $FunctionalProvider<
          Map<String, List<RawMatch>>,
          Map<String, List<RawMatch>>,
          Map<String, List<RawMatch>>
        >
    with $Provider<Map<String, List<RawMatch>>> {
  BundledMatchesProvider._()
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

String _$bundledMatchesHash() => r'668ed0b025a4c2e1ef380078339c6358aa22efd9';

@ProviderFor(appDataInitializationStatus)
final appDataInitializationStatusProvider =
    AppDataInitializationStatusProvider._();

final class AppDataInitializationStatusProvider
    extends $FunctionalProvider<(String, bool), (String, bool), (String, bool)>
    with $Provider<(String, bool)> {
  AppDataInitializationStatusProvider._()
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
  $ProviderElement<(String, bool)> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  (String, bool) create(Ref ref) {
    return appDataInitializationStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((String, bool) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(String, bool)>(value),
    );
  }
}

String _$appDataInitializationStatusHash() =>
    r'9189381f392c9202d960fe0b8dadd60f050d29fd';

@ProviderFor(AppDataNotifier)
final appDataProvider = AppDataNotifierProvider._();

final class AppDataNotifierProvider
    extends $NotifierProvider<AppDataNotifier, AppData> {
  AppDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDataProvider',
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

String _$appDataNotifierHash() => r'7daf58b21d6bbb2faad57619878e27aac09c58a1';

abstract class _$AppDataNotifier extends $Notifier<AppData> {
  AppData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppData, AppData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppData, AppData>,
              AppData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
