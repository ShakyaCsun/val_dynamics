// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_agents_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddAgentsError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAgentsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAgentsError()';
  }
}

/// @nodoc
class $AddAgentsErrorCopyWith<$Res> {
  $AddAgentsErrorCopyWith(AddAgentsError _, $Res Function(AddAgentsError) __);
}

/// @nodoc

class NoAddAgentsError implements AddAgentsError {
  const NoAddAgentsError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoAddAgentsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAgentsError.none()';
  }
}

/// @nodoc

class InvalidAddAgentsFormError implements AddAgentsError {
  const InvalidAddAgentsFormError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidAddAgentsFormError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAgentsError.invalidForm()';
  }
}

/// @nodoc

class InvalidAgentsJsonError implements AddAgentsError {
  const InvalidAgentsJsonError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InvalidAgentsJsonError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAgentsError.invalidJson()';
  }
}

/// @nodoc

class UnknownAgentsError implements AddAgentsError {
  const UnknownAgentsError({required this.error});

  final Object error;

  /// Create a copy of AddAgentsError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownAgentsErrorCopyWith<UnknownAgentsError> get copyWith =>
      _$UnknownAgentsErrorCopyWithImpl<UnknownAgentsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnknownAgentsError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'AddAgentsError.unknown(error: $error)';
  }
}

/// @nodoc
abstract mixin class $UnknownAgentsErrorCopyWith<$Res>
    implements $AddAgentsErrorCopyWith<$Res> {
  factory $UnknownAgentsErrorCopyWith(
    UnknownAgentsError value,
    $Res Function(UnknownAgentsError) _then,
  ) = _$UnknownAgentsErrorCopyWithImpl;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$UnknownAgentsErrorCopyWithImpl<$Res>
    implements $UnknownAgentsErrorCopyWith<$Res> {
  _$UnknownAgentsErrorCopyWithImpl(this._self, this._then);

  final UnknownAgentsError _self;
  final $Res Function(UnknownAgentsError) _then;

  /// Create a copy of AddAgentsError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null}) {
    return _then(
      UnknownAgentsError(error: null == error ? _self.error : error),
    );
  }
}
