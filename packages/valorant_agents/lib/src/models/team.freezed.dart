// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Team {
  String get name => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get attackScore => throw _privateConstructorUsedError;
  AgentComp get agents => throw _privateConstructorUsedError;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call({String name, int score, int attackScore, AgentComp agents});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? attackScore = null,
    Object? agents = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as int,
            attackScore:
                null == attackScore
                    ? _value.attackScore
                    : attackScore // ignore: cast_nullable_to_non_nullable
                        as int,
            agents:
                null == agents
                    ? _value.agents
                    : agents // ignore: cast_nullable_to_non_nullable
                        as AgentComp,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TeamImplCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$TeamImplCopyWith(
    _$TeamImpl value,
    $Res Function(_$TeamImpl) then,
  ) = __$$TeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int score, int attackScore, AgentComp agents});
}

/// @nodoc
class __$$TeamImplCopyWithImpl<$Res>
    extends _$TeamCopyWithImpl<$Res, _$TeamImpl>
    implements _$$TeamImplCopyWith<$Res> {
  __$$TeamImplCopyWithImpl(_$TeamImpl _value, $Res Function(_$TeamImpl) _then)
    : super(_value, _then);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? attackScore = null,
    Object? agents = null,
  }) {
    return _then(
      _$TeamImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as int,
        attackScore:
            null == attackScore
                ? _value.attackScore
                : attackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        agents:
            null == agents
                ? _value.agents
                : agents // ignore: cast_nullable_to_non_nullable
                    as AgentComp,
      ),
    );
  }
}

/// @nodoc

class _$TeamImpl extends _Team {
  const _$TeamImpl({
    required this.name,
    required this.score,
    required this.attackScore,
    required this.agents,
  }) : super._();

  @override
  final String name;
  @override
  final int score;
  @override
  final int attackScore;
  @override
  final AgentComp agents;

  @override
  String toString() {
    return 'Team(name: $name, score: $score, attackScore: $attackScore, agents: $agents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attackScore, attackScore) ||
                other.attackScore == attackScore) &&
            (identical(other.agents, agents) || other.agents == agents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, score, attackScore, agents);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      __$$TeamImplCopyWithImpl<_$TeamImpl>(this, _$identity);
}

abstract class _Team extends Team {
  const factory _Team({
    required final String name,
    required final int score,
    required final int attackScore,
    required final AgentComp agents,
  }) = _$TeamImpl;
  const _Team._() : super._();

  @override
  String get name;
  @override
  int get score;
  @override
  int get attackScore;
  @override
  AgentComp get agents;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
