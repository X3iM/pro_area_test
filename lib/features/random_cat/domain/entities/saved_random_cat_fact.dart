import 'package:proarea_test/app.dart';

class SavedRandomCatFact extends Equatable {
  final String? text;
  final int? savedTime;

  const SavedRandomCatFact({
    this.text,
    this.savedTime,
  });

  @override
  List<Object?> get props => [text, savedTime];
}