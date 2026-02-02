import 'package:valorant_agents/valorant_agents.dart';

typedef StyleTypePair = (StyleType, StyleType);

extension StyleTypePairExtension on StyleTypePair {
  bool get isMirror => $1 == $2;

  StyleTypePair get reversed => ($2, $1);
}

enum StyleType {
  heavyAggro('Heavy Aggro'),
  heavyControl('Heavy Control'),
  heavyMidrange('Heavy Midrange'),
  aggroSubControl('Aggro Subtype Control'),
  aggroSubMidrange('Aggro Subtype Midrange'),
  aggroSubHybrid('Aggro Subtype Hybrid'),
  controlSubAggro('Control Subtype Aggro'),
  controlSubMidrange('Control Subtype Midrange'),
  controlSubHybrid('Control Subtype Hybrid'),
  midrangeSubControl('Midrange Subtype Control'),
  midrangeSubAggro('Midrange Subtype Aggro'),
  midrangeSubHybrid('Midrange Subtype Hybrid'),
  aggroControl('Aggro Control'),
  controlMidrange('Control Midrange'),
  midrangeAggro('Midrange Aggro'),
  center('Central Tri-breed');

  const StyleType(this.label);

  factory StyleType.fromStylePoints(StylePoints points) {
    final (:aggro, :control, :midrange) = points.normalized;
    if (aggro >= 75) {
      return heavyAggro;
    }
    if (control >= 75) {
      return heavyControl;
    }
    if (midrange >= 75) {
      return heavyMidrange;
    }
    if (aggro > 50) {
      if (control > 25) {
        return aggroSubControl;
      }
      if (midrange > 25) {
        return aggroSubMidrange;
      }
      return aggroSubHybrid;
    }
    if (control > 50) {
      if (aggro > 25) {
        return controlSubAggro;
      }
      if (midrange > 25) {
        return controlSubMidrange;
      }
      return controlSubHybrid;
    }
    if (midrange > 50) {
      if (control > 25) {
        return midrangeSubControl;
      }
      if (aggro > 25) {
        return midrangeSubAggro;
      }
      return midrangeSubHybrid;
    }
    if (aggro >= 25) {
      if (control >= 25 && midrange < 25) {
        return aggroControl;
      }
      if (midrange >= 25 && control < 25) {
        return midrangeAggro;
      }
    }
    if (control >= 25 && midrange >= 25 && aggro < 25) {
      return controlMidrange;
    }
    return center;
  }

  final String label;

  StyleType? get beats {
    return switch (this) {
      StyleType.heavyAggro => StyleType.heavyControl,
      StyleType.heavyControl => StyleType.heavyMidrange,
      StyleType.heavyMidrange => StyleType.heavyAggro,
      StyleType.aggroSubControl => StyleType.controlSubMidrange,
      StyleType.aggroSubMidrange => StyleType.controlSubAggro,
      StyleType.aggroSubHybrid => StyleType.controlSubHybrid,
      StyleType.controlSubAggro => StyleType.midrangeSubControl,
      StyleType.controlSubMidrange => StyleType.midrangeSubAggro,
      StyleType.controlSubHybrid => StyleType.midrangeSubAggro,
      StyleType.midrangeSubControl => StyleType.aggroSubMidrange,
      StyleType.midrangeSubAggro => StyleType.aggroControl,
      StyleType.midrangeSubHybrid => StyleType.aggroSubHybrid,
      StyleType.aggroControl => StyleType.controlMidrange,
      StyleType.controlMidrange => StyleType.midrangeAggro,
      StyleType.midrangeAggro => StyleType.aggroControl,
      StyleType.center => null,
    };
  }
}
