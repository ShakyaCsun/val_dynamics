// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_stats_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesSummary {
  int get matchesCount;
  Score get scoreOne;
  Score get attackScoreOne;
  Score get mapScore;
  Set<AgentComp> get compsOne;
  Set<AgentComp> get compsTwo;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesSummaryCopyWith<MatchesSummary> get copyWith =>
      _$MatchesSummaryCopyWithImpl<MatchesSummary>(
        this as MatchesSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesSummary &&
            (identical(other.matchesCount, matchesCount) ||
                other.matchesCount == matchesCount) &&
            (identical(other.scoreOne, scoreOne) ||
                other.scoreOne == scoreOne) &&
            (identical(other.attackScoreOne, attackScoreOne) ||
                other.attackScoreOne == attackScoreOne) &&
            (identical(other.mapScore, mapScore) ||
                other.mapScore == mapScore) &&
            const DeepCollectionEquality().equals(other.compsOne, compsOne) &&
            const DeepCollectionEquality().equals(other.compsTwo, compsTwo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    matchesCount,
    scoreOne,
    attackScoreOne,
    mapScore,
    const DeepCollectionEquality().hash(compsOne),
    const DeepCollectionEquality().hash(compsTwo),
  );

  @override
  String toString() {
    return 'MatchesSummary(matchesCount: $matchesCount, scoreOne: $scoreOne, attackScoreOne: $attackScoreOne, mapScore: $mapScore, compsOne: $compsOne, compsTwo: $compsTwo)';
  }
}

/// @nodoc
abstract mixin class $MatchesSummaryCopyWith<$Res> {
  factory $MatchesSummaryCopyWith(
    MatchesSummary value,
    $Res Function(MatchesSummary) _then,
  ) = _$MatchesSummaryCopyWithImpl;
  @useResult
  $Res call({
    int matchesCount,
    Score scoreOne,
    Score attackScoreOne,
    Score mapScore,
    Set<AgentComp> compsOne,
    Set<AgentComp> compsTwo,
  });
}

/// @nodoc
class _$MatchesSummaryCopyWithImpl<$Res>
    implements $MatchesSummaryCopyWith<$Res> {
  _$MatchesSummaryCopyWithImpl(this._self, this._then);

  final MatchesSummary _self;
  final $Res Function(MatchesSummary) _then;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchesCount = null,
    Object? scoreOne = null,
    Object? attackScoreOne = null,
    Object? mapScore = null,
    Object? compsOne = null,
    Object? compsTwo = null,
  }) {
    return _then(
      _self.copyWith(
        matchesCount: null == matchesCount
            ? _self.matchesCount
            : matchesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        scoreOne: null == scoreOne
            ? _self.scoreOne
            : scoreOne // ignore: cast_nullable_to_non_nullable
                  as Score,
        attackScoreOne: null == attackScoreOne
            ? _self.attackScoreOne
            : attackScoreOne // ignore: cast_nullable_to_non_nullable
                  as Score,
        mapScore: null == mapScore
            ? _self.mapScore
            : mapScore // ignore: cast_nullable_to_non_nullable
                  as Score,
        compsOne: null == compsOne
            ? _self.compsOne
            : compsOne // ignore: cast_nullable_to_non_nullable
                  as Set<AgentComp>,
        compsTwo: null == compsTwo
            ? _self.compsTwo
            : compsTwo // ignore: cast_nullable_to_non_nullable
                  as Set<AgentComp>,
      ),
    );
  }
}

/// @nodoc

class _MatchesSummary extends MatchesSummary {
  const _MatchesSummary({
    required this.matchesCount,
    required this.scoreOne,
    required this.attackScoreOne,
    required this.mapScore,
    required final Set<AgentComp> compsOne,
    required final Set<AgentComp> compsTwo,
  }) : _compsOne = compsOne,
       _compsTwo = compsTwo,
       super._();

  @override
  final int matchesCount;
  @override
  final Score scoreOne;
  @override
  final Score attackScoreOne;
  @override
  final Score mapScore;
  final Set<AgentComp> _compsOne;
  @override
  Set<AgentComp> get compsOne {
    if (_compsOne is EqualUnmodifiableSetView) return _compsOne;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_compsOne);
  }

  final Set<AgentComp> _compsTwo;
  @override
  Set<AgentComp> get compsTwo {
    if (_compsTwo is EqualUnmodifiableSetView) return _compsTwo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_compsTwo);
  }

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchesSummaryCopyWith<_MatchesSummary> get copyWith =>
      __$MatchesSummaryCopyWithImpl<_MatchesSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchesSummary &&
            (identical(other.matchesCount, matchesCount) ||
                other.matchesCount == matchesCount) &&
            (identical(other.scoreOne, scoreOne) ||
                other.scoreOne == scoreOne) &&
            (identical(other.attackScoreOne, attackScoreOne) ||
                other.attackScoreOne == attackScoreOne) &&
            (identical(other.mapScore, mapScore) ||
                other.mapScore == mapScore) &&
            const DeepCollectionEquality().equals(other._compsOne, _compsOne) &&
            const DeepCollectionEquality().equals(other._compsTwo, _compsTwo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    matchesCount,
    scoreOne,
    attackScoreOne,
    mapScore,
    const DeepCollectionEquality().hash(_compsOne),
    const DeepCollectionEquality().hash(_compsTwo),
  );

  @override
  String toString() {
    return 'MatchesSummary(matchesCount: $matchesCount, scoreOne: $scoreOne, attackScoreOne: $attackScoreOne, mapScore: $mapScore, compsOne: $compsOne, compsTwo: $compsTwo)';
  }
}

/// @nodoc
abstract mixin class _$MatchesSummaryCopyWith<$Res>
    implements $MatchesSummaryCopyWith<$Res> {
  factory _$MatchesSummaryCopyWith(
    _MatchesSummary value,
    $Res Function(_MatchesSummary) _then,
  ) = __$MatchesSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int matchesCount,
    Score scoreOne,
    Score attackScoreOne,
    Score mapScore,
    Set<AgentComp> compsOne,
    Set<AgentComp> compsTwo,
  });
}

/// @nodoc
class __$MatchesSummaryCopyWithImpl<$Res>
    implements _$MatchesSummaryCopyWith<$Res> {
  __$MatchesSummaryCopyWithImpl(this._self, this._then);

  final _MatchesSummary _self;
  final $Res Function(_MatchesSummary) _then;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? matchesCount = null,
    Object? scoreOne = null,
    Object? attackScoreOne = null,
    Object? mapScore = null,
    Object? compsOne = null,
    Object? compsTwo = null,
  }) {
    return _then(
      _MatchesSummary(
        matchesCount: null == matchesCount
            ? _self.matchesCount
            : matchesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        scoreOne: null == scoreOne
            ? _self.scoreOne
            : scoreOne // ignore: cast_nullable_to_non_nullable
                  as Score,
        attackScoreOne: null == attackScoreOne
            ? _self.attackScoreOne
            : attackScoreOne // ignore: cast_nullable_to_non_nullable
                  as Score,
        mapScore: null == mapScore
            ? _self.mapScore
            : mapScore // ignore: cast_nullable_to_non_nullable
                  as Score,
        compsOne: null == compsOne
            ? _self._compsOne
            : compsOne // ignore: cast_nullable_to_non_nullable
                  as Set<AgentComp>,
        compsTwo: null == compsTwo
            ? _self._compsTwo
            : compsTwo // ignore: cast_nullable_to_non_nullable
                  as Set<AgentComp>,
      ),
    );
  }
}
