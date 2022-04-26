import 'package:proarea_test/app.dart';

import '../../../domain/entities/saved_random_cat_fact.dart';

abstract class RandomCatFactState extends Equatable {
  @override
  List<Object> get props => [];
}

class RandomCatFactInitialState extends RandomCatFactState {}

class RandomCatFactLoadState extends RandomCatFactState {}

class RandomCatFactErrorState extends RandomCatFactState {}

class RandomCatFactSuccessState extends RandomCatFactState {
  final RandomCatFact catFact;

  RandomCatFactSuccessState({required this.catFact});

  @override
  List<Object> get props => [catFact];
}

class LocalRandomCatFactSuccessState extends RandomCatFactState {
  final List<SavedRandomCatFact> catFact;

  LocalRandomCatFactSuccessState({required this.catFact});

  @override
  List<Object> get props => [catFact];
}
