import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';

part 'add_agents_provider.freezed.dart';
part 'add_agents_provider.g.dart';

final _log = Logger('AddAgentsProvider');

@riverpod
class AddAgents extends _$AddAgents {
  @override
  AddAgentsForm build() {
    return AddAgentsForm();
  }

  void updateRosterName(String name) {
    state = state.copyWith(rosterName: NameInput.dirty(name));
  }

  void updateJsonFile(XFile? file) {
    state = state.copyWith(jsonFile: FileInput.dirty(file));
  }

  Future<void> submit() async {
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);
    if (state.isValid) {
      try {
        final agentsJson = await state.jsonFile.value!.readAsString();
        final agentsList = jsonDecode(agentsJson) as List<dynamic>;
        final agents = Agents(
          agentsList
              .map((e) => Agent.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        final name = await ref
            .read(agentsOverviewNotifierProvider.notifier)
            .addRoster(agents, state.rosterName.value);

        state = state.copyWith(
          rosterName: NameInput.dirty(name),
          status: FormzSubmissionStatus.success,
        );
      } on Exception catch (e) {
        _log.severe('Unknown Error', e);
        state = state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: const AddAgentsError.invalidJson(),
        );
      }
    } else {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        error: const AddAgentsError.invalidForm(),
      );
    }
  }
}

class AddAgentsForm extends Equatable with FormzMixin {
  AddAgentsForm({
    this.rosterName = const NameInput.pure(),
    this.jsonFile = const FileInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.error = const NoAddAgentsError(),
  });

  final NameInput rosterName;
  final FileInput jsonFile;
  final FormzSubmissionStatus status;
  final AddAgentsError error;

  AddAgentsForm copyWith({
    NameInput? rosterName,
    FileInput? jsonFile,
    FormzSubmissionStatus? status,
    AddAgentsError? error,
  }) {
    return AddAgentsForm(
      rosterName: rosterName ?? this.rosterName,
      jsonFile: jsonFile ?? this.jsonFile,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<FormzInput<Object?, Object?>> get inputs => [rosterName, jsonFile];

  @override
  List<Object?> get props => [rosterName, jsonFile, status, error];
}

@freezed
sealed class AddAgentsError with _$AddAgentsError {
  const factory AddAgentsError.none() = NoAddAgentsError;
  const factory AddAgentsError.invalidForm() = InvalidAddAgentsFormError;
  const factory AddAgentsError.invalidJson() = InvalidAgentsJsonError;
  const factory AddAgentsError.unknown({required Object error}) =
      UnknownAgentsError;
}
