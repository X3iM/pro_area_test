import 'app.dart';
import 'app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  BlocOverrides.runZoned(
    () => runApp(const ProAreaTestApp()),
    blocObserver: AppBlocObserver(),
  );
}
