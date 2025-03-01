// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Agent {
  String get name;
  double get aggro;
  double get control;
  double get midrange;
  Role get role;
  String? get iconUrl;
  String? get portraitUrl;
  AbilityOne get abilityOne;
  AbilityTwo get abilityTwo;
  AbilityThree get abilityThree;
  UltimateAbility get ultimateAbility;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgentCopyWith<Agent> get copyWith =>
      _$AgentCopyWithImpl<Agent>(this as Agent, _$identity);

  /// Serializes this Agent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Agent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aggro, aggro) || other.aggro == aggro) &&
            (identical(other.control, control) || other.control == control) &&
            (identical(other.midrange, midrange) ||
                other.midrange == midrange) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.portraitUrl, portraitUrl) ||
                other.portraitUrl == portraitUrl) &&
            (identical(other.abilityOne, abilityOne) ||
                other.abilityOne == abilityOne) &&
            (identical(other.abilityTwo, abilityTwo) ||
                other.abilityTwo == abilityTwo) &&
            (identical(other.abilityThree, abilityThree) ||
                other.abilityThree == abilityThree) &&
            (identical(other.ultimateAbility, ultimateAbility) ||
                other.ultimateAbility == ultimateAbility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    aggro,
    control,
    midrange,
    role,
    iconUrl,
    portraitUrl,
    abilityOne,
    abilityTwo,
    abilityThree,
    ultimateAbility,
  );
}

/// @nodoc
abstract mixin class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) _then) =
      _$AgentCopyWithImpl;
  @useResult
  $Res call({
    String name,
    double aggro,
    double control,
    double midrange,
    Role role,
    String? iconUrl,
    String? portraitUrl,
    AbilityOne abilityOne,
    AbilityTwo abilityTwo,
    AbilityThree abilityThree,
    UltimateAbility ultimateAbility,
  });
}

/// @nodoc
class _$AgentCopyWithImpl<$Res> implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._self, this._then);

  final Agent _self;
  final $Res Function(Agent) _then;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? aggro = null,
    Object? control = null,
    Object? midrange = null,
    Object? role = null,
    Object? iconUrl = freezed,
    Object? portraitUrl = freezed,
    Object? abilityOne = null,
    Object? abilityTwo = null,
    Object? abilityThree = null,
    Object? ultimateAbility = null,
  }) {
    return _then(
      _self.copyWith(
        name:
            null == name
                ? _self.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        aggro:
            null == aggro
                ? _self.aggro
                : aggro // ignore: cast_nullable_to_non_nullable
                    as double,
        control:
            null == control
                ? _self.control
                : control // ignore: cast_nullable_to_non_nullable
                    as double,
        midrange:
            null == midrange
                ? _self.midrange
                : midrange // ignore: cast_nullable_to_non_nullable
                    as double,
        role:
            null == role
                ? _self.role
                : role // ignore: cast_nullable_to_non_nullable
                    as Role,
        iconUrl:
            freezed == iconUrl
                ? _self.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        portraitUrl:
            freezed == portraitUrl
                ? _self.portraitUrl
                : portraitUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        abilityOne:
            null == abilityOne
                ? _self.abilityOne
                : abilityOne // ignore: cast_nullable_to_non_nullable
                    as AbilityOne,
        abilityTwo:
            null == abilityTwo
                ? _self.abilityTwo
                : abilityTwo // ignore: cast_nullable_to_non_nullable
                    as AbilityTwo,
        abilityThree:
            null == abilityThree
                ? _self.abilityThree
                : abilityThree // ignore: cast_nullable_to_non_nullable
                    as AbilityThree,
        ultimateAbility:
            null == ultimateAbility
                ? _self.ultimateAbility
                : ultimateAbility // ignore: cast_nullable_to_non_nullable
                    as UltimateAbility,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _Agent extends Agent {
  const _Agent({
    required this.name,
    required this.aggro,
    required this.control,
    required this.midrange,
    required this.role,
    this.iconUrl,
    this.portraitUrl,
    this.abilityOne = const AbilityOne(),
    this.abilityTwo = const AbilityTwo(),
    this.abilityThree = const AbilityThree(),
    this.ultimateAbility = const UltimateAbility(),
  }) : super._();
  factory _Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  @override
  final String name;
  @override
  final double aggro;
  @override
  final double control;
  @override
  final double midrange;
  @override
  final Role role;
  @override
  final String? iconUrl;
  @override
  final String? portraitUrl;
  @override
  @JsonKey()
  final AbilityOne abilityOne;
  @override
  @JsonKey()
  final AbilityTwo abilityTwo;
  @override
  @JsonKey()
  final AbilityThree abilityThree;
  @override
  @JsonKey()
  final UltimateAbility ultimateAbility;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AgentCopyWith<_Agent> get copyWith =>
      __$AgentCopyWithImpl<_Agent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AgentToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Agent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aggro, aggro) || other.aggro == aggro) &&
            (identical(other.control, control) || other.control == control) &&
            (identical(other.midrange, midrange) ||
                other.midrange == midrange) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.portraitUrl, portraitUrl) ||
                other.portraitUrl == portraitUrl) &&
            (identical(other.abilityOne, abilityOne) ||
                other.abilityOne == abilityOne) &&
            (identical(other.abilityTwo, abilityTwo) ||
                other.abilityTwo == abilityTwo) &&
            (identical(other.abilityThree, abilityThree) ||
                other.abilityThree == abilityThree) &&
            (identical(other.ultimateAbility, ultimateAbility) ||
                other.ultimateAbility == ultimateAbility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    aggro,
    control,
    midrange,
    role,
    iconUrl,
    portraitUrl,
    abilityOne,
    abilityTwo,
    abilityThree,
    ultimateAbility,
  );
}

/// @nodoc
abstract mixin class _$AgentCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$AgentCopyWith(_Agent value, $Res Function(_Agent) _then) =
      __$AgentCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    double aggro,
    double control,
    double midrange,
    Role role,
    String? iconUrl,
    String? portraitUrl,
    AbilityOne abilityOne,
    AbilityTwo abilityTwo,
    AbilityThree abilityThree,
    UltimateAbility ultimateAbility,
  });
}

/// @nodoc
class __$AgentCopyWithImpl<$Res> implements _$AgentCopyWith<$Res> {
  __$AgentCopyWithImpl(this._self, this._then);

  final _Agent _self;
  final $Res Function(_Agent) _then;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? aggro = null,
    Object? control = null,
    Object? midrange = null,
    Object? role = null,
    Object? iconUrl = freezed,
    Object? portraitUrl = freezed,
    Object? abilityOne = null,
    Object? abilityTwo = null,
    Object? abilityThree = null,
    Object? ultimateAbility = null,
  }) {
    return _then(
      _Agent(
        name:
            null == name
                ? _self.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        aggro:
            null == aggro
                ? _self.aggro
                : aggro // ignore: cast_nullable_to_non_nullable
                    as double,
        control:
            null == control
                ? _self.control
                : control // ignore: cast_nullable_to_non_nullable
                    as double,
        midrange:
            null == midrange
                ? _self.midrange
                : midrange // ignore: cast_nullable_to_non_nullable
                    as double,
        role:
            null == role
                ? _self.role
                : role // ignore: cast_nullable_to_non_nullable
                    as Role,
        iconUrl:
            freezed == iconUrl
                ? _self.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        portraitUrl:
            freezed == portraitUrl
                ? _self.portraitUrl
                : portraitUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        abilityOne:
            null == abilityOne
                ? _self.abilityOne
                : abilityOne // ignore: cast_nullable_to_non_nullable
                    as AbilityOne,
        abilityTwo:
            null == abilityTwo
                ? _self.abilityTwo
                : abilityTwo // ignore: cast_nullable_to_non_nullable
                    as AbilityTwo,
        abilityThree:
            null == abilityThree
                ? _self.abilityThree
                : abilityThree // ignore: cast_nullable_to_non_nullable
                    as AbilityThree,
        ultimateAbility:
            null == ultimateAbility
                ? _self.ultimateAbility
                : ultimateAbility // ignore: cast_nullable_to_non_nullable
                    as UltimateAbility,
      ),
    );
  }
}
