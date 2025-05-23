// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_matches_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddMatchesError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddMatchesError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddMatchesError()';
  }
}

/// @nodoc
class $AddMatchesErrorCopyWith<$Res> {
  $AddMatchesErrorCopyWith(
    AddMatchesError _,
    $Res Function(AddMatchesError) __,
  );
}

/// @nodoc

class NoAddMatchesError implements AddMatchesError {
  const NoAddMatchesError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoAddMatchesError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddMatchesError.none()';
  }
}

/// @nodoc

class InvalidAddMatchesFormError implements AddMatchesError {
  const InvalidAddMatchesFormError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidAddMatchesFormError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddMatchesError.invalidForm()';
  }
}

/// @nodoc

class InvalidMatchesCsvError implements AddMatchesError {
  const InvalidMatchesCsvError({required this.message});

  final String message;

  /// Create a copy of AddMatchesError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvalidMatchesCsvErrorCopyWith<InvalidMatchesCsvError> get copyWith =>
      _$InvalidMatchesCsvErrorCopyWithImpl<InvalidMatchesCsvError>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidMatchesCsvError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AddMatchesError.invalidCsv(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InvalidMatchesCsvErrorCopyWith<$Res>
    implements $AddMatchesErrorCopyWith<$Res> {
  factory $InvalidMatchesCsvErrorCopyWith(
    InvalidMatchesCsvError value,
    $Res Function(InvalidMatchesCsvError) _then,
  ) = _$InvalidMatchesCsvErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$InvalidMatchesCsvErrorCopyWithImpl<$Res>
    implements $InvalidMatchesCsvErrorCopyWith<$Res> {
  _$InvalidMatchesCsvErrorCopyWithImpl(this._self, this._then);

  final InvalidMatchesCsvError _self;
  final $Res Function(InvalidMatchesCsvError) _then;

  /// Create a copy of AddMatchesError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? message = null}) {
    return _then(
      InvalidMatchesCsvError(
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class UnknownMatchesError implements AddMatchesError {
  const UnknownMatchesError({required this.error});

  final Object error;

  /// Create a copy of AddMatchesError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownMatchesErrorCopyWith<UnknownMatchesError> get copyWith =>
      _$UnknownMatchesErrorCopyWithImpl<UnknownMatchesError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnknownMatchesError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'AddMatchesError.unknown(error: $error)';
  }
}

/// @nodoc
abstract mixin class $UnknownMatchesErrorCopyWith<$Res>
    implements $AddMatchesErrorCopyWith<$Res> {
  factory $UnknownMatchesErrorCopyWith(
    UnknownMatchesError value,
    $Res Function(UnknownMatchesError) _then,
  ) = _$UnknownMatchesErrorCopyWithImpl;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$UnknownMatchesErrorCopyWithImpl<$Res>
    implements $UnknownMatchesErrorCopyWith<$Res> {
  _$UnknownMatchesErrorCopyWithImpl(this._self, this._then);

  final UnknownMatchesError _self;
  final $Res Function(UnknownMatchesError) _then;

  /// Create a copy of AddMatchesError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null}) {
    return _then(
      UnknownMatchesError(error: null == error ? _self.error : error),
    );
  }
}
