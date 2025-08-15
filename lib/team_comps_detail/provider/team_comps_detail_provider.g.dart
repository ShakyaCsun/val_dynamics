// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_comps_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(selectedAgentComps)
const selectedAgentCompsProvider = SelectedAgentCompsFamily._();

final class SelectedAgentCompsProvider
    extends
        $FunctionalProvider<List<AgentComp>, List<AgentComp>, List<AgentComp>>
    with $Provider<List<AgentComp>> {
  const SelectedAgentCompsProvider._({
    required SelectedAgentCompsFamily super.from,
    required ({String rosterName, StylePoints stylePoints}) super.argument,
  }) : super(
         retry: null,
         name: r'selectedAgentCompsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedAgentCompsHash();

  @override
  String toString() {
    return r'selectedAgentCompsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<AgentComp>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<AgentComp> create(Ref ref) {
    final argument =
        this.argument as ({String rosterName, StylePoints stylePoints});
    return selectedAgentComps(
      ref,
      rosterName: argument.rosterName,
      stylePoints: argument.stylePoints,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AgentComp> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AgentComp>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedAgentCompsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedAgentCompsHash() =>
    r'8e40ebc2777a7a795097e3d2571ff137a136137d';

final class SelectedAgentCompsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<AgentComp>,
          ({String rosterName, StylePoints stylePoints})
        > {
  const SelectedAgentCompsFamily._()
    : super(
        retry: null,
        name: r'selectedAgentCompsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedAgentCompsProvider call({
    required String rosterName,
    required StylePoints stylePoints,
  }) => SelectedAgentCompsProvider._(
    argument: (rosterName: rosterName, stylePoints: stylePoints),
    from: this,
  );

  @override
  String toString() => r'selectedAgentCompsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
