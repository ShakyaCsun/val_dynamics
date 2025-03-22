// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_ternary_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesTernaryData {
  StylePoints get stylePoints;
  int get matchesCount;
  Score get score;
  Score get attackScore;
  Score get defenseScore;
  Set<AgentComp> get compositions;
  Set<AgentComp> get oppositionCompositions;

  /// Create a copy of MatchesTernaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesTernaryDataCopyWith<MatchesTernaryData> get copyWith =>
      _$MatchesTernaryDataCopyWithImpl<MatchesTernaryData>(
        this as MatchesTernaryData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesTernaryData &&
            (identical(other.stylePoints, stylePoints) ||
                other.stylePoints == stylePoints) &&
            (identical(other.matchesCount, matchesCount) ||
                other.matchesCount == matchesCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attackScore, attackScore) ||
                other.attackScore == attackScore) &&
            (identical(other.defenseScore, defenseScore) ||
                other.defenseScore == defenseScore) &&
            const DeepCollectionEquality().equals(
              other.compositions,
              compositions,
            ) &&
            const DeepCollectionEquality().equals(
              other.oppositionCompositions,
              oppositionCompositions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stylePoints,
    matchesCount,
    score,
    attackScore,
    defenseScore,
    const DeepCollectionEquality().hash(compositions),
    const DeepCollectionEquality().hash(oppositionCompositions),
  );

  @override
  String toString() {
    return 'MatchesTernaryData(stylePoints: $stylePoints, matchesCount: $matchesCount, score: $score, attackScore: $attackScore, defenseScore: $defenseScore, compositions: $compositions, oppositionCompositions: $oppositionCompositions)';
  }
}

/// @nodoc
abstract mixin class $MatchesTernaryDataCopyWith<$Res> {
  factory $MatchesTernaryDataCopyWith(
    MatchesTernaryData value,
    $Res Function(MatchesTernaryData) _then,
  ) = _$MatchesTernaryDataCopyWithImpl;
  @useResult
  $Res call({
    ({double aggro, double control, double midrange}) stylePoints,
    int matchesCount,
    Score score,
    Score attackScore,
    Score defenseScore,
    Set<AgentComp> compositions,
    Set<AgentComp> oppositionCompositions,
  });
}

/// @nodoc
class _$MatchesTernaryDataCopyWithImpl<$Res>
    implements $MatchesTernaryDataCopyWith<$Res> {
  _$MatchesTernaryDataCopyWithImpl(this._self, this._then);

  final MatchesTernaryData _self;
  final $Res Function(MatchesTernaryData) _then;

  /// Create a copy of MatchesTernaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stylePoints = null,
    Object? matchesCount = null,
    Object? score = null,
    Object? attackScore = null,
    Object? defenseScore = null,
    Object? compositions = null,
    Object? oppositionCompositions = null,
  }) {
    return _then(
      _self.copyWith(
        stylePoints:
            null == stylePoints
                ? _self.stylePoints!
                : stylePoints // ignore: cast_nullable_to_non_nullable
                    as ({double aggro, double control, double midrange}),
        matchesCount:
            null == matchesCount
                ? _self.matchesCount
                : matchesCount // ignore: cast_nullable_to_non_nullable
                    as int,
        score:
            null == score
                ? _self.score
                : score // ignore: cast_nullable_to_non_nullable
                    as Score,
        attackScore:
            null == attackScore
                ? _self.attackScore
                : attackScore // ignore: cast_nullable_to_non_nullable
                    as Score,
        defenseScore:
            null == defenseScore
                ? _self.defenseScore
                : defenseScore // ignore: cast_nullable_to_non_nullable
                    as Score,
        compositions:
            null == compositions
                ? _self.compositions
                : compositions // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
        oppositionCompositions:
            null == oppositionCompositions
                ? _self.oppositionCompositions
                : oppositionCompositions // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
      ),
    );
  }
}

/// @nodoc

class _MatchesTernaryData extends MatchesTernaryData {
  const _MatchesTernaryData({
    required this.stylePoints,
    required this.matchesCount,
    required this.score,
    required this.attackScore,
    required this.defenseScore,
    required final Set<AgentComp> compositions,
    required final Set<AgentComp> oppositionCompositions,
  }) : _compositions = compositions,
       _oppositionCompositions = oppositionCompositions,
       super._();

  @override
  final ({double aggro, double control, double midrange}) stylePoints;
  @override
  final int matchesCount;
  @override
  final Score score;
  @override
  final Score attackScore;
  @override
  final Score defenseScore;
  final Set<AgentComp> _compositions;
  @override
  Set<AgentComp> get compositions {
    if (_compositions is EqualUnmodifiableSetView) return _compositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_compositions);
  }

  final Set<AgentComp> _oppositionCompositions;
  @override
  Set<AgentComp> get oppositionCompositions {
    if (_oppositionCompositions is EqualUnmodifiableSetView)
      return _oppositionCompositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_oppositionCompositions);
  }

  /// Create a copy of MatchesTernaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchesTernaryDataCopyWith<_MatchesTernaryData> get copyWith =>
      __$MatchesTernaryDataCopyWithImpl<_MatchesTernaryData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchesTernaryData &&
            (identical(other.stylePoints, stylePoints) ||
                other.stylePoints == stylePoints) &&
            (identical(other.matchesCount, matchesCount) ||
                other.matchesCount == matchesCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attackScore, attackScore) ||
                other.attackScore == attackScore) &&
            (identical(other.defenseScore, defenseScore) ||
                other.defenseScore == defenseScore) &&
            const DeepCollectionEquality().equals(
              other._compositions,
              _compositions,
            ) &&
            const DeepCollectionEquality().equals(
              other._oppositionCompositions,
              _oppositionCompositions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stylePoints,
    matchesCount,
    score,
    attackScore,
    defenseScore,
    const DeepCollectionEquality().hash(_compositions),
    const DeepCollectionEquality().hash(_oppositionCompositions),
  );

  @override
  String toString() {
    return 'MatchesTernaryData(stylePoints: $stylePoints, matchesCount: $matchesCount, score: $score, attackScore: $attackScore, defenseScore: $defenseScore, compositions: $compositions, oppositionCompositions: $oppositionCompositions)';
  }
}

/// @nodoc
abstract mixin class _$MatchesTernaryDataCopyWith<$Res>
    implements $MatchesTernaryDataCopyWith<$Res> {
  factory _$MatchesTernaryDataCopyWith(
    _MatchesTernaryData value,
    $Res Function(_MatchesTernaryData) _then,
  ) = __$MatchesTernaryDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    ({double aggro, double control, double midrange}) stylePoints,
    int matchesCount,
    Score score,
    Score attackScore,
    Score defenseScore,
    Set<AgentComp> compositions,
    Set<AgentComp> oppositionCompositions,
  });
}

/// @nodoc
class __$MatchesTernaryDataCopyWithImpl<$Res>
    implements _$MatchesTernaryDataCopyWith<$Res> {
  __$MatchesTernaryDataCopyWithImpl(this._self, this._then);

  final _MatchesTernaryData _self;
  final $Res Function(_MatchesTernaryData) _then;

  /// Create a copy of MatchesTernaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stylePoints = null,
    Object? matchesCount = null,
    Object? score = null,
    Object? attackScore = null,
    Object? defenseScore = null,
    Object? compositions = null,
    Object? oppositionCompositions = null,
  }) {
    return _then(
      _MatchesTernaryData(
        stylePoints:
            null == stylePoints
                ? _self.stylePoints
                : stylePoints // ignore: cast_nullable_to_non_nullable
                    as ({double aggro, double control, double midrange}),
        matchesCount:
            null == matchesCount
                ? _self.matchesCount
                : matchesCount // ignore: cast_nullable_to_non_nullable
                    as int,
        score:
            null == score
                ? _self.score
                : score // ignore: cast_nullable_to_non_nullable
                    as Score,
        attackScore:
            null == attackScore
                ? _self.attackScore
                : attackScore // ignore: cast_nullable_to_non_nullable
                    as Score,
        defenseScore:
            null == defenseScore
                ? _self.defenseScore
                : defenseScore // ignore: cast_nullable_to_non_nullable
                    as Score,
        compositions:
            null == compositions
                ? _self._compositions
                : compositions // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
        oppositionCompositions:
            null == oppositionCompositions
                ? _self._oppositionCompositions
                : oppositionCompositions // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
      ),
    );
  }
}
