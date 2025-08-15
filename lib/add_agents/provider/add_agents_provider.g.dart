// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_agents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

String _$addAgentsHash() => r'bc38f74514a04c8a5f9228473ceaf349b3580c36';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
