import '../../../../app.dart';

class ExceptionWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const ExceptionWidget({
    required this.width,
    required this.height,
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
