import '../../../../app.dart';
import '../entities/saved_random_cat_fact.dart';

class RandomCatFactUseCase {
  final RandomCatFactRepository repository;
  RandomCatFactUseCase({required this.repository});

  Future<Either<Failure, RandomCatFact>> getRandomCatFact() async => await repository.getRandomCatFact();

  Future<Either<Failure, List<SavedRandomCatFact>>> getLocalCatFacts() async => await repository.getLocalCatFacts();

  Future<void> saveCatFact(RandomCatFact catFact) async => await repository.saveCatFact(catFact);

}
