import 'dart:typed_data';
import 'package:proarea_test/app.dart';
import '../../domain/repositories/random_cat_image_repository.dart';
import '../datasources/random_cat_image_remote_data_source.dart';

class RandomCatImageRepositoryImpl implements RandomCatImageRepository {
  final RandomCatImageRemoteDataSource remoteDataSource;

  RandomCatImageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Uint8List>> getRandomCatImage() async {
    try {
      Uint8List? data = await remoteDataSource.getRandomCatImage();
      return Right(data!);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is server exception'));
    }
  }

}