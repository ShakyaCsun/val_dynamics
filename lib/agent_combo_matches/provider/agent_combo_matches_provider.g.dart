// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_combo_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(agentComboMatches)
const agentComboMatchesProvider = AgentComboMatchesFamily._();

final class AgentComboMatchesProvider
    extends
        $FunctionalProvider<ValorantMatches, ValorantMatches, ValorantMatches>
    with $Provider<ValorantMatches> {
  const AgentComboMatchesProvider._({
    required AgentComboMatchesFamily super.from,
    required ({String collectionId, String comboName}) super.argument,
  }) : super(
         retry: null,
         name: r'agentComboMatchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$agentComboMatchesHash();

  @override
  String toString() {
    return r'agentComboMatchesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ValorantMatches> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ValorantMatches create(Ref ref) {
    final argument = this.argument as ({String collectionId, String comboName});
    return agentComboMatches(
      ref,
      collectionId: argument.collectionId,
      comboName: argument.comboName,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValorantMatches value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValorantMatches>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AgentComboMatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$agentComboMatchesHash() => r'da823bd093ec22465917428c330172a10c7026fd';

final class AgentComboMatchesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ValorantMatches,
          ({String collectionId, String comboName})
        > {
  const AgentComboMatchesFamily._()
    : super(
        retry: null,
        name: r'agentComboMatchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AgentComboMatchesProvider call({
    required String collectionId,
    required String comboName,
  }) => AgentComboMatchesProvider._(
    argument: (collectionId: collectionId, comboName: comboName),
    from: this,
  );

  @override
  String toString() => r'agentComboMatchesProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
