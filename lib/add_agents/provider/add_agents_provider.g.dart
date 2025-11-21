// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_agents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddAgents)
const addAgentsProvider = AddAgentsProvider._();

final class AddAgentsProvider
    extends $NotifierProvider<AddAgents, AddAgentsForm> {
  const AddAgentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addAgentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addAgentsHash();

  @$internal
  @override
  AddAgents create() => AddAgents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddAgentsForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddAgentsForm>(value),
    );
  }
}

String _$addAgentsHash() => r'0ffa3bdd9be76c3ae377a8dc572c5e6d50d1ccc8';

abstract class _$AddAgents extends $Notifier<AddAgentsForm> {
  AddAgentsForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddAgentsForm, AddAgentsForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddAgentsForm, AddAgentsForm>,
              AddAgentsForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
