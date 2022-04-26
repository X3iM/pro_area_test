import 'dart:typed_data';
import 'package:proarea_test/app.dart';

abstract class RandomCatImageState extends Equatable {
  @override
  List<Object> get props => [];
}

class RandomCatImageInitialState extends RandomCatImageState {}

class RandomCatImageLoadState extends RandomCatImageState {}

class RandomCatImageErrorState extends RandomCatImageState {}

class RandomCatImageSuccessState extends RandomCatImageState {
  final Uint8List data;

  RandomCatImageSuccessState({required this.data});

  @override
  List<Object> get props => [data];
}
