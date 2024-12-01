// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchesState {
  ValorantMatches get matches => throw _privateConstructorUsedError;
  MatchUpFilter get filter => throw _privateConstructorUsedError;
  Set<String> get maps => throw _privateConstructorUsedError;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchesStateCopyWith<MatchesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesStateCopyWith<$Res> {
  factory $MatchesStateCopyWith(
          MatchesState value, $Res Function(MatchesState) then) =
      _$MatchesStateCopyWithImpl<$Res, MatchesState>;
  @useResult
  $Res call({ValorantMatches matches, MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class _$MatchesStateCopyWithImpl<$Res, $Val extends MatchesState>
    implements $MatchesStateCopyWith<$Res> {
  _$MatchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? filter = null,
    Object? maps = null,
  }) {
    return _then(_value.copyWith(
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ValorantMatches,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MatchUpFilter,
      maps: null == maps
          ? _value.maps
          : maps // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchesStateImplCopyWith<$Res>
    implements $MatchesStateCopyWith<$Res> {
  factory _$$MatchesStateImplCopyWith(
          _$MatchesStateImpl value, $Res Function(_$MatchesStateImpl) then) =
      __$$MatchesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ValorantMatches matches, MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class __$$MatchesStateImplCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesStateImpl>
    implements _$$MatchesStateImplCopyWith<$Res> {
  __$$MatchesStateImplCopyWithImpl(
      _$MatchesStateImpl _value, $Res Function(_$MatchesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? filter = null,
    Object? maps = null,
  }) {
    return _then(_$MatchesStateImpl(
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ValorantMatches,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MatchUpFilter,
      maps: null == maps
          ? _value._maps
          : maps // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$MatchesStateImpl extends _MatchesState {
  const _$MatchesStateImpl(
      {required this.matches,
      this.filter = MatchUpFilter.styles,
      final Set<String> maps = const {}})
      : _maps = maps,
        super._();

  @override
  final ValorantMatches matches;
  @override
  @JsonKey()
  final MatchUpFilter filter;
  final Set<String> _maps;
  @override
  @JsonKey()
  Set<String> get maps {
    if (_maps is EqualUnmodifiableSetView) return _maps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_maps);
  }

  @override
  String toString() {
    return 'MatchesState(matches: $matches, filter: $filter, maps: $maps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesStateImpl &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._maps, _maps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matches),
      filter,
      const DeepCollectionEquality().hash(_maps));

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesStateImplCopyWith<_$MatchesStateImpl> get copyWith =>
      __$$MatchesStateImplCopyWithImpl<_$MatchesStateImpl>(this, _$identity);
}

abstract class _MatchesState extends MatchesState {
  const factory _MatchesState(
      {required final ValorantMatches matches,
      final MatchUpFilter filter,
      final Set<String> maps}) = _$MatchesStateImpl;
  const _MatchesState._() : super._();

  @override
  ValorantMatches get matches;
  @override
  MatchUpFilter get filter;
  @override
  Set<String> get maps;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchesStateImplCopyWith<_$MatchesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
