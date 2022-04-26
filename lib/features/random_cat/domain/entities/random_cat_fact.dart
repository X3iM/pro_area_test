import 'package:proarea_test/app.dart';

class RandomCatFact extends Equatable {
  final String? id;
  final String? text;

  const RandomCatFact({
    this.id,
    this.text
  });

  @override
  List<Object?> get props => [id, text];
}