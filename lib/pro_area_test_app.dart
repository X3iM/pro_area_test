import 'package:dio/dio.dart';

import 'app.dart';
import 'features/random_cat/data/datasources/random_cat_fact_local_data_source.dart';
import 'features/random_cat/data/datasources/random_cat_image_api.dart';
import 'features/random_cat/data/datasources/random_cat_image_remote_data_source.dart';
import 'features/random_cat/data/repositories/random_cat_image_repository_impl.dart';
import 'features/random_cat/display/bloc/random_cat_image_bloc/random_cat_image_bloc.dart';
import 'features/random_cat/display/bloc/random_cat_image_bloc/random_cat_image_event.dart';
import 'features/random_cat/domain/usecases/get_random_cat_image.dart';

class ProAreaTestApp extends StatelessWidget {
  const ProAreaTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RandomCatFactBloc(
            randomCatFactUseCase: RandomCatFactUseCase(repository: RandomCatFactRepositoryImpl(
                remoteDataSource: RandomCatFactRemoteDataSourceImpl(
                  client: RandomCatFactApiClient(Dio(),),
                ),
                localDataSource: RandomCatFactLocalDataSourceImpl()
            ),),
          )..add(RandomCatFactEvent()),
        ),
        BlocProvider(
          create: (context) => RandomCatImageBloc(
            getRandomCatImage: GetRandomCatImage(repository: RandomCatImageRepositoryImpl(
              remoteDataSource: RandomCatImageDataRemoteSourceImpl(
                client: RandomCatImageApiClient(Dio(),),
              ),
            ),),
          )..add(RandomCatImageEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'ProArea Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}