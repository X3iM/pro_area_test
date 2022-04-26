import 'dart:typed_data';
import '../../../../app.dart';
import '../repositories/random_cat_image_repository.dart';

class GetRandomCatImage {
  final RandomCatImageRepository repository;

  GetRandomCatImage({required this.repository});

  Future<Either<Failure, Uint8List>> call() async => await repository.getRandomCatImage();

}