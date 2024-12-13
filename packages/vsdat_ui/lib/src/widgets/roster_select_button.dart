import 'package:flutter/material.dart';

typedef RosterChangeCallback = void Function(String rosterName);

class RosterSelectButton extends StatefulWidget {
  const RosterSelectButton({
    required this.rosterNames,
    required this.selectedRoster,
    required this.onChange,
    super.key,
  });

  final List<String> rosterNames;
  final String selectedRoster;
  final RosterChangeCallback onChange;

  @override
  State<RosterSelectButton> createState() => _RosterSelectButtonState();
}

class _RosterSelectButtonState extends State<RosterSelectButton> {
  final FocusNode _buttonFocusNode = FocusNode(
    debugLabel: 'Roster Select Button',
  );

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren:
          widget.rosterNames.map((roster) {
            return MenuItemButton(
              onPressed: () {
                if (roster == widget.selectedRoster) {
                  return;
                }
                widget.onChange(roster);
              },
              child: switch (widget.selectedRoster) {
                final selected when selected == roster => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(roster),
                    const SizedBox(width: 4),
                    const Icon(Icons.check),
                  ],
                ),
                _ => Text(roster),
              },
            );
          }).toList(),
      builder: (context, controller, child) {
        return FilledButton.icon(
          icon: Icon(
            controller.isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          ),
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          label: Text(widget.selectedRoster),
        );
      },
    );
  }
}
