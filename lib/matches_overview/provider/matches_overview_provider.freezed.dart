// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_overview_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchesCollection {
  String get collectionName => throw _privateConstructorUsedError;
  List<RawMatch> get rawMatches => throw _privateConstructorUsedError;
  String get rosterName => throw _privateConstructorUsedError;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchesCollectionCopyWith<MatchesCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesCollectionCopyWith<$Res> {
  factory $MatchesCollectionCopyWith(
          MatchesCollection value, $Res Function(MatchesCollection) then) =
      _$MatchesCollectionCopyWithImpl<$Res, MatchesCollection>;
  @useResult
  $Res call(
      {String collectionName, List<RawMatch> rawMatches, String rosterName});
}

/// @nodoc
class _$MatchesCollectionCopyWithImpl<$Res, $Val extends MatchesCollection>
    implements $MatchesCollectionCopyWith<$Res> {
  _$MatchesCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? rawMatches = null,
    Object? rosterName = null,
  }) {
    return _then(_value.copyWith(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      rawMatches: null == rawMatches
          ? _value.rawMatches
          : rawMatches // ignore: cast_nullable_to_non_nullable
              as List<RawMatch>,
      rosterName: null == rosterName
          ? _value.rosterName
          : rosterName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchesCollectionImplCopyWith<$Res>
    implements $MatchesCollectionCopyWith<$Res> {
  factory _$$MatchesCollectionImplCopyWith(_$MatchesCollectionImpl value,
          $Res Function(_$MatchesCollectionImpl) then) =
      __$$MatchesCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String collectionName, List<RawMatch> rawMatches, String rosterName});
}

/// @nodoc
class __$$MatchesCollectionImplCopyWithImpl<$Res>
    extends _$MatchesCollectionCopyWithImpl<$Res, _$MatchesCollectionImpl>
    implements _$$MatchesCollectionImplCopyWith<$Res> {
  __$$MatchesCollectionImplCopyWithImpl(_$MatchesCollectionImpl _value,
      $Res Function(_$MatchesCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? rawMatches = null,
    Object? rosterName = null,
  }) {
    return _then(_$MatchesCollectionImpl(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      rawMatches: null == rawMatches
          ? _value._rawMatches
          : rawMatches // ignore: cast_nullable_to_non_nullable
              as List<RawMatch>,
      rosterName: null == rosterName
          ? _value.rosterName
          : rosterName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchesCollectionImpl extends _MatchesCollection {
  const _$MatchesCollectionImpl(
      {required this.collectionName,
      required final List<RawMatch> rawMatches,
      required this.rosterName})
      : _rawMatches = rawMatches,
        super._();

  @override
  final String collectionName;
  final List<RawMatch> _rawMatches;
  @override
  List<RawMatch> get rawMatches {
    if (_rawMatches is EqualUnmodifiableListView) return _rawMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawMatches);
  }

  @override
  final String rosterName;

  @override
  String toString() {
    return 'MatchesCollection(collectionName: $collectionName, rawMatches: $rawMatches, rosterName: $rosterName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesCollectionImpl &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            const DeepCollectionEquality()
                .equals(other._rawMatches, _rawMatches) &&
            (identical(other.rosterName, rosterName) ||
                other.rosterName == rosterName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionName,
      const DeepCollectionEquality().hash(_rawMatches), rosterName);

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesCollectionImplCopyWith<_$MatchesCollectionImpl> get copyWith =>
      __$$MatchesCollectionImplCopyWithImpl<_$MatchesCollectionImpl>(
          this, _$identity);
}

abstract class _MatchesCollection extends MatchesCollection {
  const factory _MatchesCollection(
      {required final String collectionName,
      required final List<RawMatch> rawMatches,
      required final String rosterName}) = _$MatchesCollectionImpl;
  const _MatchesCollection._() : super._();

  @override
  String get collectionName;
  @override
  List<RawMatch> get rawMatches;
  @override
  String get rosterName;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchesCollectionImplCopyWith<_$MatchesCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
