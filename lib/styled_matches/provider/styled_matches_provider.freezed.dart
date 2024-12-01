// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'styled_matches_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StyledMatchesState {
  ValorantMatches get matches => throw _privateConstructorUsedError;
  ({double aggro, double control, double midrange}) get acm =>
      throw _privateConstructorUsedError;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StyledMatchesStateCopyWith<StyledMatchesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyledMatchesStateCopyWith<$Res> {
  factory $StyledMatchesStateCopyWith(
          StyledMatchesState value, $Res Function(StyledMatchesState) then) =
      _$StyledMatchesStateCopyWithImpl<$Res, StyledMatchesState>;
  @useResult
  $Res call(
      {ValorantMatches matches,
      ({double aggro, double control, double midrange}) acm});
}

/// @nodoc
class _$StyledMatchesStateCopyWithImpl<$Res, $Val extends StyledMatchesState>
    implements $StyledMatchesStateCopyWith<$Res> {
  _$StyledMatchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? acm = null,
  }) {
    return _then(_value.copyWith(
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ValorantMatches,
      acm: null == acm
          ? _value.acm
          : acm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyledMatchesStateImplCopyWith<$Res>
    implements $StyledMatchesStateCopyWith<$Res> {
  factory _$$StyledMatchesStateImplCopyWith(_$StyledMatchesStateImpl value,
          $Res Function(_$StyledMatchesStateImpl) then) =
      __$$StyledMatchesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValorantMatches matches,
      ({double aggro, double control, double midrange}) acm});
}

/// @nodoc
class __$$StyledMatchesStateImplCopyWithImpl<$Res>
    extends _$StyledMatchesStateCopyWithImpl<$Res, _$StyledMatchesStateImpl>
    implements _$$StyledMatchesStateImplCopyWith<$Res> {
  __$$StyledMatchesStateImplCopyWithImpl(_$StyledMatchesStateImpl _value,
      $Res Function(_$StyledMatchesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? acm = null,
  }) {
    return _then(_$StyledMatchesStateImpl(
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ValorantMatches,
      acm: null == acm
          ? _value.acm
          : acm // ignore: cast_nullable_to_non_nullable
              as ({double aggro, double control, double midrange}),
    ));
  }
}

/// @nodoc

class _$StyledMatchesStateImpl extends _StyledMatchesState {
  const _$StyledMatchesStateImpl({required this.matches, required this.acm})
      : super._();

  @override
  final ValorantMatches matches;
  @override
  final ({double aggro, double control, double midrange}) acm;

  @override
  String toString() {
    return 'StyledMatchesState(matches: $matches, acm: $acm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyledMatchesStateImpl &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.acm, acm) || other.acm == acm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matches), acm);

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StyledMatchesStateImplCopyWith<_$StyledMatchesStateImpl> get copyWith =>
      __$$StyledMatchesStateImplCopyWithImpl<_$StyledMatchesStateImpl>(
          this, _$identity);
}

abstract class _StyledMatchesState extends StyledMatchesState {
  const factory _StyledMatchesState(
      {required final ValorantMatches matches,
      required final ({
        double aggro,
        double control,
        double midrange
      }) acm}) = _$StyledMatchesStateImpl;
  const _StyledMatchesState._() : super._();

  @override
  ValorantMatches get matches;
  @override
  ({double aggro, double control, double midrange}) get acm;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StyledMatchesStateImplCopyWith<_$StyledMatchesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
