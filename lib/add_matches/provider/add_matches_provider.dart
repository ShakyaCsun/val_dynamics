import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/matches_overview/matches_overview.dart';

part 'add_matches_provider.freezed.dart';
part 'add_matches_provider.g.dart';

final _log = Logger('AddMatchesProvider');

@riverpod
class AddMatches extends _$AddMatches {
  @override
  AddMatchesForm build() {
    return AddMatchesForm();
  }

  void updateCollectionName(String name) {
    state = state.copyWith(collectionName: NameInput.dirty(name));
  }

  void updateCsvFile(XFile? file) {
    state = state.copyWith(csvFile: FileInput.dirty(file));
  }

  Future<void> submit() async {
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);
    if (state.isValid) {
      try {
        final matchesCsv = await state.csvFile.value!.readAsString();
        final matches = ValorantMatches.rawMatchesFrom(
          // Fix for Waylay bug in RiB
          csv: matchesCsv.replaceAll('Waylay\n', 'Waylay'),
        );
        final defaultRosterName = ref.read(defaultRosterNameProvider);
        final addedName = ref
            .read(matchesCollectionListProvider.notifier)
            .addCollection(
              MatchesCollection(
                collectionName: state.collectionName.value,
                rawMatches: matches,
                rosterName: defaultRosterName,
              ),
            );

        state = state.copyWith(
          collectionName: NameInput.dirty(addedName),
          status: FormzSubmissionStatus.success,
        );
      } on ParserException catch (e) {
        _log.severe('ParserException', e);
        state = state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: AddMatchesError.invalidCsv(message: e.message),
        );
      } on Exception catch (e) {
        _log.severe('Unknown Error', e);
        state = state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: AddMatchesError.unknown(error: e),
        );
      }
    } else {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        error: const AddMatchesError.invalidForm(),
      );
    }
    _resetErrors();
  }

  void _resetErrors() {
    state = state.copyWith(
      status: FormzSubmissionStatus.initial,
      error: const AddMatchesError.none(),
    );
  }
}

class AddMatchesForm extends Equatable with FormzMixin {
  AddMatchesForm({
    this.collectionName = const NameInput.pure(),
    this.csvFile = const FileInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.error = const NoAddMatchesError(),
  });

  final NameInput collectionName;
  final FileInput csvFile;
  final FormzSubmissionStatus status;
  final AddMatchesError error;

  AddMatchesForm copyWith({
    NameInput? collectionName,
    FileInput? csvFile,
    FormzSubmissionStatus? status,
    AddMatchesError? error,
  }) {
    return AddMatchesForm(
      collectionName: collectionName ?? this.collectionName,
      csvFile: csvFile ?? this.csvFile,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<FormzInput<Object?, Object?>> get inputs => [collectionName, csvFile];

  @override
  List<Object?> get props => [collectionName, csvFile, status, error];
}

@freezed
sealed class AddMatchesError with _$AddMatchesError {
  const factory AddMatchesError.none() = NoAddMatchesError;
  const factory AddMatchesError.invalidForm() = InvalidAddMatchesFormError;
  const factory AddMatchesError.invalidCsv({required String message}) =
      InvalidMatchesCsvError;
  const factory AddMatchesError.unknown({required Object error}) =
      UnknownMatchesError;
}
