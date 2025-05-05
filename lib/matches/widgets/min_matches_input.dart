import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/matches/provider/matches_provider.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MinMatchesInput extends StatelessWidget {
  const MinMatchesInput({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final minMatches = ref.watch(
          matchesFilterProvider(
            collectionId: collectionName,
          ).select((state) => state.minMatches),
        );
        return SliderTextInput(
          currentValue: minMatches,
          onChanged: (value) {
            ref
                .read(
                  matchesFilterProvider(collectionId: collectionName).notifier,
                )
                .changeMinMatches(value);
          },
          maxSliderValue: 100,
        );
      },
    );
  }
}
