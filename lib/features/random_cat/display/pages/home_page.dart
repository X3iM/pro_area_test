import 'package:dio/dio.dart';
import '../../../../app.dart';
import '../../data/datasources/random_cat_fact_local_data_source.dart';
import '../../data/datasources/random_cat_image_api.dart';
import '../../data/datasources/random_cat_image_remote_data_source.dart';
import '../../data/repositories/random_cat_image_repository_impl.dart';
import '../../domain/usecases/get_random_cat_image.dart';
import '../bloc/random_cat_image_bloc/random_cat_image_bloc.dart';
import '../bloc/random_cat_image_bloc/random_cat_image_event.dart';
import '../bloc/random_cat_image_bloc/random_cat_image_state.dart';
import '../widgets/error_widget.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                BlocBuilder<RandomCatImageBloc, RandomCatImageState>(
                    builder: (context, state) {
                      // print(state.toString());
                      // if (state is RandomCatImageSuccessState) {
                        return Image(image: NetworkImage('https://cataas.com/cat'),
                          width: size.width,
                          height: size.height * .5,
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.noRepeat,
                        );
                        // return Image.memory(
                        //   state.data,
                        //   width: size.width,
                        //   height: size.height * .5,
                        //   fit: BoxFit.fill,
                        // );
                      // } else if (state is RandomCatImageErrorState) {
                      //   return ExceptionWidget(width: size.width, height: size.height * .5, text: 'Server error');
                      // } else {
                      //   return _buildShimmerLoadingImage(size);
                      // }
                    }
                ),
                SizedBox(height: size.height * .02),
                BlocBuilder<RandomCatFactBloc, RandomCatFactState>(
                    builder: (context, state) {
                      // print(state.toString());
                      if (state is RandomCatFactSuccessState) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                          child: Text(
                            state.catFact.text ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      } else if (state is RandomCatFactErrorState) {
                        return ExceptionWidget(width: size.width, height: size.height * .1, text: 'Server error');
                      } else {
                        return _buildShimmerLoadingText(size);
                      }
                    }
                ),
              ],
            ),
          ),
          Positioned.fill(
              bottom: MediaQuery.of(context).padding.bottom,
              left: size.width * .04,
              child: Builder(
                  builder: (context) {
                    return Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<RandomCatFactBloc>(context, listen: false).add(RandomCatFactEvent());
                          BlocProvider.of<RandomCatImageBloc>(context, listen: false).add(RandomCatImageEvent());
                        },
                        child: Text('Another fact'),
                      ),
                    );
                  }
              )
          ),
          Positioned.fill(
              bottom: MediaQuery.of(context).padding.bottom,
              right: size.width * .04,
              child: Builder(
                builder: (context) {
                  return Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryPage(),));
                      },
                      child: Text('Fact history'),
                    ),
                  );
                }
              )
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoadingImage(Size size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white70,
      child: Container(
        width: size.width,
        height: size.height * .5,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
      ),
    );
  }

  Widget _buildShimmerLoadingText(Size size) {
    return Column(
      children: [
        SizedBox(height: size.height * .02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white70,
            child: Container(
              width: size.width,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(size.width * .02),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white70,
            child: Container(
              width: size.width,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(size.width * .02),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white70,
            child: Container(
              width: size.width,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(size.width * .02),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(
        child: Text(
          'Server error. Something went wrong',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

}
