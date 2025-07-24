// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_overview_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesCollection {
  String get collectionName;
  List<RawMatch> get rawMatches;
  String get rosterName;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesCollectionCopyWith<MatchesCollection> get copyWith =>
      _$MatchesCollectionCopyWithImpl<MatchesCollection>(
        this as MatchesCollection,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesCollection &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            const DeepCollectionEquality().equals(
              other.rawMatches,
              rawMatches,
            ) &&
            (identical(other.rosterName, rosterName) ||
                other.rosterName == rosterName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    collectionName,
    const DeepCollectionEquality().hash(rawMatches),
    rosterName,
  );

  @override
  String toString() {
    return 'MatchesCollection(collectionName: $collectionName, rawMatches: $rawMatches, rosterName: $rosterName)';
  }
}

/// @nodoc
abstract mixin class $MatchesCollectionCopyWith<$Res> {
  factory $MatchesCollectionCopyWith(
    MatchesCollection value,
    $Res Function(MatchesCollection) _then,
  ) = _$MatchesCollectionCopyWithImpl;
  @useResult
  $Res call({
    String collectionName,
    List<RawMatch> rawMatches,
    String rosterName,
  });
}

/// @nodoc
class _$MatchesCollectionCopyWithImpl<$Res>
    implements $MatchesCollectionCopyWith<$Res> {
  _$MatchesCollectionCopyWithImpl(this._self, this._then);

  final MatchesCollection _self;
  final $Res Function(MatchesCollection) _then;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? rawMatches = null,
    Object? rosterName = null,
  }) {
    return _then(
      _self.copyWith(
        collectionName: null == collectionName
            ? _self.collectionName
            : collectionName // ignore: cast_nullable_to_non_nullable
                  as String,
        rawMatches: null == rawMatches
            ? _self.rawMatches
            : rawMatches // ignore: cast_nullable_to_non_nullable
                  as List<RawMatch>,
        rosterName: null == rosterName
            ? _self.rosterName
            : rosterName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _MatchesCollection extends MatchesCollection {
  const _MatchesCollection({
    required this.collectionName,
    required final List<RawMatch> rawMatches,
    required this.rosterName,
  }) : _rawMatches = rawMatches,
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

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchesCollectionCopyWith<_MatchesCollection> get copyWith =>
      __$MatchesCollectionCopyWithImpl<_MatchesCollection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchesCollection &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            const DeepCollectionEquality().equals(
              other._rawMatches,
              _rawMatches,
            ) &&
            (identical(other.rosterName, rosterName) ||
                other.rosterName == rosterName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    collectionName,
    const DeepCollectionEquality().hash(_rawMatches),
    rosterName,
  );

  @override
  String toString() {
    return 'MatchesCollection(collectionName: $collectionName, rawMatches: $rawMatches, rosterName: $rosterName)';
  }
}

/// @nodoc
abstract mixin class _$MatchesCollectionCopyWith<$Res>
    implements $MatchesCollectionCopyWith<$Res> {
  factory _$MatchesCollectionCopyWith(
    _MatchesCollection value,
    $Res Function(_MatchesCollection) _then,
  ) = __$MatchesCollectionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String collectionName,
    List<RawMatch> rawMatches,
    String rosterName,
  });
}

/// @nodoc
class __$MatchesCollectionCopyWithImpl<$Res>
    implements _$MatchesCollectionCopyWith<$Res> {
  __$MatchesCollectionCopyWithImpl(this._self, this._then);

  final _MatchesCollection _self;
  final $Res Function(_MatchesCollection) _then;

  /// Create a copy of MatchesCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? collectionName = null,
    Object? rawMatches = null,
    Object? rosterName = null,
  }) {
    return _then(
      _MatchesCollection(
        collectionName: null == collectionName
            ? _self.collectionName
            : collectionName // ignore: cast_nullable_to_non_nullable
                  as String,
        rawMatches: null == rawMatches
            ? _self._rawMatches
            : rawMatches // ignore: cast_nullable_to_non_nullable
                  as List<RawMatch>,
        rosterName: null == rosterName
            ? _self.rosterName
            : rosterName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
