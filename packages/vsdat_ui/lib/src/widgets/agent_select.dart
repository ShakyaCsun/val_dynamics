import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

enum AgentStatus {
  normal,
  core,
  exclude;

  AgentStatus get next {
    switch (this) {
      case AgentStatus.core:
        return AgentStatus.exclude;
      case AgentStatus.normal:
        return AgentStatus.core;
      case AgentStatus.exclude:
        return AgentStatus.normal;
    }
  }
}

class AgentSelect extends StatefulWidget {
  const AgentSelect({
    required this.agent,
    required this.status,
    this.onTap,
    super.key,
  });

  final Agent agent;
  final AgentStatus status;
  final void Function()? onTap;

  @override
  State<AgentSelect> createState() => _AgentSelectState();
}

class _AgentSelectState extends State<AgentSelect> {
  bool isHovered = false;

  Color stateColor(
    Color defaultValue, {
    Color? normal,
    Color? core,
    Color? excluded,
    Color? normalHovered,
    Color? coreHovered,
    Color? excludedHovered,
  }) {
    return switch ((widget.status, isHovered)) {
          (AgentStatus.normal, false) => normal,
          (AgentStatus.normal, true) => normalHovered,
          (AgentStatus.core, false) => core,
          (AgentStatus.core, true) => coreHovered,
          (AgentStatus.exclude, false) => excluded,
          (AgentStatus.exclude, true) => excludedHovered,
        } ??
        defaultValue;
  }

  static const normalColor = Color(0xFF656265);
  static const coreColor = Color(0xFF24FBC5);
  static const excludedColor = Color(0xFFFF4655);
  static const hoveredBorder = Color(0xFFF2CB71);
  static const alphaValue = 100;

  Widget? get statusIndicator {
    const indicatorAlphaValue = 180;
    return switch (widget.status) {
      AgentStatus.normal => null,
      AgentStatus.core => Positioned.fill(
        child: FractionallySizedBox(
          heightFactor: 0.3,
          widthFactor: 0.3,
          alignment: Alignment.topLeft,
          child: ColoredBox(
            color: normalColor.withAlpha(indicatorAlphaValue),
            child: const Center(
              child: FittedBox(child: Icon(Icons.check, color: coreColor)),
            ),
          ),
        ),
      ),
      AgentStatus.exclude => Positioned.fill(
        child: FractionallySizedBox(
          heightFactor: 0.3,
          widthFactor: 0.3,
          alignment: Alignment.topLeft,
          child: ColoredBox(
            color: normalColor.withAlpha(indicatorAlphaValue),
            child: const Center(
              child: FittedBox(child: Icon(Icons.close, color: excludedColor)),
            ),
          ),
        ),
      ),
    };
  }

  static const Duration borderAnimationDuration = Durations.short1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: borderAnimationDuration,
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: stateColor(
            hoveredBorder,
            normal: normalColor,
            core: coreColor,
            excluded: excludedColor,
          ),
          width: isHovered ? 4 : 2,
        ),
      ),
      margin: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedContainer(
            duration: borderAnimationDuration,
            decoration: BoxDecoration(
              border: BoxBorder.all(width: isHovered ? 2 : 4),
              color: stateColor(
                normalColor.withAlpha(alphaValue),
                core: coreColor.withAlpha(alphaValue),
                excluded: excludedColor.withAlpha(alphaValue),
                normalHovered: coreColor.withAlpha(alphaValue),
                coreHovered: excludedColor.withAlpha(alphaValue),
                excludedHovered: normalColor.withAlpha(alphaValue),
              ),
            ),
            child: ClipRect(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedScale(
                      scale: isHovered ? 1.1 : 1,
                      duration: Durations.short2,
                      child: AgentPortrait(agent: widget.agent),
                    ),
                  ),
                  ?statusIndicator,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
