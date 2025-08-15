// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(agents)
const agentsProvider = AgentsFamily._();

final class AgentsProvider extends $FunctionalProvider<Agents, Agents, Agents>
    with $Provider<Agents> {
  const AgentsProvider._({
    required AgentsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'agentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$agentsHash();

  @override
  String toString() {
    return r'agentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Agents> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Agents create(Ref ref) {
    final argument = this.argument as String;
    return agents(ref, rosterName: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Agents value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Agents>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AgentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$agentsHash() => r'bf123aaa9a70a62997255260e04f41ebc5949f0e';

final class AgentsFamily extends $Family
    with $FunctionalFamilyOverride<Agents, String> {
  const AgentsFamily._()
    : super(
        retry: null,
        name: r'agentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AgentsProvider call({required String rosterName}) =>
      AgentsProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'agentsProvider';
}

@ProviderFor(SelectedAgent)
const selectedAgentProvider = SelectedAgentFamily._();

final class SelectedAgentProvider
    extends $NotifierProvider<SelectedAgent, Agent?> {
  const SelectedAgentProvider._({
    required SelectedAgentFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'selectedAgentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedAgentHash();

  @override
  String toString() {
    return r'selectedAgentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SelectedAgent create() => SelectedAgent();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Agent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Agent?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedAgentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedAgentHash() => r'65a4a711658b47d00291bd585d0639717ab67407';

final class SelectedAgentFamily extends $Family
    with $ClassFamilyOverride<SelectedAgent, Agent?, Agent?, Agent?, String> {
  const SelectedAgentFamily._()
    : super(
        retry: null,
        name: r'selectedAgentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedAgentProvider call({required String rosterName}) =>
      SelectedAgentProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'selectedAgentProvider';
}

abstract class _$SelectedAgent extends $Notifier<Agent?> {
  late final _$args = ref.$arg as String;
  String get rosterName => _$args;

  Agent? build({required String rosterName});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(rosterName: _$args);
    final ref = this.ref as $Ref<Agent?, Agent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Agent?, Agent?>,
              Agent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
