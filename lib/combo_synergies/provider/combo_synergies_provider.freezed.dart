// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_synergies_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynergiesFilterState {
  WinLossFilter get winLossFilter;
  Set<String> get selectedMaps;
  (Role, Role) get rolesCombo;
  ComboCriteria get comboCriteria;
  int get minRounds;

  /// Create a copy of SynergiesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SynergiesFilterStateCopyWith<SynergiesFilterState> get copyWith =>
      _$SynergiesFilterStateCopyWithImpl<SynergiesFilterState>(
        this as SynergiesFilterState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SynergiesFilterState &&
            (identical(other.winLossFilter, winLossFilter) ||
                other.winLossFilter == winLossFilter) &&
            const DeepCollectionEquality().equals(
              other.selectedMaps,
              selectedMaps,
            ) &&
            (identical(other.rolesCombo, rolesCombo) ||
                other.rolesCombo == rolesCombo) &&
            (identical(other.comboCriteria, comboCriteria) ||
                other.comboCriteria == comboCriteria) &&
            (identical(other.minRounds, minRounds) ||
                other.minRounds == minRounds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    winLossFilter,
    const DeepCollectionEquality().hash(selectedMaps),
    rolesCombo,
    comboCriteria,
    minRounds,
  );

  @override
  String toString() {
    return 'SynergiesFilterState(winLossFilter: $winLossFilter, selectedMaps: $selectedMaps, rolesCombo: $rolesCombo, comboCriteria: $comboCriteria, minRounds: $minRounds)';
  }
}

/// @nodoc
abstract mixin class $SynergiesFilterStateCopyWith<$Res> {
  factory $SynergiesFilterStateCopyWith(
    SynergiesFilterState value,
    $Res Function(SynergiesFilterState) _then,
  ) = _$SynergiesFilterStateCopyWithImpl;
  @useResult
  $Res call({
    WinLossFilter winLossFilter,
    Set<String> selectedMaps,
    (Role, Role) rolesCombo,
    ComboCriteria comboCriteria,
    int minRounds,
  });
}

/// @nodoc
class _$SynergiesFilterStateCopyWithImpl<$Res>
    implements $SynergiesFilterStateCopyWith<$Res> {
  _$SynergiesFilterStateCopyWithImpl(this._self, this._then);

  final SynergiesFilterState _self;
  final $Res Function(SynergiesFilterState) _then;

  /// Create a copy of SynergiesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winLossFilter = null,
    Object? selectedMaps = null,
    Object? rolesCombo = null,
    Object? comboCriteria = null,
    Object? minRounds = null,
  }) {
    return _then(
      _self.copyWith(
        winLossFilter: null == winLossFilter
            ? _self.winLossFilter
            : winLossFilter // ignore: cast_nullable_to_non_nullable
                  as WinLossFilter,
        selectedMaps: null == selectedMaps
            ? _self.selectedMaps
            : selectedMaps // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        rolesCombo: null == rolesCombo
            ? _self.rolesCombo
            : rolesCombo // ignore: cast_nullable_to_non_nullable
                  as (Role, Role),
        comboCriteria: null == comboCriteria
            ? _self.comboCriteria
            : comboCriteria // ignore: cast_nullable_to_non_nullable
                  as ComboCriteria,
        minRounds: null == minRounds
            ? _self.minRounds
            : minRounds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _SynergiesState extends SynergiesFilterState {
  const _SynergiesState({
    this.winLossFilter = WinLossFilter.all,
    final Set<String> selectedMaps = const {},
    this.rolesCombo = const (Role.unknown, Role.unknown),
    this.comboCriteria = ComboCriteria.composite,
    this.minRounds = 0,
  }) : _selectedMaps = selectedMaps,
       super._();

  @override
  @JsonKey()
  final WinLossFilter winLossFilter;
  final Set<String> _selectedMaps;
  @override
  @JsonKey()
  Set<String> get selectedMaps {
    if (_selectedMaps is EqualUnmodifiableSetView) return _selectedMaps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedMaps);
  }

  @override
  @JsonKey()
  final (Role, Role) rolesCombo;
  @override
  @JsonKey()
  final ComboCriteria comboCriteria;
  @override
  @JsonKey()
  final int minRounds;

  /// Create a copy of SynergiesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SynergiesStateCopyWith<_SynergiesState> get copyWith =>
      __$SynergiesStateCopyWithImpl<_SynergiesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SynergiesState &&
            (identical(other.winLossFilter, winLossFilter) ||
                other.winLossFilter == winLossFilter) &&
            const DeepCollectionEquality().equals(
              other._selectedMaps,
              _selectedMaps,
            ) &&
            (identical(other.rolesCombo, rolesCombo) ||
                other.rolesCombo == rolesCombo) &&
            (identical(other.comboCriteria, comboCriteria) ||
                other.comboCriteria == comboCriteria) &&
            (identical(other.minRounds, minRounds) ||
                other.minRounds == minRounds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    winLossFilter,
    const DeepCollectionEquality().hash(_selectedMaps),
    rolesCombo,
    comboCriteria,
    minRounds,
  );

  @override
  String toString() {
    return 'SynergiesFilterState(winLossFilter: $winLossFilter, selectedMaps: $selectedMaps, rolesCombo: $rolesCombo, comboCriteria: $comboCriteria, minRounds: $minRounds)';
  }
}

/// @nodoc
abstract mixin class _$SynergiesStateCopyWith<$Res>
    implements $SynergiesFilterStateCopyWith<$Res> {
  factory _$SynergiesStateCopyWith(
    _SynergiesState value,
    $Res Function(_SynergiesState) _then,
  ) = __$SynergiesStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    WinLossFilter winLossFilter,
    Set<String> selectedMaps,
    (Role, Role) rolesCombo,
    ComboCriteria comboCriteria,
    int minRounds,
  });
}

/// @nodoc
class __$SynergiesStateCopyWithImpl<$Res>
    implements _$SynergiesStateCopyWith<$Res> {
  __$SynergiesStateCopyWithImpl(this._self, this._then);

  final _SynergiesState _self;
  final $Res Function(_SynergiesState) _then;

  /// Create a copy of SynergiesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? winLossFilter = null,
    Object? selectedMaps = null,
    Object? rolesCombo = null,
    Object? comboCriteria = null,
    Object? minRounds = null,
  }) {
    return _then(
      _SynergiesState(
        winLossFilter: null == winLossFilter
            ? _self.winLossFilter
            : winLossFilter // ignore: cast_nullable_to_non_nullable
                  as WinLossFilter,
        selectedMaps: null == selectedMaps
            ? _self._selectedMaps
            : selectedMaps // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        rolesCombo: null == rolesCombo
            ? _self.rolesCombo
            : rolesCombo // ignore: cast_nullable_to_non_nullable
                  as (Role, Role),
        comboCriteria: null == comboCriteria
            ? _self.comboCriteria
            : comboCriteria // ignore: cast_nullable_to_non_nullable
                  as ComboCriteria,
        minRounds: null == minRounds
            ? _self.minRounds
            : minRounds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$ComboData {
  Agent get agentOne;
  Agent get agentTwo;
  ComboSynergyStat get synergyStat;

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComboDataCopyWith<ComboData> get copyWith =>
      _$ComboDataCopyWithImpl<ComboData>(this as ComboData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComboData &&
            (identical(other.agentOne, agentOne) ||
                other.agentOne == agentOne) &&
            (identical(other.agentTwo, agentTwo) ||
                other.agentTwo == agentTwo) &&
            (identical(other.synergyStat, synergyStat) ||
                other.synergyStat == synergyStat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agentOne, agentTwo, synergyStat);

  @override
  String toString() {
    return 'ComboData(agentOne: $agentOne, agentTwo: $agentTwo, synergyStat: $synergyStat)';
  }
}

/// @nodoc
abstract mixin class $ComboDataCopyWith<$Res> {
  factory $ComboDataCopyWith(ComboData value, $Res Function(ComboData) _then) =
      _$ComboDataCopyWithImpl;
  @useResult
  $Res call({Agent agentOne, Agent agentTwo, ComboSynergyStat synergyStat});
}

/// @nodoc
class _$ComboDataCopyWithImpl<$Res> implements $ComboDataCopyWith<$Res> {
  _$ComboDataCopyWithImpl(this._self, this._then);

  final ComboData _self;
  final $Res Function(ComboData) _then;

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentOne = null,
    Object? agentTwo = null,
    Object? synergyStat = null,
  }) {
    return _then(
      _self.copyWith(
        agentOne: null == agentOne
            ? _self.agentOne
            : agentOne // ignore: cast_nullable_to_non_nullable
                  as Agent,
        agentTwo: null == agentTwo
            ? _self.agentTwo
            : agentTwo // ignore: cast_nullable_to_non_nullable
                  as Agent,
        synergyStat: null == synergyStat
            ? _self.synergyStat
            : synergyStat // ignore: cast_nullable_to_non_nullable
                  as ComboSynergyStat,
      ),
    );
  }
}

/// @nodoc

class _ComboData extends ComboData {
  const _ComboData({
    required this.agentOne,
    required this.agentTwo,
    required this.synergyStat,
  }) : super._();

  @override
  final Agent agentOne;
  @override
  final Agent agentTwo;
  @override
  final ComboSynergyStat synergyStat;

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComboDataCopyWith<_ComboData> get copyWith =>
      __$ComboDataCopyWithImpl<_ComboData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComboData &&
            (identical(other.agentOne, agentOne) ||
                other.agentOne == agentOne) &&
            (identical(other.agentTwo, agentTwo) ||
                other.agentTwo == agentTwo) &&
            (identical(other.synergyStat, synergyStat) ||
                other.synergyStat == synergyStat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agentOne, agentTwo, synergyStat);

  @override
  String toString() {
    return 'ComboData(agentOne: $agentOne, agentTwo: $agentTwo, synergyStat: $synergyStat)';
  }
}

/// @nodoc
abstract mixin class _$ComboDataCopyWith<$Res>
    implements $ComboDataCopyWith<$Res> {
  factory _$ComboDataCopyWith(
    _ComboData value,
    $Res Function(_ComboData) _then,
  ) = __$ComboDataCopyWithImpl;
  @override
  @useResult
  $Res call({Agent agentOne, Agent agentTwo, ComboSynergyStat synergyStat});
}

/// @nodoc
class __$ComboDataCopyWithImpl<$Res> implements _$ComboDataCopyWith<$Res> {
  __$ComboDataCopyWithImpl(this._self, this._then);

  final _ComboData _self;
  final $Res Function(_ComboData) _then;

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? agentOne = null,
    Object? agentTwo = null,
    Object? synergyStat = null,
  }) {
    return _then(
      _ComboData(
        agentOne: null == agentOne
            ? _self.agentOne
            : agentOne // ignore: cast_nullable_to_non_nullable
                  as Agent,
        agentTwo: null == agentTwo
            ? _self.agentTwo
            : agentTwo // ignore: cast_nullable_to_non_nullable
                  as Agent,
        synergyStat: null == synergyStat
            ? _self.synergyStat
            : synergyStat // ignore: cast_nullable_to_non_nullable
                  as ComboSynergyStat,
      ),
    );
  }
}
