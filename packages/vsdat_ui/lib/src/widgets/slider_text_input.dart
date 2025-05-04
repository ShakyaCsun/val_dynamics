import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template slider_text_input}
/// A Widget to input integer values using a linked Slider and a TextField.
///
/// The TextField is allowed to input values larger than that is allowed by the
/// Slider as configured with [maxSliderValue].
/// {@endtemplate}
class SliderTextInput extends StatefulWidget {
  /// {@macro slider_text_input}
  const SliderTextInput({
    required this.currentValue,
    required this.onChanged,
    this.maxSliderValue = 250,
    super.key,
  });

  final int currentValue;
  final int maxSliderValue;
  final void Function(int value) onChanged;

  @override
  State<SliderTextInput> createState() => _SliderTextInputState();
}

class _SliderTextInputState extends State<SliderTextInput> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController()..text = '${widget.currentValue}';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SliderTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentValue != widget.currentValue) {
      textController.text = '${widget.currentValue}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = widget.currentValue;
    final maxSliderValue = widget.maxSliderValue.toDouble();
    final sliderValue =
        currentValue > maxSliderValue
            ? maxSliderValue
            : currentValue.toDouble();
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: sliderValue,
            max: maxSliderValue,
            onChanged: (value) {
              widget.onChanged(value.toInt());
            },
          ),
        ),
        SizedBox(
          width: 48,
          child: TextFormField(
            controller: textController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onFieldSubmitted: (value) {
              final intValue = int.tryParse(value) ?? 0;
              widget.onChanged(intValue);
            },
          ),
        ),
      ],
    );
  }
}
