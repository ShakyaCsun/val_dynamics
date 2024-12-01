import 'package:formz/formz.dart';

enum NameInputError { empty }

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty(super.value) : super.dirty();

  @override
  NameInputError? validator(String value) {
    return value.trim().isEmpty ? NameInputError.empty : null;
  }
}
