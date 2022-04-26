import 'package:proarea_test/app.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RandomCatImageEvent extends CatEvent {}

// class RandomCatPhotoEvent extends RandomCatFactEvent {}