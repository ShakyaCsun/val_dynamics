// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RawMatch {
  String get mapName;
  String get teamOneName;
  String get teamTwoName;
  int get teamOneScore;
  int get teamTwoScore;
  int get teamOneAttackScore;
  int get teamTwoAttackScore;
  String get teamOneAgents;
  String get teamTwoAgents;

  /// Create a copy of RawMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RawMatchCopyWith<RawMatch> get copyWith =>
      _$RawMatchCopyWithImpl<RawMatch>(this as RawMatch, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RawMatch &&
            (identical(other.mapName, mapName) || other.mapName == mapName) &&
            (identical(other.teamOneName, teamOneName) ||
                other.teamOneName == teamOneName) &&
            (identical(other.teamTwoName, teamTwoName) ||
                other.teamTwoName == teamTwoName) &&
            (identical(other.teamOneScore, teamOneScore) ||
                other.teamOneScore == teamOneScore) &&
            (identical(other.teamTwoScore, teamTwoScore) ||
                other.teamTwoScore == teamTwoScore) &&
            (identical(other.teamOneAttackScore, teamOneAttackScore) ||
                other.teamOneAttackScore == teamOneAttackScore) &&
            (identical(other.teamTwoAttackScore, teamTwoAttackScore) ||
                other.teamTwoAttackScore == teamTwoAttackScore) &&
            (identical(other.teamOneAgents, teamOneAgents) ||
                other.teamOneAgents == teamOneAgents) &&
            (identical(other.teamTwoAgents, teamTwoAgents) ||
                other.teamTwoAgents == teamTwoAgents));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    mapName,
    teamOneName,
    teamTwoName,
    teamOneScore,
    teamTwoScore,
    teamOneAttackScore,
    teamTwoAttackScore,
    teamOneAgents,
    teamTwoAgents,
  );

  @override
  String toString() {
    return 'RawMatch(mapName: $mapName, teamOneName: $teamOneName, teamTwoName: $teamTwoName, teamOneScore: $teamOneScore, teamTwoScore: $teamTwoScore, teamOneAttackScore: $teamOneAttackScore, teamTwoAttackScore: $teamTwoAttackScore, teamOneAgents: $teamOneAgents, teamTwoAgents: $teamTwoAgents)';
  }
}

/// @nodoc
abstract mixin class $RawMatchCopyWith<$Res> {
  factory $RawMatchCopyWith(RawMatch value, $Res Function(RawMatch) _then) =
      _$RawMatchCopyWithImpl;
  @useResult
  $Res call({
    String mapName,
    String teamOneName,
    String teamTwoName,
    int teamOneScore,
    int teamTwoScore,
    int teamOneAttackScore,
    int teamTwoAttackScore,
    String teamOneAgents,
    String teamTwoAgents,
  });
}

/// @nodoc
class _$RawMatchCopyWithImpl<$Res> implements $RawMatchCopyWith<$Res> {
  _$RawMatchCopyWithImpl(this._self, this._then);

  final RawMatch _self;
  final $Res Function(RawMatch) _then;

  /// Create a copy of RawMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapName = null,
    Object? teamOneName = null,
    Object? teamTwoName = null,
    Object? teamOneScore = null,
    Object? teamTwoScore = null,
    Object? teamOneAttackScore = null,
    Object? teamTwoAttackScore = null,
    Object? teamOneAgents = null,
    Object? teamTwoAgents = null,
  }) {
    return _then(
      _self.copyWith(
        mapName:
            null == mapName
                ? _self.mapName
                : mapName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOneName:
            null == teamOneName
                ? _self.teamOneName
                : teamOneName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamTwoName:
            null == teamTwoName
                ? _self.teamTwoName
                : teamTwoName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOneScore:
            null == teamOneScore
                ? _self.teamOneScore
                : teamOneScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamTwoScore:
            null == teamTwoScore
                ? _self.teamTwoScore
                : teamTwoScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamOneAttackScore:
            null == teamOneAttackScore
                ? _self.teamOneAttackScore
                : teamOneAttackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamTwoAttackScore:
            null == teamTwoAttackScore
                ? _self.teamTwoAttackScore
                : teamTwoAttackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamOneAgents:
            null == teamOneAgents
                ? _self.teamOneAgents
                : teamOneAgents // ignore: cast_nullable_to_non_nullable
                    as String,
        teamTwoAgents:
            null == teamTwoAgents
                ? _self.teamTwoAgents
                : teamTwoAgents // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _RawMatch extends RawMatch {
  const _RawMatch({
    required this.mapName,
    required this.teamOneName,
    required this.teamTwoName,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.teamOneAttackScore,
    required this.teamTwoAttackScore,
    required this.teamOneAgents,
    required this.teamTwoAgents,
  }) : super._();

  @override
  final String mapName;
  @override
  final String teamOneName;
  @override
  final String teamTwoName;
  @override
  final int teamOneScore;
  @override
  final int teamTwoScore;
  @override
  final int teamOneAttackScore;
  @override
  final int teamTwoAttackScore;
  @override
  final String teamOneAgents;
  @override
  final String teamTwoAgents;

  /// Create a copy of RawMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RawMatchCopyWith<_RawMatch> get copyWith =>
      __$RawMatchCopyWithImpl<_RawMatch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RawMatch &&
            (identical(other.mapName, mapName) || other.mapName == mapName) &&
            (identical(other.teamOneName, teamOneName) ||
                other.teamOneName == teamOneName) &&
            (identical(other.teamTwoName, teamTwoName) ||
                other.teamTwoName == teamTwoName) &&
            (identical(other.teamOneScore, teamOneScore) ||
                other.teamOneScore == teamOneScore) &&
            (identical(other.teamTwoScore, teamTwoScore) ||
                other.teamTwoScore == teamTwoScore) &&
            (identical(other.teamOneAttackScore, teamOneAttackScore) ||
                other.teamOneAttackScore == teamOneAttackScore) &&
            (identical(other.teamTwoAttackScore, teamTwoAttackScore) ||
                other.teamTwoAttackScore == teamTwoAttackScore) &&
            (identical(other.teamOneAgents, teamOneAgents) ||
                other.teamOneAgents == teamOneAgents) &&
            (identical(other.teamTwoAgents, teamTwoAgents) ||
                other.teamTwoAgents == teamTwoAgents));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    mapName,
    teamOneName,
    teamTwoName,
    teamOneScore,
    teamTwoScore,
    teamOneAttackScore,
    teamTwoAttackScore,
    teamOneAgents,
    teamTwoAgents,
  );

  @override
  String toString() {
    return 'RawMatch(mapName: $mapName, teamOneName: $teamOneName, teamTwoName: $teamTwoName, teamOneScore: $teamOneScore, teamTwoScore: $teamTwoScore, teamOneAttackScore: $teamOneAttackScore, teamTwoAttackScore: $teamTwoAttackScore, teamOneAgents: $teamOneAgents, teamTwoAgents: $teamTwoAgents)';
  }
}

/// @nodoc
abstract mixin class _$RawMatchCopyWith<$Res>
    implements $RawMatchCopyWith<$Res> {
  factory _$RawMatchCopyWith(_RawMatch value, $Res Function(_RawMatch) _then) =
      __$RawMatchCopyWithImpl;
  @override
  @useResult
  $Res call({
    String mapName,
    String teamOneName,
    String teamTwoName,
    int teamOneScore,
    int teamTwoScore,
    int teamOneAttackScore,
    int teamTwoAttackScore,
    String teamOneAgents,
    String teamTwoAgents,
  });
}

/// @nodoc
class __$RawMatchCopyWithImpl<$Res> implements _$RawMatchCopyWith<$Res> {
  __$RawMatchCopyWithImpl(this._self, this._then);

  final _RawMatch _self;
  final $Res Function(_RawMatch) _then;

  /// Create a copy of RawMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mapName = null,
    Object? teamOneName = null,
    Object? teamTwoName = null,
    Object? teamOneScore = null,
    Object? teamTwoScore = null,
    Object? teamOneAttackScore = null,
    Object? teamTwoAttackScore = null,
    Object? teamOneAgents = null,
    Object? teamTwoAgents = null,
  }) {
    return _then(
      _RawMatch(
        mapName:
            null == mapName
                ? _self.mapName
                : mapName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOneName:
            null == teamOneName
                ? _self.teamOneName
                : teamOneName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamTwoName:
            null == teamTwoName
                ? _self.teamTwoName
                : teamTwoName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOneScore:
            null == teamOneScore
                ? _self.teamOneScore
                : teamOneScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamTwoScore:
            null == teamTwoScore
                ? _self.teamTwoScore
                : teamTwoScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamOneAttackScore:
            null == teamOneAttackScore
                ? _self.teamOneAttackScore
                : teamOneAttackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamTwoAttackScore:
            null == teamTwoAttackScore
                ? _self.teamTwoAttackScore
                : teamTwoAttackScore // ignore: cast_nullable_to_non_nullable
                    as int,
        teamOneAgents:
            null == teamOneAgents
                ? _self.teamOneAgents
                : teamOneAgents // ignore: cast_nullable_to_non_nullable
                    as String,
        teamTwoAgents:
            null == teamTwoAgents
                ? _self.teamTwoAgents
                : teamTwoAgents // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}
