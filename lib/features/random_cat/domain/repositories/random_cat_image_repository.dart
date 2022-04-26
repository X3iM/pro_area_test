import 'dart:typed_data';
import 'package:proarea_test/app.dart';

abstract class RandomCatImageRepository {
  Future<Either<Failure, Uint8List>> getRandomCatImage();
}