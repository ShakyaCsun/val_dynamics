// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppData {
  Map<String, Agents> get bundledAgents;
  Map<String, List<RawMatch>> get bundledMatches;
  String get message;
  AppDataStatus get status;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppDataCopyWith<AppData> get copyWith =>
      _$AppDataCopyWithImpl<AppData>(this as AppData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppData &&
            const DeepCollectionEquality().equals(
              other.bundledAgents,
              bundledAgents,
            ) &&
            const DeepCollectionEquality().equals(
              other.bundledMatches,
              bundledMatches,
            ) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(bundledAgents),
    const DeepCollectionEquality().hash(bundledMatches),
    message,
    status,
  );

  @override
  String toString() {
    return 'AppData(bundledAgents: $bundledAgents, bundledMatches: $bundledMatches, message: $message, status: $status)';
  }
}

/// @nodoc
abstract mixin class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) _then) =
      _$AppDataCopyWithImpl;
  @useResult
  $Res call({
    Map<String, Agents> bundledAgents,
    Map<String, List<RawMatch>> bundledMatches,
    String message,
    AppDataStatus status,
  });
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res> implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._self, this._then);

  final AppData _self;
  final $Res Function(AppData) _then;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundledAgents = null,
    Object? bundledMatches = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        bundledAgents: null == bundledAgents
            ? _self.bundledAgents
            : bundledAgents // ignore: cast_nullable_to_non_nullable
                  as Map<String, Agents>,
        bundledMatches: null == bundledMatches
            ? _self.bundledMatches
            : bundledMatches // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<RawMatch>>,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AppDataStatus,
      ),
    );
  }
}

/// @nodoc

class _AppData implements AppData {
  const _AppData({
    final Map<String, Agents> bundledAgents = const {},
    final Map<String, List<RawMatch>> bundledMatches = const {},
    this.message = 'Initializing',
    this.status = AppDataStatus.initial,
  }) : _bundledAgents = bundledAgents,
       _bundledMatches = bundledMatches;

  final Map<String, Agents> _bundledAgents;
  @override
  @JsonKey()
  Map<String, Agents> get bundledAgents {
    if (_bundledAgents is EqualUnmodifiableMapView) return _bundledAgents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bundledAgents);
  }

  final Map<String, List<RawMatch>> _bundledMatches;
  @override
  @JsonKey()
  Map<String, List<RawMatch>> get bundledMatches {
    if (_bundledMatches is EqualUnmodifiableMapView) return _bundledMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bundledMatches);
  }

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final AppDataStatus status;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppDataCopyWith<_AppData> get copyWith =>
      __$AppDataCopyWithImpl<_AppData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppData &&
            const DeepCollectionEquality().equals(
              other._bundledAgents,
              _bundledAgents,
            ) &&
            const DeepCollectionEquality().equals(
              other._bundledMatches,
              _bundledMatches,
            ) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_bundledAgents),
    const DeepCollectionEquality().hash(_bundledMatches),
    message,
    status,
  );

  @override
  String toString() {
    return 'AppData(bundledAgents: $bundledAgents, bundledMatches: $bundledMatches, message: $message, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$AppDataCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$AppDataCopyWith(_AppData value, $Res Function(_AppData) _then) =
      __$AppDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    Map<String, Agents> bundledAgents,
    Map<String, List<RawMatch>> bundledMatches,
    String message,
    AppDataStatus status,
  });
}

/// @nodoc
class __$AppDataCopyWithImpl<$Res> implements _$AppDataCopyWith<$Res> {
  __$AppDataCopyWithImpl(this._self, this._then);

  final _AppData _self;
  final $Res Function(_AppData) _then;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bundledAgents = null,
    Object? bundledMatches = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(
      _AppData(
        bundledAgents: null == bundledAgents
            ? _self._bundledAgents
            : bundledAgents // ignore: cast_nullable_to_non_nullable
                  as Map<String, Agents>,
        bundledMatches: null == bundledMatches
            ? _self._bundledMatches
            : bundledMatches // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<RawMatch>>,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AppDataStatus,
      ),
    );
  }
}
