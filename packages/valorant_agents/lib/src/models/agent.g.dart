// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
  name: json['name'] as String,
  aggro: (json['aggro'] as num).toDouble(),
  control: (json['control'] as num).toDouble(),
  midrange: (json['midrange'] as num).toDouble(),
  role: Role.fromJson(json['role'] as String),
  iconUrl: json['iconUrl'] as String?,
  portraitUrl: json['portraitUrl'] as String?,
  abilityOne: json['abilityOne'] == null
      ? const AbilityOne()
      : AbilityOne.fromJson(json['abilityOne'] as Map<String, dynamic>),
  abilityTwo: json['abilityTwo'] == null
      ? const AbilityTwo()
      : AbilityTwo.fromJson(json['abilityTwo'] as Map<String, dynamic>),
  abilityThree: json['abilityThree'] == null
      ? const AbilityThree()
      : AbilityThree.fromJson(json['abilityThree'] as Map<String, dynamic>),
  ultimateAbility: json['ultimateAbility'] == null
      ? const UltimateAbility()
      : UltimateAbility.fromJson(
          json['ultimateAbility'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
  'name': instance.name,
  'aggro': instance.aggro,
  'control': instance.control,
  'midrange': instance.midrange,
  'role': instance.role,
  if (instance.iconUrl case final value?) 'iconUrl': value,
  if (instance.portraitUrl case final value?) 'portraitUrl': value,
  'abilityOne': instance.abilityOne,
  'abilityTwo': instance.abilityTwo,
  'abilityThree': instance.abilityThree,
  'ultimateAbility': instance.ultimateAbility,
};
