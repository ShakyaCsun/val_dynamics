// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'styled_matches_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StyledMatchesState {
  ValorantMatches get matches;
  StylePoints get acm;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StyledMatchesStateCopyWith<StyledMatchesState> get copyWith =>
      _$StyledMatchesStateCopyWithImpl<StyledMatchesState>(
        this as StyledMatchesState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StyledMatchesState &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.acm, acm) || other.acm == acm));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    acm,
  );

  @override
  String toString() {
    return 'StyledMatchesState(matches: $matches, acm: $acm)';
  }
}

/// @nodoc
abstract mixin class $StyledMatchesStateCopyWith<$Res> {
  factory $StyledMatchesStateCopyWith(
    StyledMatchesState value,
    $Res Function(StyledMatchesState) _then,
  ) = _$StyledMatchesStateCopyWithImpl;
  @useResult
  $Res call({ValorantMatches matches, StylePoints acm});
}

/// @nodoc
class _$StyledMatchesStateCopyWithImpl<$Res>
    implements $StyledMatchesStateCopyWith<$Res> {
  _$StyledMatchesStateCopyWithImpl(this._self, this._then);

  final StyledMatchesState _self;
  final $Res Function(StyledMatchesState) _then;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? matches = null, Object? acm = null}) {
    return _then(
      _self.copyWith(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        acm:
            null == acm
                ? _self.acm
                : acm // ignore: cast_nullable_to_non_nullable
                    as StylePoints,
      ),
    );
  }
}

/// @nodoc

class _StyledMatchesState extends StyledMatchesState {
  const _StyledMatchesState({required this.matches, required this.acm})
    : super._();

  @override
  final ValorantMatches matches;
  @override
  final StylePoints acm;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StyledMatchesStateCopyWith<_StyledMatchesState> get copyWith =>
      __$StyledMatchesStateCopyWithImpl<_StyledMatchesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StyledMatchesState &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.acm, acm) || other.acm == acm));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    acm,
  );

  @override
  String toString() {
    return 'StyledMatchesState(matches: $matches, acm: $acm)';
  }
}

/// @nodoc
abstract mixin class _$StyledMatchesStateCopyWith<$Res>
    implements $StyledMatchesStateCopyWith<$Res> {
  factory _$StyledMatchesStateCopyWith(
    _StyledMatchesState value,
    $Res Function(_StyledMatchesState) _then,
  ) = __$StyledMatchesStateCopyWithImpl;
  @override
  @useResult
  $Res call({ValorantMatches matches, StylePoints acm});
}

/// @nodoc
class __$StyledMatchesStateCopyWithImpl<$Res>
    implements _$StyledMatchesStateCopyWith<$Res> {
  __$StyledMatchesStateCopyWithImpl(this._self, this._then);

  final _StyledMatchesState _self;
  final $Res Function(_StyledMatchesState) _then;

  /// Create a copy of StyledMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? matches = null, Object? acm = null}) {
    return _then(
      _StyledMatchesState(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        acm:
            null == acm
                ? _self.acm
                : acm // ignore: cast_nullable_to_non_nullable
                    as StylePoints,
      ),
    );
  }
}
