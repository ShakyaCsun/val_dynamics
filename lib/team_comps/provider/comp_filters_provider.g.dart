// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CompFilters)
const compFiltersProvider = CompFiltersFamily._();

final class CompFiltersProvider
    extends $NotifierProvider<CompFilters, CompFiltersState> {
  const CompFiltersProvider._({
    required CompFiltersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'compFiltersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$compFiltersHash();

  @override
  String toString() {
    return r'compFiltersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CompFilters create() => CompFilters();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompFiltersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompFiltersState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompFiltersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$compFiltersHash() => r'04e7febceff2a03ee5816d0abfe30e69ef53ff6c';

final class CompFiltersFamily extends $Family
    with
        $ClassFamilyOverride<
          CompFilters,
          CompFiltersState,
          CompFiltersState,
          CompFiltersState,
          String
        > {
  const CompFiltersFamily._()
    : super(
        retry: null,
        name: r'compFiltersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompFiltersProvider call({required String rosterName}) =>
      CompFiltersProvider._(argument: rosterName, from: this);

  @override
  String toString() => r'compFiltersProvider';
}

abstract class _$CompFilters extends $Notifier<CompFiltersState> {
  late final _$args = ref.$arg as String;
  String get rosterName => _$args;

  CompFiltersState build({required String rosterName});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(rosterName: _$args);
    final ref = this.ref as $Ref<CompFiltersState, CompFiltersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompFiltersState, CompFiltersState>,
              CompFiltersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
