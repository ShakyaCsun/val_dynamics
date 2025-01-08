// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppData {
  Map<String, Agents> get bundledAgents => throw _privateConstructorUsedError;
  Map<String, List<RawMatch>> get bundledMatches =>
      throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AppDataStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppDataCopyWith<AppData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) then) =
      _$AppDataCopyWithImpl<$Res, AppData>;
  @useResult
  $Res call({
    Map<String, Agents> bundledAgents,
    Map<String, List<RawMatch>> bundledMatches,
    String message,
    AppDataStatus status,
  });
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res, $Val extends AppData>
    implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      _value.copyWith(
            bundledAgents:
                null == bundledAgents
                    ? _value.bundledAgents
                    : bundledAgents // ignore: cast_nullable_to_non_nullable
                        as Map<String, Agents>,
            bundledMatches:
                null == bundledMatches
                    ? _value.bundledMatches
                    : bundledMatches // ignore: cast_nullable_to_non_nullable
                        as Map<String, List<RawMatch>>,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as AppDataStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppDataImplCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$$AppDataImplCopyWith(
    _$AppDataImpl value,
    $Res Function(_$AppDataImpl) then,
  ) = __$$AppDataImplCopyWithImpl<$Res>;
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
class __$$AppDataImplCopyWithImpl<$Res>
    extends _$AppDataCopyWithImpl<$Res, _$AppDataImpl>
    implements _$$AppDataImplCopyWith<$Res> {
  __$$AppDataImplCopyWithImpl(
    _$AppDataImpl _value,
    $Res Function(_$AppDataImpl) _then,
  ) : super(_value, _then);

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
      _$AppDataImpl(
        bundledAgents:
            null == bundledAgents
                ? _value._bundledAgents
                : bundledAgents // ignore: cast_nullable_to_non_nullable
                    as Map<String, Agents>,
        bundledMatches:
            null == bundledMatches
                ? _value._bundledMatches
                : bundledMatches // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<RawMatch>>,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as AppDataStatus,
      ),
    );
  }
}

/// @nodoc

class _$AppDataImpl implements _AppData {
  const _$AppDataImpl({
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

  @override
  String toString() {
    return 'AppData(bundledAgents: $bundledAgents, bundledMatches: $bundledMatches, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppDataImpl &&
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

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppDataImplCopyWith<_$AppDataImpl> get copyWith =>
      __$$AppDataImplCopyWithImpl<_$AppDataImpl>(this, _$identity);
}

abstract class _AppData implements AppData {
  const factory _AppData({
    final Map<String, Agents> bundledAgents,
    final Map<String, List<RawMatch>> bundledMatches,
    final String message,
    final AppDataStatus status,
  }) = _$AppDataImpl;

  @override
  Map<String, Agents> get bundledAgents;
  @override
  Map<String, List<RawMatch>> get bundledMatches;
  @override
  String get message;
  @override
  AppDataStatus get status;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppDataImplCopyWith<_$AppDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
