// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'styled_matches_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StyledMatchesSummaryData {
  ({double aggro, double control, double midrange}) get acm =>
      throw _privateConstructorUsedError;
  ({double aggro, double control, double midrange}) get opponentAcm =>
      throw _privateConstructorUsedError;
  MatchesSummary get summary => throw _privateConstructorUsedError;

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StyledMatchesSummaryDataCopyWith<StyledMatchesSummaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyledMatchesSummaryDataCopyWith<$Res> {
  factory $StyledMatchesSummaryDataCopyWith(StyledMatchesSummaryData value,
          $Res Function(StyledMatchesSummaryData) then) =
      _$StyledMatchesSummaryDataCopyWithImpl<$Res, StyledMatchesSummaryData>;
  @useResult
  $Res call(
      {({double aggro, double control, double midrange}) acm,
      ({double aggro, double control, double midrange}) opponentAcm,
      MatchesSummary summary});

  $MatchesSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$StyledMatchesSummaryDataCopyWithImpl<$Res,
        $Val extends StyledMatchesSummaryData>
    implements $StyledMatchesSummaryDataCopyWith<$Res> {
  _$StyledMatchesSummaryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acm = null,
    Object? opponentAcm = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      acm: null == acm
          ? _value.acm
          : acm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
      opponentAcm: null == opponentAcm
          ? _value.opponentAcm
          : opponentAcm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as MatchesSummary,
    ) as $Val);
  }

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchesSummaryCopyWith<$Res> get summary {
    return $MatchesSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StyledMatchesSummaryDataImplCopyWith<$Res>
    implements $StyledMatchesSummaryDataCopyWith<$Res> {
  factory _$$StyledMatchesSummaryDataImplCopyWith(
          _$StyledMatchesSummaryDataImpl value,
          $Res Function(_$StyledMatchesSummaryDataImpl) then) =
      __$$StyledMatchesSummaryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {({double aggro, double control, double midrange}) acm,
      ({double aggro, double control, double midrange}) opponentAcm,
      MatchesSummary summary});

  @override
  $MatchesSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$StyledMatchesSummaryDataImplCopyWithImpl<$Res>
    extends _$StyledMatchesSummaryDataCopyWithImpl<$Res,
        _$StyledMatchesSummaryDataImpl>
    implements _$$StyledMatchesSummaryDataImplCopyWith<$Res> {
  __$$StyledMatchesSummaryDataImplCopyWithImpl(
      _$StyledMatchesSummaryDataImpl _value,
      $Res Function(_$StyledMatchesSummaryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acm = null,
    Object? opponentAcm = null,
    Object? summary = null,
  }) {
    return _then(_$StyledMatchesSummaryDataImpl(
      acm: null == acm
          ? _value.acm
          : acm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
      opponentAcm: null == opponentAcm
          ? _value.opponentAcm
          : opponentAcm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as MatchesSummary,
    ));
  }
}

/// @nodoc

class _$StyledMatchesSummaryDataImpl implements _StyledMatchesSummaryData {
  const _$StyledMatchesSummaryDataImpl(
      {required this.acm, required this.opponentAcm, required this.summary});

  @override
  final ({double aggro, double control, double midrange}) acm;
  @override
  final ({double aggro, double control, double midrange}) opponentAcm;
  @override
  final MatchesSummary summary;

  @override
  String toString() {
    return 'StyledMatchesSummaryData(acm: $acm, opponentAcm: $opponentAcm, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyledMatchesSummaryDataImpl &&
            (identical(other.acm, acm) || other.acm == acm) &&
            (identical(other.opponentAcm, opponentAcm) ||
                other.opponentAcm == opponentAcm) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acm, opponentAcm, summary);

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StyledMatchesSummaryDataImplCopyWith<_$StyledMatchesSummaryDataImpl>
      get copyWith => __$$StyledMatchesSummaryDataImplCopyWithImpl<
          _$StyledMatchesSummaryDataImpl>(this, _$identity);
}

abstract class _StyledMatchesSummaryData implements StyledMatchesSummaryData {
  const factory _StyledMatchesSummaryData(
      {required final ({double aggro, double control, double midrange}) acm,
      required final ({
        double aggro,
        double control,
        double midrange
      }) opponentAcm,
      required final MatchesSummary summary}) = _$StyledMatchesSummaryDataImpl;

  @override
  ({double aggro, double control, double midrange}) get acm;
  @override
  ({double aggro, double control, double midrange}) get opponentAcm;
  @override
  MatchesSummary get summary;

  /// Create a copy of StyledMatchesSummaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StyledMatchesSummaryDataImplCopyWith<_$StyledMatchesSummaryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
