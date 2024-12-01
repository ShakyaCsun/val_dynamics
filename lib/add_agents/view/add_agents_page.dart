import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:vsdat/add_agents/add_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AddAgentsPage extends StatelessWidget {
  const AddAgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.addAgents),
      ),
      body: const AddAgentsView(),
    );
  }
}

class AddAgentsView extends StatelessWidget {
  const AddAgentsView({super.key});

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
                    return RosterNameFormField(
                      onChanged: (value) {
                        ref
                            .read(addAgentsProvider.notifier)
                            .updateRosterName(value);
                      },
                      nameError: ref.watch(
                        addAgentsProvider.select(
                          (value) => value.rosterName.displayError,
                        ),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ImportJsonButton(
                      onFilePicked: (file) {
                        ref
                            .read(addAgentsProvider.notifier)
                            .updateJsonFile(file);
                      },
                      inputFile: ref.watch(
                        addAgentsProvider.select(
                          (value) => value.jsonFile,
                        ),
                      ),
                    );
                  },
                ),
                OverflowBar(
                  spacing: getBreakpointOf(context).padding,
                  children: const [
                    CopyJsonButton(minimalJson: true),
                    CopyJsonButton(minimalJson: false),
                  ],
                ),
                const _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref
      ..listen(
        addAgentsProvider.select(
          (value) => value.error,
        ),
        (previous, next) {
          switch (next) {
            case NoAddAgentsError():
              return;
            case InvalidAddAgentsFormError():
              context.showSnackbar(
                const SnackBar(content: Text('Invalid Data')),
              );
            case InvalidAgentsJsonError():
              context.showSnackbar(
                SnackBar(content: Text(l10n.invalidAgentsFormat)),
              );
            case UnknownAgentsError():
              context.showSnackbar(
                const SnackBar(
                  content: Text('Unknown Error occurred'),
                ),
              );
          }
        },
      )
      ..listen(
        addAgentsProvider.select(
          (value) => value.status,
        ),
        (previous, next) {
          if (next.isSuccess) {
            final addedName = ref.read(
              addAgentsProvider.select(
                (value) => value.rosterName.value,
              ),
            );
            context
              ..pop()
              ..showSnackbar(
                SnackBar(
                  content: Text(l10n.agentsAdded(addedName)),
                ),
              );
          }
        },
      );
    final isValid = ref.watch(
      addAgentsProvider.select(
        (value) => value.isValid,
      ),
    );
    final isInProgress = ref.watch(
      addAgentsProvider.select(
        (value) => value.status.isInProgress,
      ),
    );
    if (isInProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ElevatedButton(
      onPressed: isValid
          ? () {
              ref.read(addAgentsProvider.notifier).submit();
            }
          : null,
      child: Text(l10n.addAgentRatings),
    );
  }
}
