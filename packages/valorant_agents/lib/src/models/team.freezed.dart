// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Team {
  String get name;
  int get score;
  int get attackScore;
  AgentComp get agents;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeamCopyWith<Team> get copyWith =>
      _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Team &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attackScore, attackScore) ||
                other.attackScore == attackScore) &&
            (identical(other.agents, agents) || other.agents == agents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, score, attackScore, agents);

  @override
  String toString() {
    return 'Team(name: $name, score: $score, attackScore: $attackScore, agents: $agents)';
  }
}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) =
      _$TeamCopyWithImpl;
  @useResult
  $Res call({String name, int score, int attackScore, AgentComp agents});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._self, this._then);

  final Team _self;
  final $Res Function(Team) _then;

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
      _self.copyWith(
        name:
            null == name
                ? _self.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        score:
            null == score
                ? _self.score
                : score // ignore: cast_nullable_to_non_nullable
                    as int,
        attackScore:
            null == attackScore
                ? _self.attackScore
                : attackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        agents:
            null == agents
                ? _self.agents
                : agents // ignore: cast_nullable_to_non_nullable
                    as AgentComp,
      ),
    );
  }
}

/// @nodoc

class _Team extends Team {
  const _Team({
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

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attackScore, attackScore) ||
                other.attackScore == attackScore) &&
            (identical(other.agents, agents) || other.agents == agents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, score, attackScore, agents);

  @override
  String toString() {
    return 'Team(name: $name, score: $score, attackScore: $attackScore, agents: $agents)';
  }
}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) =
      __$TeamCopyWithImpl;
  @override
  @useResult
  $Res call({String name, int score, int attackScore, AgentComp agents});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(this._self, this._then);

  final _Team _self;
  final $Res Function(_Team) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? attackScore = null,
    Object? agents = null,
  }) {
    return _then(
      _Team(
        name:
            null == name
                ? _self.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        score:
            null == score
                ? _self.score
                : score // ignore: cast_nullable_to_non_nullable
                    as int,
        attackScore:
            null == attackScore
                ? _self.attackScore
                : attackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        agents:
            null == agents
                ? _self.agents
                : agents // ignore: cast_nullable_to_non_nullable
                    as AgentComp,
      ),
    );
  }
}
