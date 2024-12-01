// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_comps_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompositionsState {
  Agents get agents => throw _privateConstructorUsedError;
  List<AgentComp> get allCompositions => throw _privateConstructorUsedError;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompositionsStateCopyWith<CompositionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositionsStateCopyWith<$Res> {
  factory $CompositionsStateCopyWith(
          CompositionsState value, $Res Function(CompositionsState) then) =
      _$CompositionsStateCopyWithImpl<$Res, CompositionsState>;
  @useResult
  $Res call({Agents agents, List<AgentComp> allCompositions});
}

/// @nodoc
class _$CompositionsStateCopyWithImpl<$Res, $Val extends CompositionsState>
    implements $CompositionsStateCopyWith<$Res> {
  _$CompositionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agents = null,
    Object? allCompositions = null,
  }) {
    return _then(_value.copyWith(
      agents: null == agents
          ? _value.agents
          : agents // ignore: cast_nullable_to_non_nullable
              as Agents,
      allCompositions: null == allCompositions
          ? _value.allCompositions
          : allCompositions // ignore: cast_nullable_to_non_nullable
              as List<AgentComp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompositionsStateImplCopyWith<$Res>
    implements $CompositionsStateCopyWith<$Res> {
  factory _$$CompositionsStateImplCopyWith(_$CompositionsStateImpl value,
          $Res Function(_$CompositionsStateImpl) then) =
      __$$CompositionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Agents agents, List<AgentComp> allCompositions});
}

/// @nodoc
class __$$CompositionsStateImplCopyWithImpl<$Res>
    extends _$CompositionsStateCopyWithImpl<$Res, _$CompositionsStateImpl>
    implements _$$CompositionsStateImplCopyWith<$Res> {
  __$$CompositionsStateImplCopyWithImpl(_$CompositionsStateImpl _value,
      $Res Function(_$CompositionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agents = null,
    Object? allCompositions = null,
  }) {
    return _then(_$CompositionsStateImpl(
      agents: null == agents
          ? _value.agents
          : agents // ignore: cast_nullable_to_non_nullable
              as Agents,
      allCompositions: null == allCompositions
          ? _value._allCompositions
          : allCompositions // ignore: cast_nullable_to_non_nullable
              as List<AgentComp>,
    ));
  }
}

/// @nodoc

class _$CompositionsStateImpl extends _CompositionsState
    with DiagnosticableTreeMixin {
  _$CompositionsStateImpl(
      {required this.agents, required final List<AgentComp> allCompositions})
      : _allCompositions = allCompositions,
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompositionsState(agents: $agents, allCompositions: $allCompositions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CompositionsState'))
      ..add(DiagnosticsProperty('agents', agents))
      ..add(DiagnosticsProperty('allCompositions', allCompositions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompositionsStateImpl &&
            const DeepCollectionEquality().equals(other.agents, agents) &&
            const DeepCollectionEquality()
                .equals(other._allCompositions, _allCompositions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(agents),
      const DeepCollectionEquality().hash(_allCompositions));

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompositionsStateImplCopyWith<_$CompositionsStateImpl> get copyWith =>
      __$$CompositionsStateImplCopyWithImpl<_$CompositionsStateImpl>(
          this, _$identity);
}

abstract class _CompositionsState extends CompositionsState {
  factory _CompositionsState(
          {required final Agents agents,
          required final List<AgentComp> allCompositions}) =
      _$CompositionsStateImpl;
  _CompositionsState._() : super._();

  @override
  Agents get agents;
  @override
  List<AgentComp> get allCompositions;

  /// Create a copy of CompositionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompositionsStateImplCopyWith<_$CompositionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoleRange {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleRangeCopyWith<RoleRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleRangeCopyWith<$Res> {
  factory $RoleRangeCopyWith(RoleRange value, $Res Function(RoleRange) then) =
      _$RoleRangeCopyWithImpl<$Res, RoleRange>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$RoleRangeCopyWithImpl<$Res, $Val extends RoleRange>
    implements $RoleRangeCopyWith<$Res> {
  _$RoleRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleRangeImplCopyWith<$Res>
    implements $RoleRangeCopyWith<$Res> {
  factory _$$RoleRangeImplCopyWith(
          _$RoleRangeImpl value, $Res Function(_$RoleRangeImpl) then) =
      __$$RoleRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$RoleRangeImplCopyWithImpl<$Res>
    extends _$RoleRangeCopyWithImpl<$Res, _$RoleRangeImpl>
    implements _$$RoleRangeImplCopyWith<$Res> {
  __$$RoleRangeImplCopyWithImpl(
      _$RoleRangeImpl _value, $Res Function(_$RoleRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$RoleRangeImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RoleRangeImpl extends _RoleRange with DiagnosticableTreeMixin {
  const _$RoleRangeImpl({required this.min, required this.max})
      : assert(min >= 0 && min <= 5, 'min value must be between 0 to 5.'),
        assert(max >= 0 && max <= 5, 'max value must be between 0 to 5.'),
        assert(min <= max, 'min value cannot be more than max.'),
        super._();

  @override
  final int min;
  @override
  final int max;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoleRange(min: $min, max: $max)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoleRange'))
      ..add(DiagnosticsProperty('min', min))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleRangeImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleRangeImplCopyWith<_$RoleRangeImpl> get copyWith =>
      __$$RoleRangeImplCopyWithImpl<_$RoleRangeImpl>(this, _$identity);
}

abstract class _RoleRange extends RoleRange {
  const factory _RoleRange({required final int min, required final int max}) =
      _$RoleRangeImpl;
  const _RoleRange._() : super._();

  @override
  int get min;
  @override
  int get max;

  /// Create a copy of RoleRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleRangeImplCopyWith<_$RoleRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
