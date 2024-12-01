import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

/// Get default Role icon for given [role]
AssetGenImage? defaultRoleIcons(Role role) {
  switch (role) {
    case Role.duelist:
      return ValAssets.roles.duelist;
    case Role.initiator:
      return ValAssets.roles.initiator;
    case Role.sentinel:
      return ValAssets.roles.sentinel;
    case Role.controller:
      return ValAssets.roles.controller;
    case Role.unknown:
      return null;
  }
}
