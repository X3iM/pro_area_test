import 'package:proarea_test/app.dart';
import '../entities/saved_random_cat_fact.dart';

abstract class RandomCatFactRepository {
  Future<Either<Failure, RandomCatFact>> getRandomCatFact();

  Future<Either<Failure, List<SavedRandomCatFact>>> getLocalCatFacts();
  Future<void> saveCatFact(RandomCatFact catFact);
}