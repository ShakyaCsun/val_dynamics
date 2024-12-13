// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_stats_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MatchesSummary {
  int get matchesCount => throw _privateConstructorUsedError;
  Score get scoreOne => throw _privateConstructorUsedError;
  Score get attackScoreOne => throw _privateConstructorUsedError;
  Set<AgentComp> get compsOne => throw _privateConstructorUsedError;
  Set<AgentComp> get compsTwo => throw _privateConstructorUsedError;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchesSummaryCopyWith<MatchesSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesSummaryCopyWith<$Res> {
  factory $MatchesSummaryCopyWith(
    MatchesSummary value,
    $Res Function(MatchesSummary) then,
  ) = _$MatchesSummaryCopyWithImpl<$Res, MatchesSummary>;
  @useResult
  $Res call({
    int matchesCount,
    Score scoreOne,
    Score attackScoreOne,
    Set<AgentComp> compsOne,
    Set<AgentComp> compsTwo,
  });
}

/// @nodoc
class _$MatchesSummaryCopyWithImpl<$Res, $Val extends MatchesSummary>
    implements $MatchesSummaryCopyWith<$Res> {
  _$MatchesSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchesCount = null,
    Object? scoreOne = null,
    Object? attackScoreOne = null,
    Object? compsOne = null,
    Object? compsTwo = null,
  }) {
    return _then(
      _value.copyWith(
            matchesCount:
                null == matchesCount
                    ? _value.matchesCount
                    : matchesCount // ignore: cast_nullable_to_non_nullable
                        as int,
            scoreOne:
                null == scoreOne
                    ? _value.scoreOne
                    : scoreOne // ignore: cast_nullable_to_non_nullable
                        as Score,
            attackScoreOne:
                null == attackScoreOne
                    ? _value.attackScoreOne
                    : attackScoreOne // ignore: cast_nullable_to_non_nullable
                        as Score,
            compsOne:
                null == compsOne
                    ? _value.compsOne
                    : compsOne // ignore: cast_nullable_to_non_nullable
                        as Set<AgentComp>,
            compsTwo:
                null == compsTwo
                    ? _value.compsTwo
                    : compsTwo // ignore: cast_nullable_to_non_nullable
                        as Set<AgentComp>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchesSummaryImplCopyWith<$Res>
    implements $MatchesSummaryCopyWith<$Res> {
  factory _$$MatchesSummaryImplCopyWith(
    _$MatchesSummaryImpl value,
    $Res Function(_$MatchesSummaryImpl) then,
  ) = __$$MatchesSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int matchesCount,
    Score scoreOne,
    Score attackScoreOne,
    Set<AgentComp> compsOne,
    Set<AgentComp> compsTwo,
  });
}

/// @nodoc
class __$$MatchesSummaryImplCopyWithImpl<$Res>
    extends _$MatchesSummaryCopyWithImpl<$Res, _$MatchesSummaryImpl>
    implements _$$MatchesSummaryImplCopyWith<$Res> {
  __$$MatchesSummaryImplCopyWithImpl(
    _$MatchesSummaryImpl _value,
    $Res Function(_$MatchesSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchesCount = null,
    Object? scoreOne = null,
    Object? attackScoreOne = null,
    Object? compsOne = null,
    Object? compsTwo = null,
  }) {
    return _then(
      _$MatchesSummaryImpl(
        matchesCount:
            null == matchesCount
                ? _value.matchesCount
                : matchesCount // ignore: cast_nullable_to_non_nullable
                    as int,
        scoreOne:
            null == scoreOne
                ? _value.scoreOne
                : scoreOne // ignore: cast_nullable_to_non_nullable
                    as Score,
        attackScoreOne:
            null == attackScoreOne
                ? _value.attackScoreOne
                : attackScoreOne // ignore: cast_nullable_to_non_nullable
                    as Score,
        compsOne:
            null == compsOne
                ? _value._compsOne
                : compsOne // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
        compsTwo:
            null == compsTwo
                ? _value._compsTwo
                : compsTwo // ignore: cast_nullable_to_non_nullable
                    as Set<AgentComp>,
      ),
    );
  }
}

/// @nodoc

class _$MatchesSummaryImpl extends _MatchesSummary {
  const _$MatchesSummaryImpl({
    required this.matchesCount,
    required this.scoreOne,
    required this.attackScoreOne,
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

  @override
  String toString() {
    return 'MatchesSummary(matchesCount: $matchesCount, scoreOne: $scoreOne, attackScoreOne: $attackScoreOne, compsOne: $compsOne, compsTwo: $compsTwo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesSummaryImpl &&
            (identical(other.matchesCount, matchesCount) ||
                other.matchesCount == matchesCount) &&
            (identical(other.scoreOne, scoreOne) ||
                other.scoreOne == scoreOne) &&
            (identical(other.attackScoreOne, attackScoreOne) ||
                other.attackScoreOne == attackScoreOne) &&
            const DeepCollectionEquality().equals(other._compsOne, _compsOne) &&
            const DeepCollectionEquality().equals(other._compsTwo, _compsTwo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    matchesCount,
    scoreOne,
    attackScoreOne,
    const DeepCollectionEquality().hash(_compsOne),
    const DeepCollectionEquality().hash(_compsTwo),
  );

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesSummaryImplCopyWith<_$MatchesSummaryImpl> get copyWith =>
      __$$MatchesSummaryImplCopyWithImpl<_$MatchesSummaryImpl>(
        this,
        _$identity,
      );
}

abstract class _MatchesSummary extends MatchesSummary {
  const factory _MatchesSummary({
    required final int matchesCount,
    required final Score scoreOne,
    required final Score attackScoreOne,
    required final Set<AgentComp> compsOne,
    required final Set<AgentComp> compsTwo,
  }) = _$MatchesSummaryImpl;
  const _MatchesSummary._() : super._();

  @override
  int get matchesCount;
  @override
  Score get scoreOne;
  @override
  Score get attackScoreOne;
  @override
  Set<AgentComp> get compsOne;
  @override
  Set<AgentComp> get compsTwo;

  /// Create a copy of MatchesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchesSummaryImplCopyWith<_$MatchesSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
