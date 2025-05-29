// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comp_filters_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompFiltersState {
  Map<Agent, AgentStatus> get agentFilters;
  Map<Role, RoleRange> get roleFilters;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompFiltersStateCopyWith<CompFiltersState> get copyWith =>
      _$CompFiltersStateCopyWithImpl<CompFiltersState>(
        this as CompFiltersState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompFiltersState &&
            const DeepCollectionEquality().equals(
              other.agentFilters,
              agentFilters,
            ) &&
            const DeepCollectionEquality().equals(
              other.roleFilters,
              roleFilters,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(agentFilters),
    const DeepCollectionEquality().hash(roleFilters),
  );

  @override
  String toString() {
    return 'CompFiltersState(agentFilters: $agentFilters, roleFilters: $roleFilters)';
  }
}

/// @nodoc
abstract mixin class $CompFiltersStateCopyWith<$Res> {
  factory $CompFiltersStateCopyWith(
    CompFiltersState value,
    $Res Function(CompFiltersState) _then,
  ) = _$CompFiltersStateCopyWithImpl;
  @useResult
  $Res call({
    Map<Agent, AgentStatus> agentFilters,
    Map<Role, RoleRange> roleFilters,
  });
}

/// @nodoc
class _$CompFiltersStateCopyWithImpl<$Res>
    implements $CompFiltersStateCopyWith<$Res> {
  _$CompFiltersStateCopyWithImpl(this._self, this._then);

  final CompFiltersState _self;
  final $Res Function(CompFiltersState) _then;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? agentFilters = null, Object? roleFilters = null}) {
    return _then(
      _self.copyWith(
        agentFilters: null == agentFilters
            ? _self.agentFilters
            : agentFilters // ignore: cast_nullable_to_non_nullable
                  as Map<Agent, AgentStatus>,
        roleFilters: null == roleFilters
            ? _self.roleFilters
            : roleFilters // ignore: cast_nullable_to_non_nullable
                  as Map<Role, RoleRange>,
      ),
    );
  }
}

/// @nodoc

class _CompFiltersState extends CompFiltersState {
  const _CompFiltersState({
    required final Map<Agent, AgentStatus> agentFilters,
    required final Map<Role, RoleRange> roleFilters,
  }) : _agentFilters = agentFilters,
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

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompFiltersStateCopyWith<_CompFiltersState> get copyWith =>
      __$CompFiltersStateCopyWithImpl<_CompFiltersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompFiltersState &&
            const DeepCollectionEquality().equals(
              other._agentFilters,
              _agentFilters,
            ) &&
            const DeepCollectionEquality().equals(
              other._roleFilters,
              _roleFilters,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_agentFilters),
    const DeepCollectionEquality().hash(_roleFilters),
  );

  @override
  String toString() {
    return 'CompFiltersState(agentFilters: $agentFilters, roleFilters: $roleFilters)';
  }
}

/// @nodoc
abstract mixin class _$CompFiltersStateCopyWith<$Res>
    implements $CompFiltersStateCopyWith<$Res> {
  factory _$CompFiltersStateCopyWith(
    _CompFiltersState value,
    $Res Function(_CompFiltersState) _then,
  ) = __$CompFiltersStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    Map<Agent, AgentStatus> agentFilters,
    Map<Role, RoleRange> roleFilters,
  });
}

/// @nodoc
class __$CompFiltersStateCopyWithImpl<$Res>
    implements _$CompFiltersStateCopyWith<$Res> {
  __$CompFiltersStateCopyWithImpl(this._self, this._then);

  final _CompFiltersState _self;
  final $Res Function(_CompFiltersState) _then;

  /// Create a copy of CompFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? agentFilters = null, Object? roleFilters = null}) {
    return _then(
      _CompFiltersState(
        agentFilters: null == agentFilters
            ? _self._agentFilters
            : agentFilters // ignore: cast_nullable_to_non_nullable
                  as Map<Agent, AgentStatus>,
        roleFilters: null == roleFilters
            ? _self._roleFilters
            : roleFilters // ignore: cast_nullable_to_non_nullable
                  as Map<Role, RoleRange>,
      ),
    );
  }
}
