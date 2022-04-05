import 'package:base_project/services/call_service.dart';
import 'package:base_project/services/locator.dart';
import 'package:base_project/services/navigator_service.dart';
import 'package:base_project/ui/pages/pages.dart';
import 'package:base_project/util/app_router.dart';
import 'package:base_project/util/config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  // getIt.registerSingleton<CallService>(CallService(), signalsReady: true);
  var api = const Config(child: MyApp());
  api.setMode(1);
  //set debug
  api.isDebug(true);

  runApp(api);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Project',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.routes,
      // home: const SplashPage(),
    );
  }
}
