// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityOne _$AbilityOneFromJson(Map<String, dynamic> json) => AbilityOne(
      name: json['name'] as String? ?? 'Ability 1',
      aggro: (json['aggro'] as num?)?.toDouble() ?? 0,
      control: (json['control'] as num?)?.toDouble() ?? 0,
      midrange: (json['midrange'] as num?)?.toDouble() ?? 0,
      reasons: (json['reasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AbilityOneToJson(AbilityOne instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aggro': instance.aggro,
      'control': instance.control,
      'midrange': instance.midrange,
      'reasons': instance.reasons,
    };

AbilityTwo _$AbilityTwoFromJson(Map<String, dynamic> json) => AbilityTwo(
      name: json['name'] as String? ?? 'Ability 2',
      aggro: (json['aggro'] as num?)?.toDouble() ?? 0,
      control: (json['control'] as num?)?.toDouble() ?? 0,
      midrange: (json['midrange'] as num?)?.toDouble() ?? 0,
      reasons: (json['reasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AbilityTwoToJson(AbilityTwo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aggro': instance.aggro,
      'control': instance.control,
      'midrange': instance.midrange,
      'reasons': instance.reasons,
    };

AbilityThree _$AbilityThreeFromJson(Map<String, dynamic> json) => AbilityThree(
      name: json['name'] as String? ?? 'Ability 3',
      aggro: (json['aggro'] as num?)?.toDouble() ?? 0,
      control: (json['control'] as num?)?.toDouble() ?? 0,
      midrange: (json['midrange'] as num?)?.toDouble() ?? 0,
      reasons: (json['reasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AbilityThreeToJson(AbilityThree instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aggro': instance.aggro,
      'control': instance.control,
      'midrange': instance.midrange,
      'reasons': instance.reasons,
    };

UltimateAbility _$UltimateAbilityFromJson(Map<String, dynamic> json) =>
    UltimateAbility(
      name: json['name'] as String? ?? 'Ultimate',
      aggro: (json['aggro'] as num?)?.toDouble() ?? 0,
      control: (json['control'] as num?)?.toDouble() ?? 0,
      midrange: (json['midrange'] as num?)?.toDouble() ?? 0,
      reasons: (json['reasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UltimateAbilityToJson(UltimateAbility instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aggro': instance.aggro,
      'control': instance.control,
      'midrange': instance.midrange,
      'reasons': instance.reasons,
    };
