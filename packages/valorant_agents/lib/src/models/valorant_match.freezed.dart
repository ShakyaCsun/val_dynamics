// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'valorant_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValorantMatch {
  String get mapName;
  Team get teamOne;
  Team get teamTwo;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValorantMatchCopyWith<ValorantMatch> get copyWith =>
      _$ValorantMatchCopyWithImpl<ValorantMatch>(
        this as ValorantMatch,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValorantMatch &&
            (identical(other.mapName, mapName) || other.mapName == mapName) &&
            (identical(other.teamOne, teamOne) || other.teamOne == teamOne) &&
            (identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mapName, teamOne, teamTwo);

  @override
  String toString() {
    return 'ValorantMatch(mapName: $mapName, teamOne: $teamOne, teamTwo: $teamTwo)';
  }
}

/// @nodoc
abstract mixin class $ValorantMatchCopyWith<$Res> {
  factory $ValorantMatchCopyWith(
    ValorantMatch value,
    $Res Function(ValorantMatch) _then,
  ) = _$ValorantMatchCopyWithImpl;
  @useResult
  $Res call({String mapName, Team teamOne, Team teamTwo});

  $TeamCopyWith<$Res> get teamOne;
  $TeamCopyWith<$Res> get teamTwo;
}

/// @nodoc
class _$ValorantMatchCopyWithImpl<$Res>
    implements $ValorantMatchCopyWith<$Res> {
  _$ValorantMatchCopyWithImpl(this._self, this._then);

  final ValorantMatch _self;
  final $Res Function(ValorantMatch) _then;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapName = null,
    Object? teamOne = null,
    Object? teamTwo = null,
  }) {
    return _then(
      _self.copyWith(
        mapName:
            null == mapName
                ? _self.mapName
                : mapName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOne:
            null == teamOne
                ? _self.teamOne
                : teamOne // ignore: cast_nullable_to_non_nullable
                    as Team,
        teamTwo:
            null == teamTwo
                ? _self.teamTwo
                : teamTwo // ignore: cast_nullable_to_non_nullable
                    as Team,
      ),
    );
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamOne {
    return $TeamCopyWith<$Res>(_self.teamOne, (value) {
      return _then(_self.copyWith(teamOne: value));
    });
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamTwo {
    return $TeamCopyWith<$Res>(_self.teamTwo, (value) {
      return _then(_self.copyWith(teamTwo: value));
    });
  }
}

/// @nodoc

class _ValorantMatch extends ValorantMatch {
  const _ValorantMatch({
    required this.mapName,
    required this.teamOne,
    required this.teamTwo,
  }) : super._();

  @override
  final String mapName;
  @override
  final Team teamOne;
  @override
  final Team teamTwo;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValorantMatchCopyWith<_ValorantMatch> get copyWith =>
      __$ValorantMatchCopyWithImpl<_ValorantMatch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValorantMatch &&
            (identical(other.mapName, mapName) || other.mapName == mapName) &&
            (identical(other.teamOne, teamOne) || other.teamOne == teamOne) &&
            (identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mapName, teamOne, teamTwo);

  @override
  String toString() {
    return 'ValorantMatch(mapName: $mapName, teamOne: $teamOne, teamTwo: $teamTwo)';
  }
}

/// @nodoc
abstract mixin class _$ValorantMatchCopyWith<$Res>
    implements $ValorantMatchCopyWith<$Res> {
  factory _$ValorantMatchCopyWith(
    _ValorantMatch value,
    $Res Function(_ValorantMatch) _then,
  ) = __$ValorantMatchCopyWithImpl;
  @override
  @useResult
  $Res call({String mapName, Team teamOne, Team teamTwo});

  @override
  $TeamCopyWith<$Res> get teamOne;
  @override
  $TeamCopyWith<$Res> get teamTwo;
}

/// @nodoc
class __$ValorantMatchCopyWithImpl<$Res>
    implements _$ValorantMatchCopyWith<$Res> {
  __$ValorantMatchCopyWithImpl(this._self, this._then);

  final _ValorantMatch _self;
  final $Res Function(_ValorantMatch) _then;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mapName = null,
    Object? teamOne = null,
    Object? teamTwo = null,
  }) {
    return _then(
      _ValorantMatch(
        mapName:
            null == mapName
                ? _self.mapName
                : mapName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOne:
            null == teamOne
                ? _self.teamOne
                : teamOne // ignore: cast_nullable_to_non_nullable
                    as Team,
        teamTwo:
            null == teamTwo
                ? _self.teamTwo
                : teamTwo // ignore: cast_nullable_to_non_nullable
                    as Team,
      ),
    );
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamOne {
    return $TeamCopyWith<$Res>(_self.teamOne, (value) {
      return _then(_self.copyWith(teamOne: value));
    });
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamTwo {
    return $TeamCopyWith<$Res>(_self.teamTwo, (value) {
      return _then(_self.copyWith(teamTwo: value));
    });
  }
}
