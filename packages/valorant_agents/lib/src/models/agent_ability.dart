import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'agent_ability.g.dart';

enum AbilityType { one, two, three, ultimate }

/// {@template agent_ability}
/// Agent Ability with Style Dynamics score
/// {@endtemplate}
sealed class AgentAbility extends Equatable {
  /// {@macro agent_ability}
  const AgentAbility({
    required this.type,
    required this.name,
    required this.aggro,
    required this.control,
    required this.midrange,
    required this.reasons,
  });

  final AbilityType type;
  final String name;
  final double aggro;
  final double control;
  final double midrange;
  final List<String> reasons;

  StylePoints get stylePoints {
    return (aggro: aggro, control: control, midrange: midrange);
  }

  @override
  List<Object> get props => [type, name, aggro, control, midrange, reasons];
}

@JsonSerializable()
class AbilityOne extends AgentAbility {
  const AbilityOne({
    super.name = 'Ability 1',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  }) : super(type: AbilityType.one);

  factory AbilityOne.fromJson(Map<String, dynamic> json) =>
      _$AbilityOneFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityOneToJson(this);
}

@JsonSerializable()
class AbilityTwo extends AgentAbility {
  const AbilityTwo({
    super.name = 'Ability 2',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  }) : super(type: AbilityType.two);

  factory AbilityTwo.fromJson(Map<String, dynamic> json) =>
      _$AbilityTwoFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityTwoToJson(this);
}

@JsonSerializable()
class AbilityThree extends AgentAbility {
  const AbilityThree({
    super.name = 'Ability 3',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  }) : super(type: AbilityType.three);

  factory AbilityThree.fromJson(Map<String, dynamic> json) =>
      _$AbilityThreeFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityThreeToJson(this);
}

@JsonSerializable()
class UltimateAbility extends AgentAbility {
  const UltimateAbility({
    super.name = 'Ultimate',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  }) : super(type: AbilityType.ultimate);

  factory UltimateAbility.fromJson(Map<String, dynamic> json) =>
      _$UltimateAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$UltimateAbilityToJson(this);
}
