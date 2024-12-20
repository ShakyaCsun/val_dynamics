// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'valorant_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ValorantMatch {
  String get mapName => throw _privateConstructorUsedError;
  Team get teamOne => throw _privateConstructorUsedError;
  Team get teamTwo => throw _privateConstructorUsedError;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValorantMatchCopyWith<ValorantMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValorantMatchCopyWith<$Res> {
  factory $ValorantMatchCopyWith(
    ValorantMatch value,
    $Res Function(ValorantMatch) then,
  ) = _$ValorantMatchCopyWithImpl<$Res, ValorantMatch>;
  @useResult
  $Res call({String mapName, Team teamOne, Team teamTwo});

  $TeamCopyWith<$Res> get teamOne;
  $TeamCopyWith<$Res> get teamTwo;
}

/// @nodoc
class _$ValorantMatchCopyWithImpl<$Res, $Val extends ValorantMatch>
    implements $ValorantMatchCopyWith<$Res> {
  _$ValorantMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      _value.copyWith(
            mapName:
                null == mapName
                    ? _value.mapName
                    : mapName // ignore: cast_nullable_to_non_nullable
                        as String,
            teamOne:
                null == teamOne
                    ? _value.teamOne
                    : teamOne // ignore: cast_nullable_to_non_nullable
                        as Team,
            teamTwo:
                null == teamTwo
                    ? _value.teamTwo
                    : teamTwo // ignore: cast_nullable_to_non_nullable
                        as Team,
          )
          as $Val,
    );
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamOne {
    return $TeamCopyWith<$Res>(_value.teamOne, (value) {
      return _then(_value.copyWith(teamOne: value) as $Val);
    });
  }

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get teamTwo {
    return $TeamCopyWith<$Res>(_value.teamTwo, (value) {
      return _then(_value.copyWith(teamTwo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValorantMatchImplCopyWith<$Res>
    implements $ValorantMatchCopyWith<$Res> {
  factory _$$ValorantMatchImplCopyWith(
    _$ValorantMatchImpl value,
    $Res Function(_$ValorantMatchImpl) then,
  ) = __$$ValorantMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mapName, Team teamOne, Team teamTwo});

  @override
  $TeamCopyWith<$Res> get teamOne;
  @override
  $TeamCopyWith<$Res> get teamTwo;
}

/// @nodoc
class __$$ValorantMatchImplCopyWithImpl<$Res>
    extends _$ValorantMatchCopyWithImpl<$Res, _$ValorantMatchImpl>
    implements _$$ValorantMatchImplCopyWith<$Res> {
  __$$ValorantMatchImplCopyWithImpl(
    _$ValorantMatchImpl _value,
    $Res Function(_$ValorantMatchImpl) _then,
  ) : super(_value, _then);

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
      _$ValorantMatchImpl(
        mapName:
            null == mapName
                ? _value.mapName
                : mapName // ignore: cast_nullable_to_non_nullable
                    as String,
        teamOne:
            null == teamOne
                ? _value.teamOne
                : teamOne // ignore: cast_nullable_to_non_nullable
                    as Team,
        teamTwo:
            null == teamTwo
                ? _value.teamTwo
                : teamTwo // ignore: cast_nullable_to_non_nullable
                    as Team,
      ),
    );
  }
}

/// @nodoc

class _$ValorantMatchImpl extends _ValorantMatch {
  const _$ValorantMatchImpl({
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

  @override
  String toString() {
    return 'ValorantMatch(mapName: $mapName, teamOne: $teamOne, teamTwo: $teamTwo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValorantMatchImpl &&
            (identical(other.mapName, mapName) || other.mapName == mapName) &&
            (identical(other.teamOne, teamOne) || other.teamOne == teamOne) &&
            (identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mapName, teamOne, teamTwo);

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValorantMatchImplCopyWith<_$ValorantMatchImpl> get copyWith =>
      __$$ValorantMatchImplCopyWithImpl<_$ValorantMatchImpl>(this, _$identity);
}

abstract class _ValorantMatch extends ValorantMatch {
  const factory _ValorantMatch({
    required final String mapName,
    required final Team teamOne,
    required final Team teamTwo,
  }) = _$ValorantMatchImpl;
  const _ValorantMatch._() : super._();

  @override
  String get mapName;
  @override
  Team get teamOne;
  @override
  Team get teamTwo;

  /// Create a copy of ValorantMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValorantMatchImplCopyWith<_$ValorantMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
