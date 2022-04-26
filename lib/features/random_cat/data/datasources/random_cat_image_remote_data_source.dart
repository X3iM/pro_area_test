import 'dart:typed_data';
import 'package:proarea_test/features/random_cat/data/datasources/random_cat_image_api.dart';
import '../../../../app.dart';

abstract class RandomCatImageRemoteDataSource {
  Future<Uint8List?> getRandomCatImage();
}

class RandomCatImageDataRemoteSourceImpl implements RandomCatImageRemoteDataSource {
  final RandomCatImageApiClient client;

  RandomCatImageDataRemoteSourceImpl({required this.client});

  @override
  Future<Uint8List?> getRandomCatImage() async {
    Uint8List? data = await client.getRandomCatImage();
    if (data != null) {
      return data;
    } else {
      throw ServerException();
    }
  }

}