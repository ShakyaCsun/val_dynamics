import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'agent_ability.g.dart';

/// {@template agent_ability}
/// Agent Ability with Style Dynamics score
/// {@endtemplate}
sealed class AgentAbility extends Equatable {
  /// {@macro agent_ability}
  const AgentAbility({
    required this.name,
    required this.aggro,
    required this.control,
    required this.midrange,
    required this.reasons,
  }) : stylePoints = (aggro: aggro, control: control, midrange: midrange);

  final String name;
  final double aggro;
  final double control;
  final double midrange;
  final List<String> reasons;

  final StylePoints stylePoints;
}

@JsonSerializable()
class AbilityOne extends AgentAbility {
  const AbilityOne({
    super.name = 'Ability 1',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  });

  factory AbilityOne.fromJson(Map<String, dynamic> json) =>
      _$AbilityOneFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityOneToJson(this);

  @override
  List<Object> get props => [name, stylePoints, reasons];
}

@JsonSerializable()
class AbilityTwo extends AgentAbility {
  const AbilityTwo({
    super.name = 'Ability 2',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  });

  factory AbilityTwo.fromJson(Map<String, dynamic> json) =>
      _$AbilityTwoFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityTwoToJson(this);

  @override
  List<Object> get props => [name, stylePoints, reasons];
}

@JsonSerializable()
class AbilityThree extends AgentAbility {
  const AbilityThree({
    super.name = 'Ability 3',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  });

  factory AbilityThree.fromJson(Map<String, dynamic> json) =>
      _$AbilityThreeFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityThreeToJson(this);

  @override
  List<Object> get props => [name, stylePoints, reasons];
}

@JsonSerializable()
class UltimateAbility extends AgentAbility {
  const UltimateAbility({
    super.name = 'Ultimate',
    super.aggro = 0,
    super.control = 0,
    super.midrange = 0,
    super.reasons = const [],
  });

  factory UltimateAbility.fromJson(Map<String, dynamic> json) =>
      _$UltimateAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$UltimateAbilityToJson(this);

  @override
  List<Object> get props => [name, stylePoints, reasons];
}
