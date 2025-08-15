// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddMatches)
const addMatchesProvider = AddMatchesProvider._();

final class AddMatchesProvider
    extends $NotifierProvider<AddMatches, AddMatchesForm> {
  const AddMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addMatchesHash();

  @$internal
  @override
  AddMatches create() => AddMatches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddMatchesForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddMatchesForm>(value),
    );
  }
}

String _$addMatchesHash() => r'e23df694cf009e117e41dec1f789db44ee3a081a';

abstract class _$AddMatches extends $Notifier<AddMatchesForm> {
  AddMatchesForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddMatchesForm, AddMatchesForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddMatchesForm, AddMatchesForm>,
              AddMatchesForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
