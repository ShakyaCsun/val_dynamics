import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:vsdat/add_matches/add_matches.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AddMatchesPage extends StatelessWidget {
  const AddMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.addMatches)),
      body: const AddMatchesView(),
    );
  }
}

class AddMatchesView extends StatelessWidget {
  const AddMatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WidthConstrainedBox(
        child: Card(
          child: ResponsivePadding(
            child: Column(
              spacing: 8,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return CollectionNameFormField(
                      onChanged: (value) {
                        ref
                            .read(addMatchesProvider.notifier)
                            .updateCollectionName(value);
                      },
                      nameError: ref.watch(
                        addMatchesProvider.select(
                          (value) => value.collectionName.displayError,
                        ),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ImportCsvButton(
                      onFilePicked: (file) {
                        ref
                            .read(addMatchesProvider.notifier)
                            .updateCsvFile(file);
                      },
                      inputFile: ref.watch(
                        addMatchesProvider.select((value) => value.csvFile),
                      ),
                    );
                  },
                ),
                const AddMatchesButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddMatchesButton extends ConsumerWidget {
  const AddMatchesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    ref.listen(addMatchesProvider, (previous, next) {
      if (next.status.isSuccess) {
        context
          ..showSnackbar(
            SnackBar(
              content: Text(
                l10n.matchesAdded(
                  next.csvFile.value?.name ?? '',
                  next.collectionName.value,
                ),
              ),
            ),
          )
          ..pop();
      }
      if (next.status.isFailure) {
        switch (next.error) {
          case NoAddMatchesError():
            return;
          case InvalidAddMatchesFormError():
            context.showSnackbar(SnackBar(content: Text(l10n.invalidForm)));
          case InvalidMatchesCsvError(:final message):
            context.showSnackbar(
              SnackBar(
                content: Text('${l10n.invalidMatchesCsvError}\n$message'),
              ),
            );
          case UnknownMatchesError():
            context.showSnackbar(SnackBar(content: Text(l10n.unknownError)));
        }
      }
    });
    final isValid = ref.watch(
      addMatchesProvider.select((value) => value.isValid),
    );
    final isInProgress = ref.watch(
      addMatchesProvider.select((value) => value.status.isInProgress),
    );
    return isInProgress
        ? const CircularProgressIndicator()
        : ElevatedButton(
          onPressed:
              isValid
                  ? () {
                    ref.read(addMatchesProvider.notifier).submit();
                  }
                  : null,
          child: Text(l10n.addMatches),
        );
  }
}
