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
mixin _$MatchesFilterState {
  MatchUpFilter get filter;
  Set<String> get maps;

  /// Create a copy of MatchesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesFilterStateCopyWith<MatchesFilterState> get copyWith =>
      _$MatchesFilterStateCopyWithImpl<MatchesFilterState>(
        this as MatchesFilterState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesFilterState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.maps, maps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    filter,
    const DeepCollectionEquality().hash(maps),
  );

  @override
  String toString() {
    return 'MatchesFilterState(filter: $filter, maps: $maps)';
  }
}

/// @nodoc
abstract mixin class $MatchesFilterStateCopyWith<$Res> {
  factory $MatchesFilterStateCopyWith(
    MatchesFilterState value,
    $Res Function(MatchesFilterState) _then,
  ) = _$MatchesFilterStateCopyWithImpl;
  @useResult
  $Res call({MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class _$MatchesFilterStateCopyWithImpl<$Res>
    implements $MatchesFilterStateCopyWith<$Res> {
  _$MatchesFilterStateCopyWithImpl(this._self, this._then);

  final MatchesFilterState _self;
  final $Res Function(MatchesFilterState) _then;

  /// Create a copy of MatchesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filter = null, Object? maps = null}) {
    return _then(
      _self.copyWith(
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

class _MatchesState implements MatchesFilterState {
  const _MatchesState({
    this.filter = MatchUpFilter.styles,
    final Set<String> maps = const {},
  }) : _maps = maps;

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

  /// Create a copy of MatchesFilterState
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
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._maps, _maps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    filter,
    const DeepCollectionEquality().hash(_maps),
  );

  @override
  String toString() {
    return 'MatchesFilterState(filter: $filter, maps: $maps)';
  }
}

/// @nodoc
abstract mixin class _$MatchesStateCopyWith<$Res>
    implements $MatchesFilterStateCopyWith<$Res> {
  factory _$MatchesStateCopyWith(
    _MatchesState value,
    $Res Function(_MatchesState) _then,
  ) = __$MatchesStateCopyWithImpl;
  @override
  @useResult
  $Res call({MatchUpFilter filter, Set<String> maps});
}

/// @nodoc
class __$MatchesStateCopyWithImpl<$Res>
    implements _$MatchesStateCopyWith<$Res> {
  __$MatchesStateCopyWithImpl(this._self, this._then);

  final _MatchesState _self;
  final $Res Function(_MatchesState) _then;

  /// Create a copy of MatchesFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? filter = null, Object? maps = null}) {
    return _then(
      _MatchesState(
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
