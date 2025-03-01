// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesState {
  ValorantMatches get matches;
  MatchUpFilter get filter;
  Set<String> get maps;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesStateCopyWith<MatchesState> get copyWith =>
      _$MatchesStateCopyWithImpl<MatchesState>(
        this as MatchesState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesState &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.maps, maps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    filter,
    const DeepCollectionEquality().hash(maps),
  );

  @override
  String toString() {
    return 'MatchesState(matches: $matches, filter: $filter, maps: $maps)';
  }
}

/// @nodoc
abstract mixin class $MatchesStateCopyWith<$Res> {
  factory $MatchesStateCopyWith(
    MatchesState value,
    $Res Function(MatchesState) _then,
  ) = _$MatchesStateCopyWithImpl;
  @useResult
  $Res call({ValorantMatches matches, MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class _$MatchesStateCopyWithImpl<$Res> implements $MatchesStateCopyWith<$Res> {
  _$MatchesStateCopyWithImpl(this._self, this._then);

  final MatchesState _self;
  final $Res Function(MatchesState) _then;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? filter = null,
    Object? maps = null,
  }) {
    return _then(
      _self.copyWith(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        filter:
            null == filter
                ? _self.filter
                : filter // ignore: cast_nullable_to_non_nullable
                    as MatchUpFilter,
        maps:
            null == maps
                ? _self.maps
                : maps // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }
}

/// @nodoc

class _MatchesState extends MatchesState {
  const _MatchesState({
    required this.matches,
    this.filter = MatchUpFilter.styles,
    final Set<String> maps = const {},
  }) : _maps = maps,
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

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchesStateCopyWith<_MatchesState> get copyWith =>
      __$MatchesStateCopyWithImpl<_MatchesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchesState &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._maps, _maps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(matches),
    filter,
    const DeepCollectionEquality().hash(_maps),
  );

  @override
  String toString() {
    return 'MatchesState(matches: $matches, filter: $filter, maps: $maps)';
  }
}

/// @nodoc
abstract mixin class _$MatchesStateCopyWith<$Res>
    implements $MatchesStateCopyWith<$Res> {
  factory _$MatchesStateCopyWith(
    _MatchesState value,
    $Res Function(_MatchesState) _then,
  ) = __$MatchesStateCopyWithImpl;
  @override
  @useResult
  $Res call({ValorantMatches matches, MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class __$MatchesStateCopyWithImpl<$Res>
    implements _$MatchesStateCopyWith<$Res> {
  __$MatchesStateCopyWithImpl(this._self, this._then);

  final _MatchesState _self;
  final $Res Function(_MatchesState) _then;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? matches = null,
    Object? filter = null,
    Object? maps = null,
  }) {
    return _then(
      _MatchesState(
        matches:
            null == matches
                ? _self.matches
                : matches // ignore: cast_nullable_to_non_nullable
                    as ValorantMatches,
        filter:
            null == filter
                ? _self.filter
                : filter // ignore: cast_nullable_to_non_nullable
                    as MatchUpFilter,
        maps:
            null == maps
                ? _self._maps
                : maps // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }
}
