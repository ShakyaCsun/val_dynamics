// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comp_filters_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompFiltersState {
  Map<Agent, AgentStatus> get agentFilters =>
      throw _privateConstructorUsedError;
  Map<Role, RoleRange> get roleFilters => throw _privateConstructorUsedError;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompFiltersStateCopyWith<CompFiltersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompFiltersStateCopyWith<$Res> {
  factory $CompFiltersStateCopyWith(
          CompFiltersState value, $Res Function(CompFiltersState) then) =
      _$CompFiltersStateCopyWithImpl<$Res, CompFiltersState>;
  @useResult
  $Res call(
      {Map<Agent, AgentStatus> agentFilters, Map<Role, RoleRange> roleFilters});
}

/// @nodoc
class _$CompFiltersStateCopyWithImpl<$Res, $Val extends CompFiltersState>
    implements $CompFiltersStateCopyWith<$Res> {
  _$CompFiltersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentFilters = null,
    Object? roleFilters = null,
  }) {
    return _then(_value.copyWith(
      agentFilters: null == agentFilters
          ? _value.agentFilters
          : agentFilters // ignore: cast_nullable_to_non_nullable
              as Map<Agent, AgentStatus>,
      roleFilters: null == roleFilters
          ? _value.roleFilters
          : roleFilters // ignore: cast_nullable_to_non_nullable
              as Map<Role, RoleRange>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompFiltersStateImplCopyWith<$Res>
    implements $CompFiltersStateCopyWith<$Res> {
  factory _$$CompFiltersStateImplCopyWith(_$CompFiltersStateImpl value,
          $Res Function(_$CompFiltersStateImpl) then) =
      __$$CompFiltersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<Agent, AgentStatus> agentFilters, Map<Role, RoleRange> roleFilters});
}

/// @nodoc
class __$$CompFiltersStateImplCopyWithImpl<$Res>
    extends _$CompFiltersStateCopyWithImpl<$Res, _$CompFiltersStateImpl>
    implements _$$CompFiltersStateImplCopyWith<$Res> {
  __$$CompFiltersStateImplCopyWithImpl(_$CompFiltersStateImpl _value,
      $Res Function(_$CompFiltersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentFilters = null,
    Object? roleFilters = null,
  }) {
    return _then(_$CompFiltersStateImpl(
      agentFilters: null == agentFilters
          ? _value._agentFilters
          : agentFilters // ignore: cast_nullable_to_non_nullable
              as Map<Agent, AgentStatus>,
      roleFilters: null == roleFilters
          ? _value._roleFilters
          : roleFilters // ignore: cast_nullable_to_non_nullable
              as Map<Role, RoleRange>,
    ));
  }
}

/// @nodoc

class _$CompFiltersStateImpl extends _CompFiltersState {
  const _$CompFiltersStateImpl(
      {required final Map<Agent, AgentStatus> agentFilters,
      required final Map<Role, RoleRange> roleFilters})
      : _agentFilters = agentFilters,
        _roleFilters = roleFilters,
        super._();

  final Map<Agent, AgentStatus> _agentFilters;
  @override
  Map<Agent, AgentStatus> get agentFilters {
    if (_agentFilters is EqualUnmodifiableMapView) return _agentFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_agentFilters);
  }

  final Map<Role, RoleRange> _roleFilters;
  @override
  Map<Role, RoleRange> get roleFilters {
    if (_roleFilters is EqualUnmodifiableMapView) return _roleFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roleFilters);
  }

  @override
  String toString() {
    return 'CompFiltersState(agentFilters: $agentFilters, roleFilters: $roleFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompFiltersStateImpl &&
            const DeepCollectionEquality()
                .equals(other._agentFilters, _agentFilters) &&
            const DeepCollectionEquality()
                .equals(other._roleFilters, _roleFilters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_agentFilters),
      const DeepCollectionEquality().hash(_roleFilters));

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompFiltersStateImplCopyWith<_$CompFiltersStateImpl> get copyWith =>
      __$$CompFiltersStateImplCopyWithImpl<_$CompFiltersStateImpl>(
          this, _$identity);
}

abstract class _CompFiltersState extends CompFiltersState {
  const factory _CompFiltersState(
          {required final Map<Agent, AgentStatus> agentFilters,
          required final Map<Role, RoleRange> roleFilters}) =
      _$CompFiltersStateImpl;
  const _CompFiltersState._() : super._();

  @override
  Map<Agent, AgentStatus> get agentFilters;
  @override
  Map<Role, RoleRange> get roleFilters;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompFiltersStateImplCopyWith<_$CompFiltersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
