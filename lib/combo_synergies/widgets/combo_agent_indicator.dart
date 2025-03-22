import 'package:flutter/material.dart';
import 'package:vsdat/combo_synergies/combo_synergies.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ComboAgentIndicator extends StatelessWidget {
  const ComboAgentIndicator({required this.comboData, super.key});

  final ComboData comboData;

  @override
  Widget build(BuildContext context) {
    const radius = 24.0;
    return Container(
      constraints: BoxConstraints.tight(const Size.fromRadius(radius)),
      decoration: BoxDecoration(
        color: comboData.synergyStat.comboWR.color,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          ClipRect(
            clipper: const LeftHalfClipper(),
            child: Transform.flip(
              flipX: true,
              child: AgentIndicator(
                agent: comboData.agentOne,
                radius: radius,
                color: Colors.transparent,
              ),
            ),
          ),
          ClipRect(
            clipper: const RightHalfClipper(),
            child: AgentIndicator(
              agent: comboData.agentTwo,
              radius: radius,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class RightHalfClipper extends CustomClipper<Rect> {
  const RightHalfClipper();

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return this != oldClipper;
  }
}

class LeftHalfClipper extends CustomClipper<Rect> {
  const LeftHalfClipper();

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return this != oldClipper;
  }
}
