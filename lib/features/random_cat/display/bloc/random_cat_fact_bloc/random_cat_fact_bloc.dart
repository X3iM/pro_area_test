import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proarea_test/features/random_cat/display/bloc/random_cat_fact_bloc/random_cat_fact_event.dart';
import 'package:proarea_test/features/random_cat/display/bloc/random_cat_fact_bloc/random_cat_fact_state.dart';
import 'package:proarea_test/features/random_cat/domain/usecases/random_cat_fact_usecase.dart';

import '../../../domain/entities/random_cat_fact.dart';

class RandomCatFactBloc extends Bloc<CatEvent, RandomCatFactState> {
  final RandomCatFactUseCase randomCatFactUseCase;

  RandomCatFactBloc({required this.randomCatFactUseCase}) : super(RandomCatFactInitialState()) {
    on<RandomCatFactEvent>(_mapGetRandomFactEventToState);
    on<GetLocalRandomCatFactsEvent>(_mapGetLocalRandomFactsEventToState);
    // on<SaveRandomCatFactEvent>(_mapSaveRandomFactEventToState);
  }

  void _mapGetRandomFactEventToState(RandomCatFactEvent event, Emitter<RandomCatFactState> emit) async {
    emit(RandomCatFactLoadState());
    final randomFact = await randomCatFactUseCase.getRandomCatFact();
    randomFact.fold((failure) {
      emit(RandomCatFactErrorState());
    }, (randomFact) {
      emit(RandomCatFactSuccessState(catFact: randomFact));
      _mapSaveRandomFactEventToState(randomFact);
    });
  }

  void _mapGetLocalRandomFactsEventToState(GetLocalRandomCatFactsEvent event, Emitter<RandomCatFactState> emit) async {
    emit(RandomCatFactLoadState());
    final randomFact = await randomCatFactUseCase.getLocalCatFacts();
    randomFact.fold((failure) {
      emit(RandomCatFactErrorState());
    }, (randomFact) {
      emit(LocalRandomCatFactSuccessState(catFact: randomFact));
    });
  }

  void _mapSaveRandomFactEventToState(RandomCatFact factToSave) async {
    await randomCatFactUseCase.saveCatFact(factToSave);
  }

}
