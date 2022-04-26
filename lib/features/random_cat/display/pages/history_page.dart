import 'package:intl/intl.dart';
import 'package:proarea_test/features/random_cat/domain/entities/saved_random_cat_fact.dart';

import '../../../../app.dart';
import '../widgets/error_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<RandomCatFactBloc>(context).add(GetLocalRandomCatFactsEvent());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your history facts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<RandomCatFactBloc, RandomCatFactState>(
          builder: (context, state) {
            if (state is LocalRandomCatFactSuccessState) {
              return ListView.builder(
                itemBuilder: (context, index) => _listItem(size, state.catFact[index]),
                shrinkWrap: true,
                itemCount: state.catFact.length,
              );
            } else if (state is RandomCatFactErrorState) {
              return ExceptionWidget(text: 'Cache error', width: size.width, height: size.height,);
            } else {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _listItem(Size size, SavedRandomCatFact fact) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.width * .02)),
      margin: EdgeInsets.symmetric(horizontal: size.width * .02, vertical: size.height * .01),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .02, vertical: size.height * .01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * .6,
              child: Text(fact.text ?? ''),
            ),
            Spacer(),
            Text(DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(fact.savedTime!))),
          ],
        ),
      ),
    );
  }

}
