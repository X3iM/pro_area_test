import 'package:proarea_test/app.dart';
import 'package:proarea_test/features/random_cat/domain/entities/saved_random_cat_fact.dart';

import '../datasources/random_cat_fact_local_data_source.dart';

class RandomCatFactRepositoryImpl implements RandomCatFactRepository {
  final RandomCatFactRemoteDataSource remoteDataSource;
  final RandomCatFactLocalDataSource localDataSource;


  RandomCatFactRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, RandomCatFact>> getRandomCatFact() async {
    try {
      RandomCatFact? fact = await remoteDataSource.getRandomCatFact();
      return Right(fact!);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is server exception'));
    }
  }

  @override
  Future<Either<Failure, List<SavedRandomCatFact>>> getLocalCatFacts() async {
    try {
      List<SavedRandomCatFact> data = localDataSource.getLocalCatFacts();
      return Right(data);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'This is cache exception'));
    }
  }

  @override
  Future<void> saveCatFact(RandomCatFact catFact) async {
    try {
      await localDataSource.saveCatFact(catFact);
    } on CacheException {}
  }

}