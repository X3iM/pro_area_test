import 'package:proarea_test/features/random_cat/data/models/random_cat_fact_model.dart';

import '../../../../app.dart';
import '../../domain/entities/saved_random_cat_fact.dart';

const String randomCatFactLocalBoxName = '';

abstract class RandomCatFactLocalDataSource {
  List<SavedRandomCatFact> getLocalCatFacts();
  Future<void> saveCatFact(RandomCatFact catFact);
}

class RandomCatFactLocalDataSourceImpl implements RandomCatFactLocalDataSource {
  late final Box<Map<dynamic, dynamic>> _box;


  RandomCatFactLocalDataSourceImpl() {
    Hive.openBox<Map<dynamic, dynamic>>(randomCatFactLocalBoxName).then((value) {
      _box = value;
      getLocalCatFacts();
    });
  }

  @override
  List<SavedRandomCatFact> getLocalCatFacts()  {
    try {
      List<SavedRandomCatFact> data = [];
      for (var element in _box.values) {
        data.add(SavedRandomCatFact(
            text: element['text'], savedTime: element['saveTime']));
      }

      return data;
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> saveCatFact(RandomCatFact catFact) async {
    try {
      final time = DateTime.now().millisecondsSinceEpoch;
      await _box.add(
        {
          'text': catFact.text,
          'saveTime': time,
        },
      );
    } on Exception {
      throw CacheException();
    }
  }



}