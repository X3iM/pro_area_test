import 'package:proarea_test/features/random_cat/data/models/random_cat_fact_model.dart';

import '../../../../app.dart';

abstract class RandomCatFactRemoteDataSource {
  Future<RandomCatFact?> getRandomCatFact();
}

class RandomCatFactRemoteDataSourceImpl implements RandomCatFactRemoteDataSource {
  final RandomCatFactApiClient client;

  RandomCatFactRemoteDataSourceImpl({required this.client});

  @override
  Future<RandomCatFact?> getRandomCatFact() async {
    try {
      RandomCatFactModel? model = await client.getRandomCatFact();
      if (model != null) {
        return model;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

}