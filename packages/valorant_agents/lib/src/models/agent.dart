import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'agent.g.dart';

/// {@template agent}
/// Agent
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Agent extends Equatable {
  /// {@macro agent}
  const Agent({
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
  }) : stylePoints = (aggro: aggro, control: control, midrange: midrange);

  /// Deserializes the given [json] into a [Agent]
  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);

  final String name;
  final double aggro;
  final double control;
  final double midrange;
  final Role role;
  final String? iconUrl;
  final String? portraitUrl;
  final AbilityOne abilityOne;
  final AbilityTwo abilityTwo;
  final AbilityThree abilityThree;
  final UltimateAbility ultimateAbility;
  final StylePoints stylePoints;

  double get totalPoints => aggro + control + midrange;

  Map<String, dynamic> toMinimalJson() {
    return {
      'name': name,
      'aggro': aggro,
      'control': control,
      'midrange': midrange,
      'role': role.toJson(),
    };
  }

  bool get validAbilityPoints {
    final abilitiesTotal =
        abilityOne.stylePoints +
        abilityTwo.stylePoints +
        abilityThree.stylePoints +
        ultimateAbility.stylePoints;
    return abilitiesTotal == stylePoints;
  }

  @override
  String toString() {
    if (iconUrl != null) {
      return '$name(acm: ${stylePoints.acm}, '
          'role: ${role.name}, iconUrl: $iconUrl)';
    }
    return '$name(acm: ${stylePoints.acm}, role: ${role.name})';
  }

  static const astra = Agent(
    name: 'Astra',
    aggro: 2,
    control: 2,
    midrange: 6,
    role: Role.controller,
    abilityOne: AbilityOne(
      name: 'Nova Pulse',
      aggro: 1,
      midrange: 2,
      reasons: [
        'High Potency/Fast Cast',
        'Refreshable/Cooldown',
        'Multi-modal',
      ],
    ),
    abilityTwo: AbilityTwo(
      name: 'Nebula / Dissipate',
      control: 1,
      midrange: 2,
      reasons: ['Stall', 'Refreshable/Cooldown', 'Multi-modal'],
    ),
    abilityThree: AbilityThree(
      name: 'Gravity Well',
      control: 1,
      midrange: 2,
      reasons: ['Stall', 'Refreshable/Cooldown', 'Multi-modal'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Astral Form / Cosmic Divide',
      aggro: 1,
      reasons: ['Map Manipulation'],
    ),
  );
  static const breach = Agent(
    name: 'Breach',
    aggro: 6,
    control: 3,
    midrange: 1,
    role: Role.initiator,
    abilityOne: AbilityOne(name: 'Flashpoint', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Fault Line', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Aftershock', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Rolling Thunder', reasons: ['']),
  );
  static const brimstone = Agent(
    name: 'Brimstone',
    aggro: 6,
    control: 2,
    midrange: 2,
    role: Role.controller,
    abilityOne: AbilityOne(name: 'Incendiary', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Sky Smoke', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Stim Beacon', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Orbital Strike', reasons: ['']),
  );
  static const chamber = Agent(
    name: 'Chamber',
    aggro: 5,
    control: 5,
    midrange: 0,
    role: Role.sentinel,
    abilityOne: AbilityOne(name: 'Headhunter', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Rendezvous', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Trademark', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Tour De Force', reasons: ['']),
  );
  static const clove = Agent(
    name: 'Clove',
    aggro: 4,
    control: 1,
    midrange: 5,
    role: Role.controller,
    abilityOne: AbilityOne(
      name: 'Meddle',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: [
        'High Potency',
        'Non-Catalytic Duel Facilitation',
        'Intermediate Range',
      ],
    ),
    abilityTwo: AbilityTwo(
      name: 'Ruse',
      aggro: 1,
      midrange: 2,
      reasons: ['Burst Smokes', 'Cooldown', 'Post mortem'],
    ),
    abilityThree: AbilityThree(
      name: 'Pick-me-up',
      aggro: 2,
      midrange: 1,
      reasons: ['', '', ''],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Not Dead Yet',
      midrange: 1,
      reasons: ['Post mortem'],
    ),
  );
  static const cypher = Agent(
    name: 'Cypher',
    aggro: 1,
    control: 7,
    midrange: 2,
    role: Role.sentinel,
    abilityOne: AbilityOne(name: 'Cyber Cage', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Spycam', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Trapwire', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Neural Theft', reasons: ['']),
  );
  static const deadlock = Agent(
    name: 'Deadlock',
    aggro: 1,
    control: 5,
    midrange: 4,
    role: Role.sentinel,
    abilityOne: AbilityOne(
      name: 'Sonic Sensor',
      control: 1,
      midrange: 2,
      reasons: ['Pre-placement', 'Audio-based Trigger', 'Soft Info'],
    ),
    abilityTwo: AbilityTwo(
      name: 'GravNet',
      control: 2,
      midrange: 1,
      reasons: [
        'Stall',
        'Non-catalytic Duel Facilitation',
        'Intermediate Range/Large Zone Denial/Soft Info',
      ],
    ),
    abilityThree: AbilityThree(
      name: 'Barrier Mesh',
      control: 2,
      midrange: 1,
      reasons: [
        'Stall',
        'Passive Value',
        'Permeable Zone Denial/Intermediate Range',
      ],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Annihilation',
      aggro: 1,
      reasons: ['Kill Utility'],
    ),
  );
  static const fade = Agent(
    name: 'Fade',
    aggro: 3,
    control: 3,
    midrange: 4,
    role: Role.initiator,
    abilityOne: AbilityOne(name: 'Seize', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Haunt', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Prowler', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Nightfall', reasons: ['']),
  );
  static const gekko = Agent(
    name: 'Gekko',
    aggro: 2,
    control: 1,
    midrange: 7,
    role: Role.initiator,
    abilityOne: AbilityOne(name: 'Wingman', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Dizzy', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Mosh Pit', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Thrash', reasons: ['']),
  );
  static const harbor = Agent(
    name: 'Harbor',
    aggro: 5,
    control: 3,
    midrange: 2,
    role: Role.controller,
    abilityOne: AbilityOne(
      name: 'Cove',
      aggro: 2,
      control: 1,
      reasons: ['Plant Facilitation', '', ''],
    ),
    abilityTwo: AbilityTwo(
      name: 'High Tide',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['', 'Stall/Slow', 'Cooldown'],
    ),
    abilityThree: AbilityThree(
      name: 'Cascade',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['', 'Stall/Slow', 'High Volume'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Reckoning',
      aggro: 1,
      reasons: [''],
    ),
  );
  static const iso = Agent(
    name: 'Iso',
    aggro: 6,
    control: 1,
    midrange: 3,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'Undercut',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: [
        'Explosiveness/Anti-utility',
        'Non-Catalytic Duel Facilitation',
        'Intermediate Range',
      ],
    ),
    abilityTwo: AbilityTwo(
      name: 'Double Tap',
      aggro: 2,
      midrange: 1,
      reasons: ['Self Capitalizable', 'Kill Condition', 'Buffer Health'],
    ),
    abilityThree: AbilityThree(
      name: 'Contingency',
      aggro: 2,
      midrange: 1,
      reasons: [
        'Self Capitalizable',
        'Impenetrable Explosiveness',
        'Intermediate Range',
      ],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Kill Contract',
      aggro: 1,
      reasons: ['Highly Self Capitalizable Duel'],
    ),
  );
  static const jett = Agent(
    name: 'Jett',
    aggro: 8,
    control: 2,
    midrange: 0,
    role: Role.duelist,
    abilityOne: AbilityOne(name: 'Updraft', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Tailwind', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Cloudburst', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Blade Storm', reasons: ['']),
  );
  static const kayo = Agent(
    name: 'KAY/O',
    aggro: 6,
    control: 3,
    midrange: 1,
    role: Role.initiator,
    abilityOne: AbilityOne(name: 'FLASH/drive', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'ZERO/point', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'FRAG/ment', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'NULL/cmd', reasons: ['']),
  );
  static const killjoy = Agent(
    name: 'Killjoy',
    aggro: 3,
    control: 7,
    midrange: 0,
    role: Role.sentinel,
    abilityOne: AbilityOne(name: 'ALARMBOT', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'TURRET', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Nanoswarm', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Lockdown', reasons: ['']),
  );
  static const neon = Agent(
    name: 'Neon',
    aggro: 7,
    control: 0,
    midrange: 3,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'Relay Bolt',
      aggro: 2,
      midrange: 1,
      reasons: ['Fast Cast', 'High Potency', 'Large Area/Multi-zonal'],
    ),
    abilityTwo: AbilityTwo(
      name: 'High Gear',
      aggro: 2,
      midrange: 1,
      reasons: ['Dive', 'Kill Reset', 'Reusable/Recharge'],
    ),
    abilityThree: AbilityThree(
      name: 'Fast Lane',
      aggro: 2,
      midrange: 1,
      reasons: ['Map Manipulation', 'Fast Cast', 'Intermediate Range'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Overdrive',
      aggro: 1,
      reasons: ['Because Aggro'],
    ),
  );
  static const omen = Agent(
    name: 'Omen',
    aggro: 3,
    control: 6,
    midrange: 1,
    role: Role.controller,
    abilityOne: AbilityOne(
      name: 'Paranoia',
      aggro: 2,
      control: 1,
      reasons: ['Potency', 'Effectively Short Range', 'Stall'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Dark Cover',
      control: 2,
      midrange: 1,
      reasons: [
        'Entrenchment via One ways/Rat smokes',
        'High Duration Stall value',
        'Cooldown',
      ],
    ),
    abilityThree: AbilityThree(
      name: 'Shrouded Step',
      aggro: 1,
      control: 2,
      reasons: [
        'Pseudo Dive',
        'Access to Verticality',
        'Reposition for Entrenchment',
      ],
    ),
    ultimateAbility: UltimateAbility(
      name: 'From the Shadows',
      control: 1,
      reasons: ['Hard Info/Global Range'],
    ),
  );
  static const phoenix = Agent(
    name: 'Phoenix',
    aggro: 6,
    control: 2,
    midrange: 2,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'Hot Hands',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Reach', 'Stall', 'Heal/Multi-modal'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Curveball',
      aggro: 3,
      reasons: ['Self Capitalizable', 'Short Range', 'High Potency'],
    ),
    abilityThree: AbilityThree(
      name: 'Blaze',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Map Manipulation', 'Stall', 'Heal/Multi-modal'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Run it Back',
      aggro: 1,
      reasons: ['High Potency EBP'],
    ),
  );
  static const raze = Agent(
    name: 'Raze',
    aggro: 6,
    control: 1,
    midrange: 3,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'Blast Pack',
      aggro: 2,
      midrange: 1,
      reasons: ['Dive', 'Anti Utility', 'Low Potency'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Paint Shells',
      aggro: 2,
      control: 1,
      reasons: ['High Pop Damage', 'Kill Reset', 'Zone Denial/Stall'],
    ),
    abilityThree: AbilityThree(
      name: 'Boom Bot',
      aggro: 1,
      midrange: 2,
      reasons: ['Pop Damage', 'Soft Info', 'Intermediate Range'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Showstopper',
      aggro: 1,
      reasons: ['Rocket'],
    ),
  );
  static const reyna = Agent(
    name: 'Reyna',
    aggro: 8,
    control: 0,
    midrange: 2,
    role: Role.duelist,
    abilityOne: AbilityOne(name: 'Devour', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Dismiss', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Leer', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Empress', reasons: ['']),
  );
  static const sage = Agent(
    name: 'Sage',
    aggro: 1,
    control: 5,
    midrange: 4,
    role: Role.sentinel,
    abilityOne: AbilityOne(
      name: 'Slow Orb',
      control: 2,
      midrange: 1,
      reasons: ['Stall', 'More Stall', 'Intermediate Range'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Healing Orb',
      control: 1,
      midrange: 2,
      reasons: ['Infinite LOS', 'Heal', 'Cooldown'],
    ),
    abilityThree: AbilityThree(
      name: 'Barrier Orb',
      aggro: 1,
      control: 2,
      reasons: ['Bottleneck/Plant Facilitation', 'Stall', 'Passive Value/Info'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Resurrection',
      midrange: 1,
      reasons: ['Recontest'],
    ),
  );
  static const skye = Agent(
    name: 'Skye',
    aggro: 2,
    control: 2,
    midrange: 6,
    role: Role.initiator,
    abilityOne: AbilityOne(
      name: 'Trailblazer',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Explosivity', 'Hard Info', 'Intermediate Range'],
    ),
    abilityTwo: AbilityTwo(name: 'Guiding Light', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Regrowth', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: 'Seekers', reasons: ['']),
  );
  static const sova = Agent(
    name: 'Sova',
    aggro: 1,
    control: 6,
    midrange: 3,
    role: Role.initiator,
    abilityOne: AbilityOne(name: 'Shock Bolt', reasons: ['', '', '']),
    abilityTwo: AbilityTwo(name: 'Recon Bolt', reasons: ['', '', '']),
    abilityThree: AbilityThree(name: 'Owl Drone', reasons: ['', '', '']),
    ultimateAbility: UltimateAbility(name: "Hunter's Fury", reasons: ['']),
  );
  static const tejo = Agent(
    name: 'Tejo',
    aggro: 5,
    control: 1,
    midrange: 4,
    role: Role.initiator,
    abilityOne: AbilityOne(
      name: 'Special Delivery',
      aggro: 2,
      midrange: 1,
      reasons: [
        'High Potency Catalytic Utility',
        'Explosivity (Fast Pop mode)',
        'Intermediate Range',
      ],
    ),
    abilityTwo: AbilityTwo(
      name: 'Guided Salvo',
      aggro: 1,
      midrange: 2,
      reasons: [
        'High Potency Damage',
        'Internal Cooldown',
        'Large AOE/Multi Zonal/Intermediate Range',
      ],
    ),
    abilityThree: AbilityThree(
      name: 'Stealth Drone',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: [
        'Anti-Utility/Suppress',
        'Hard Info',
        'Intermediate Range(Nearsighted Range)',
      ],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Armageddon',
      aggro: 1,
      reasons: ['Giga Aggro Move or Die Missiles'],
    ),
  );
  static const viper = Agent(
    name: 'Viper',
    aggro: 3,
    control: 5,
    midrange: 2,
    role: Role.controller,
    abilityOne: AbilityOne(
      name: 'Poison Cloud',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Reach', 'Stall', 'Reusable Fuel'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Toxic Screen',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Map Manipulation', 'Stall', 'Resource/Reusable'],
    ),
    abilityThree: AbilityThree(
      name: 'Snake Bite',
      aggro: 1,
      control: 2,
      reasons: ['Reach', 'Stall', 'Non-Catalytic Duel Facilitation'],
    ),
    ultimateAbility: UltimateAbility(
      name: "Viper's Pit",
      control: 1,
      reasons: ['Entrenchment'],
    ),
  );
  static const vyse = Agent(
    name: 'Vyse',
    aggro: 0,
    control: 6,
    midrange: 4,
    role: Role.sentinel,
    abilityOne: AbilityOne(
      name: 'Shear',
      control: 2,
      midrange: 1,
      reasons: ['Pre-placement', 'Passive Value', 'Soft Information'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Arc Rose',
      control: 1,
      midrange: 2,
      reasons: ['Pre-placement', 'Soft Information', 'Cooldown'],
    ),
    abilityThree: AbilityThree(
      name: 'Razorvine',
      control: 2,
      midrange: 1,
      reasons: ['Pre-placement', 'Stall', 'Intermediate Range'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Steel Garden',
      control: 1,
      reasons: ["Primary Weapon 'Permission' Denied"],
    ),
  );
  static const waylay = Agent(
    name: 'Waylay',
    // Man's just guessing
    aggro: 7,
    control: 2,
    midrange: 1,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'Lightspeed',
      aggro: 2,
      control: 1,
      reasons: ['Dive', 'Explosiveness', 'Access to Verticality'],
    ),
    abilityTwo: AbilityTwo(
      name: 'Refract',
      aggro: 2,
      midrange: 1,
      reasons: ['Untradeability', 'Kill Reset', 'Intermediate Range'],
    ),
    abilityThree: AbilityThree(
      name: 'Saturate',
      aggro: 2,
      control: 1,
      reasons: ['Fast Cast', 'Short Range', 'Non-catalytic Duel Facilitation'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'Convergent Paths',
      aggro: 1,
      reasons: ['Explosive and Self-capitalizable'],
    ),
  );
  static const yoru = Agent(
    name: 'Yoru',
    aggro: 5,
    control: 3,
    midrange: 2,
    role: Role.duelist,
    abilityOne: AbilityOne(
      name: 'BLINDSIDE',
      aggro: 2,
      control: 1,
      reasons: [
        'Self Capitalizable',
        'Explosiveness',
        'Stall(long duration flash)',
      ],
    ),
    abilityTwo: AbilityTwo(
      name: 'GATECRASH',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Dive', 'Info Manipulation', 'Multi-modal'],
    ),
    abilityThree: AbilityThree(
      name: 'FAKEOUT',
      aggro: 1,
      control: 1,
      midrange: 1,
      reasons: ['Self Capitalizable', 'Pre-placement', 'Soft Info'],
    ),
    ultimateAbility: UltimateAbility(
      name: 'DIMENSIONAL DRIFT',
      aggro: 1,
      reasons: ['Dive'],
    ),
  );

  @override
  List<Object?> get props => [
    name,
    stylePoints,
    role,
    iconUrl,
    portraitUrl,
    abilityOne,
    abilityTwo,
    abilityThree,
    ultimateAbility,
  ];
}
