// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_comps_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompositionsState implements DiagnosticableTreeMixin {
  Agents get agents;
  List<AgentComp> get allCompositions;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompositionsStateCopyWith<CompositionsState> get copyWith =>
      _$CompositionsStateCopyWithImpl<CompositionsState>(
        this as CompositionsState,
        _$identity,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    final _this = this as CompositionsState;
    properties
      ..add(DiagnosticsProperty('type', 'CompositionsState'))
      ..add(DiagnosticsProperty('ternaryData', _this.ternaryData))
      ..add(DiagnosticsProperty('agents', _this.agents))
      ..add(DiagnosticsProperty('allCompositions', _this.allCompositions));
  }

  @override
  bool operator ==(Object other) {
    final _this = this as CompositionsState;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompositionsState &&
            const DeepCollectionEquality().equals(
              other.ternaryData,
              _this.ternaryData,
            ) &&
            const DeepCollectionEquality().equals(other.agents, _this.agents) &&
            const DeepCollectionEquality().equals(
              other.allCompositions,
              _this.allCompositions,
            ));
  }

  @override
  int get hashCode {
    final _this = this as CompositionsState;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.ternaryData),
      const DeepCollectionEquality().hash(_this.agents),
      const DeepCollectionEquality().hash(_this.allCompositions),
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    final _this = this as CompositionsState;
    return 'CompositionsState(ternaryData: ${_this.ternaryData}, agents: ${_this.agents}, allCompositions: ${_this.allCompositions})';
  }
}

/// @nodoc
abstract mixin class $CompositionsStateCopyWith<$Res> {
  factory $CompositionsStateCopyWith(
    CompositionsState value,
    $Res Function(CompositionsState) _then,
  ) = _$CompositionsStateCopyWithImpl;
  @useResult
  $Res call({Agents agents, List<AgentComp> allCompositions});
}

/// @nodoc
class _$CompositionsStateCopyWithImpl<$Res>
    implements $CompositionsStateCopyWith<$Res> {
  _$CompositionsStateCopyWithImpl(this._self, this._then);

  final CompositionsState _self;
  final $Res Function(CompositionsState) _then;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? agents = null, Object? allCompositions = null}) {
    return _then(
      CompositionsState(
        agents: null == agents
            ? _self.agents
            : agents // ignore: cast_nullable_to_non_nullable
                  as Agents,
        allCompositions: null == allCompositions
            ? _self.allCompositions
            : allCompositions // ignore: cast_nullable_to_non_nullable
                  as List<AgentComp>,
      ),
    );
  }
}

/// @nodoc

class _CompositionsState extends CompositionsState
    with DiagnosticableTreeMixin {
  _CompositionsState({
    required this.agents,
    required List<AgentComp> allCompositions,
  }) : _allCompositions = allCompositions,
       super._();

  @override
  final Agents agents;
  final List<AgentComp> _allCompositions;
  @override
  List<AgentComp> get allCompositions {
    if (_allCompositions is EqualUnmodifiableListView) return _allCompositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCompositions);
  }

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompositionsStateCopyWith<_CompositionsState> get copyWith =>
      __$CompositionsStateCopyWithImpl<_CompositionsState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CompositionsState'))
      ..add(DiagnosticsProperty('agents', agents))
      ..add(DiagnosticsProperty('allCompositions', allCompositions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompositionsState &&
            const DeepCollectionEquality().equals(other.agents, agents) &&
            const DeepCollectionEquality().equals(
              other.allCompositions,
              _allCompositions,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(agents),
      const DeepCollectionEquality().hash(_allCompositions),
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompositionsState(agents: $agents, allCompositions: $allCompositions)';
  }
}

/// @nodoc
abstract mixin class _$CompositionsStateCopyWith<$Res>
    implements $CompositionsStateCopyWith<$Res> {
  factory _$CompositionsStateCopyWith(
    _CompositionsState value,
    $Res Function(_CompositionsState) _then,
  ) = __$CompositionsStateCopyWithImpl;
  @override
  @useResult
  $Res call({Agents agents, List<AgentComp> allCompositions});
}

/// @nodoc
class __$CompositionsStateCopyWithImpl<$Res>
    implements _$CompositionsStateCopyWith<$Res> {
  __$CompositionsStateCopyWithImpl(this._self, this._then);

  final _CompositionsState _self;
  final $Res Function(_CompositionsState) _then;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? agents = null, Object? allCompositions = null}) {
    return _then(
      _CompositionsState(
        agents: null == agents
            ? _self.agents
            : agents // ignore: cast_nullable_to_non_nullable
                  as Agents,
        allCompositions: null == allCompositions
            ? _self._allCompositions
            : allCompositions // ignore: cast_nullable_to_non_nullable
                  as List<AgentComp>,
      ),
    );
  }
}

/// @nodoc
mixin _$RoleRange implements DiagnosticableTreeMixin {
  int get min;
  int get max;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleRangeCopyWith<RoleRange> get copyWith =>
      _$RoleRangeCopyWithImpl<RoleRange>(this as RoleRange, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    final _this = this as RoleRange;
    properties
      ..add(DiagnosticsProperty('type', 'RoleRange'))
      ..add(DiagnosticsProperty('min', _this.min))
      ..add(DiagnosticsProperty('max', _this.max));
  }

  @override
  bool operator ==(Object other) {
    final _this = this as RoleRange;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoleRange &&
            (identical(other.min, _this.min) || other.min == _this.min) &&
            (identical(other.max, _this.max) || other.max == _this.max));
  }

  @override
  int get hashCode {
    final _this = this as RoleRange;
    return Object.hash(runtimeType, _this.min, _this.max);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    final _this = this as RoleRange;
    return 'RoleRange(min: ${_this.min}, max: ${_this.max})';
  }
}

/// @nodoc
abstract mixin class $RoleRangeCopyWith<$Res> {
  factory $RoleRangeCopyWith(RoleRange value, $Res Function(RoleRange) _then) =
      _$RoleRangeCopyWithImpl;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$RoleRangeCopyWithImpl<$Res> implements $RoleRangeCopyWith<$Res> {
  _$RoleRangeCopyWithImpl(this._self, this._then);

  final RoleRange _self;
  final $Res Function(RoleRange) _then;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = null, Object? max = null}) {
    return _then(
      RoleRange(
        min: null == min
            ? _self.min
            : min // ignore: cast_nullable_to_non_nullable
                  as int,
        max: null == max
            ? _self.max
            : max // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _RoleRange extends RoleRange with DiagnosticableTreeMixin {
  const _RoleRange({required this.min, required this.max})
    : assert(min >= 0 && min <= 5, 'min value must be between 0 to 5.'),
      assert(max >= 0 && max <= 5, 'max value must be between 0 to 5.'),
      assert(min <= max, 'min value cannot be more than max.'),
      super._();

  @override
  final int min;
  @override
  final int max;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoleRangeCopyWith<_RoleRange> get copyWith =>
      __$RoleRangeCopyWithImpl<_RoleRange>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RoleRange'))
      ..add(DiagnosticsProperty('min', min))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoleRange &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, min, max);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoleRange(min: $min, max: $max)';
  }
}

/// @nodoc
abstract mixin class _$RoleRangeCopyWith<$Res>
    implements $RoleRangeCopyWith<$Res> {
  factory _$RoleRangeCopyWith(
    _RoleRange value,
    $Res Function(_RoleRange) _then,
  ) = __$RoleRangeCopyWithImpl;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$RoleRangeCopyWithImpl<$Res> implements _$RoleRangeCopyWith<$Res> {
  __$RoleRangeCopyWithImpl(this._self, this._then);

  final _RoleRange _self;
  final $Res Function(_RoleRange) _then;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? min = null, Object? max = null}) {
    return _then(
      _RoleRange(
        min: null == min
            ? _self.min
            : min // ignore: cast_nullable_to_non_nullable
                  as int,
        max: null == max
            ? _self.max
            : max // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
