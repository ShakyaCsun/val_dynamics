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
mixin _$SynergiesState {
  ValorantMatches get matches;
  Agents get agentRoster;
  WinLossFilter get winLossFilter;
  Set<String> get selectedMaps;
  (Role, Role) get rolesCombo;
  ComboCriteria get comboCriteria;

  /// Create a copy of SynergiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SynergiesStateCopyWith<SynergiesState> get copyWith =>
      _$SynergiesStateCopyWithImpl<SynergiesState>(
        this as SynergiesState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SynergiesState &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            const DeepCollectionEquality().equals(
              other.agentRoster,
              agentRoster,
            ) &&
            (identical(other.winLossFilter, winLossFilter) ||
                other.winLossFilter == winLossFilter) &&
            const DeepCollectionEquality().equals(
              other.selectedMaps,
              selectedMaps,
            ) &&
            (identical(other.rolesCombo, rolesCombo) ||
                other.rolesCombo == rolesCombo) &&
            (identical(other.comboCriteria, comboCriteria) ||
                other.comboCriteria == comboCriteria));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    const DeepCollectionEquality().hash(agentRoster),
    winLossFilter,
    const DeepCollectionEquality().hash(selectedMaps),
    rolesCombo,
    comboCriteria,
  );

  @override
  String toString() {
    return 'SynergiesState(matches: $matches, agentRoster: $agentRoster, winLossFilter: $winLossFilter, selectedMaps: $selectedMaps, rolesCombo: $rolesCombo, comboCriteria: $comboCriteria)';
  }
}

/// @nodoc
abstract mixin class $SynergiesStateCopyWith<$Res> {
  factory $SynergiesStateCopyWith(
    SynergiesState value,
    $Res Function(SynergiesState) _then,
  ) = _$SynergiesStateCopyWithImpl;
  @useResult
  $Res call({
    ValorantMatches matches,
    Agents agentRoster,
    WinLossFilter winLossFilter,
    Set<String> selectedMaps,
    (Role, Role) rolesCombo,
    ComboCriteria comboCriteria,
  });
}

/// @nodoc
class _$SynergiesStateCopyWithImpl<$Res>
    implements $SynergiesStateCopyWith<$Res> {
  _$SynergiesStateCopyWithImpl(this._self, this._then);

  final SynergiesState _self;
  final $Res Function(SynergiesState) _then;

  /// Create a copy of SynergiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? agentRoster = null,
    Object? winLossFilter = null,
    Object? selectedMaps = null,
    Object? rolesCombo = null,
    Object? comboCriteria = null,
  }) {
    return _then(
      _self.copyWith(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        agentRoster:
            null == agentRoster
                ? _self.agentRoster
                : agentRoster // ignore: cast_nullable_to_non_nullable
                    as Agents,
        winLossFilter:
            null == winLossFilter
                ? _self.winLossFilter
                : winLossFilter // ignore: cast_nullable_to_non_nullable
                    as WinLossFilter,
        selectedMaps:
            null == selectedMaps
                ? _self.selectedMaps
                : selectedMaps // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        rolesCombo:
            null == rolesCombo
                ? _self.rolesCombo
                : rolesCombo // ignore: cast_nullable_to_non_nullable
                    as (Role, Role),
        comboCriteria:
            null == comboCriteria
                ? _self.comboCriteria
                : comboCriteria // ignore: cast_nullable_to_non_nullable
                    as ComboCriteria,
      ),
    );
  }
}

/// @nodoc

class _SynergiesState extends SynergiesState {
  const _SynergiesState({
    required this.matches,
    required this.agentRoster,
    this.winLossFilter = WinLossFilter.all,
    final Set<String> selectedMaps = const {},
    this.rolesCombo = const (Role.unknown, Role.unknown),
    this.comboCriteria = ComboCriteria.composite,
  }) : _selectedMaps = selectedMaps,
       super._();

  @override
  final ValorantMatches matches;
  @override
  final Agents agentRoster;
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

  /// Create a copy of SynergiesState
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
            const DeepCollectionEquality().equals(other.matches, matches) &&
            const DeepCollectionEquality().equals(
              other.agentRoster,
              agentRoster,
            ) &&
            (identical(other.winLossFilter, winLossFilter) ||
                other.winLossFilter == winLossFilter) &&
            const DeepCollectionEquality().equals(
              other._selectedMaps,
              _selectedMaps,
            ) &&
            (identical(other.rolesCombo, rolesCombo) ||
                other.rolesCombo == rolesCombo) &&
            (identical(other.comboCriteria, comboCriteria) ||
                other.comboCriteria == comboCriteria));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    const DeepCollectionEquality().hash(agentRoster),
    winLossFilter,
    const DeepCollectionEquality().hash(_selectedMaps),
    rolesCombo,
    comboCriteria,
  );

  @override
  String toString() {
    return 'SynergiesState(matches: $matches, agentRoster: $agentRoster, winLossFilter: $winLossFilter, selectedMaps: $selectedMaps, rolesCombo: $rolesCombo, comboCriteria: $comboCriteria)';
  }
}

/// @nodoc
abstract mixin class _$SynergiesStateCopyWith<$Res>
    implements $SynergiesStateCopyWith<$Res> {
  factory _$SynergiesStateCopyWith(
    _SynergiesState value,
    $Res Function(_SynergiesState) _then,
  ) = __$SynergiesStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    ValorantMatches matches,
    Agents agentRoster,
    WinLossFilter winLossFilter,
    Set<String> selectedMaps,
    (Role, Role) rolesCombo,
    ComboCriteria comboCriteria,
  });
}

/// @nodoc
class __$SynergiesStateCopyWithImpl<$Res>
    implements _$SynergiesStateCopyWith<$Res> {
  __$SynergiesStateCopyWithImpl(this._self, this._then);

  final _SynergiesState _self;
  final $Res Function(_SynergiesState) _then;

  /// Create a copy of SynergiesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? matches = null,
    Object? agentRoster = null,
    Object? winLossFilter = null,
    Object? selectedMaps = null,
    Object? rolesCombo = null,
    Object? comboCriteria = null,
  }) {
    return _then(
      _SynergiesState(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        agentRoster:
            null == agentRoster
                ? _self.agentRoster
                : agentRoster // ignore: cast_nullable_to_non_nullable
                    as Agents,
        winLossFilter:
            null == winLossFilter
                ? _self.winLossFilter
                : winLossFilter // ignore: cast_nullable_to_non_nullable
                    as WinLossFilter,
        selectedMaps:
            null == selectedMaps
                ? _self._selectedMaps
                : selectedMaps // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        rolesCombo:
            null == rolesCombo
                ? _self.rolesCombo
                : rolesCombo // ignore: cast_nullable_to_non_nullable
                    as (Role, Role),
        comboCriteria:
            null == comboCriteria
                ? _self.comboCriteria
                : comboCriteria // ignore: cast_nullable_to_non_nullable
                    as ComboCriteria,
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

  $AgentCopyWith<$Res> get agentOne;
  $AgentCopyWith<$Res> get agentTwo;
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
        agentOne:
            null == agentOne
                ? _self.agentOne
                : agentOne // ignore: cast_nullable_to_non_nullable
                    as Agent,
        agentTwo:
            null == agentTwo
                ? _self.agentTwo
                : agentTwo // ignore: cast_nullable_to_non_nullable
                    as Agent,
        synergyStat:
            null == synergyStat
                ? _self.synergyStat
                : synergyStat // ignore: cast_nullable_to_non_nullable
                    as ComboSynergyStat,
      ),
    );
  }

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentCopyWith<$Res> get agentOne {
    return $AgentCopyWith<$Res>(_self.agentOne, (value) {
      return _then(_self.copyWith(agentOne: value));
    });
  }

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentCopyWith<$Res> get agentTwo {
    return $AgentCopyWith<$Res>(_self.agentTwo, (value) {
      return _then(_self.copyWith(agentTwo: value));
    });
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

  @override
  $AgentCopyWith<$Res> get agentOne;
  @override
  $AgentCopyWith<$Res> get agentTwo;
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
        agentOne:
            null == agentOne
                ? _self.agentOne
                : agentOne // ignore: cast_nullable_to_non_nullable
                    as Agent,
        agentTwo:
            null == agentTwo
                ? _self.agentTwo
                : agentTwo // ignore: cast_nullable_to_non_nullable
                    as Agent,
        synergyStat:
            null == synergyStat
                ? _self.synergyStat
                : synergyStat // ignore: cast_nullable_to_non_nullable
                    as ComboSynergyStat,
      ),
    );
  }

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentCopyWith<$Res> get agentOne {
    return $AgentCopyWith<$Res>(_self.agentOne, (value) {
      return _then(_self.copyWith(agentOne: value));
    });
  }

  /// Create a copy of ComboData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentCopyWith<$Res> get agentTwo {
    return $AgentCopyWith<$Res>(_self.agentTwo, (value) {
      return _then(_self.copyWith(agentTwo: value));
    });
  }
}
