import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proarea_test/features/random_cat/display/bloc/random_cat_image_bloc/random_cat_image_event.dart';
import 'package:proarea_test/features/random_cat/display/bloc/random_cat_image_bloc/random_cat_image_state.dart';
import '../../../domain/usecases/get_random_cat_image.dart';

class RandomCatImageBloc extends Bloc<CatEvent, RandomCatImageState> {
  final GetRandomCatImage getRandomCatImage;

  RandomCatImageBloc({required this.getRandomCatImage}) : super(RandomCatImageInitialState()) {
    on<RandomCatImageEvent>(_mapGetRandomFactEventToState);
  }

  void _mapGetRandomFactEventToState(RandomCatImageEvent event, Emitter<RandomCatImageState> emit) async {
    emit(RandomCatImageLoadState());
    final randomFact = await getRandomCatImage();
    randomFact.fold((failure) {
      emit(RandomCatImageErrorState());
    }, (data) {
      emit(RandomCatImageSuccessState(data: data));
    });
  }

}