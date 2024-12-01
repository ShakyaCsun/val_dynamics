import 'package:cross_file/cross_file.dart';
import 'package:formz/formz.dart';

enum FileInputError { empty }

class FileInput extends FormzInput<XFile?, FileInputError> {
  const FileInput.pure() : super.pure(null);
  const FileInput.dirty(super.value) : super.dirty();

  @override
  FileInputError? validator(XFile? value) {
    return switch (value) {
      null => FileInputError.empty,
      _ => null,
    };
  }
}
