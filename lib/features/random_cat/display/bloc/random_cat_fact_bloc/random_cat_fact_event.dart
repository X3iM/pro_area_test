import 'package:proarea_test/app.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RandomCatFactEvent extends CatEvent {}
class GetLocalRandomCatFactsEvent extends CatEvent {}

class SaveRandomCatFactEvent extends CatEvent {
  final RandomCatFact factToSave;

  SaveRandomCatFactEvent(this.factToSave) : super();

  @override
  List<Object> get props => [factToSave];
}