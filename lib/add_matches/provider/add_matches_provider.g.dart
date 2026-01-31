// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_matches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddMatches)
final addMatchesProvider = AddMatchesProvider._();

final class AddMatchesProvider
    extends $NotifierProvider<AddMatches, AddMatchesForm> {
  AddMatchesProvider._()
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
    final ref = this.ref as $Ref<AddMatchesForm, AddMatchesForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddMatchesForm, AddMatchesForm>,
              AddMatchesForm,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
