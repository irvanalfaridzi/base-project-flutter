import 'package:base_project/services/locator.dart';
import 'package:base_project/services/navigator_service.dart';
import 'package:base_project/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:base_project/ui/pages/home/bloc/home_bloc.dart';
import 'package:base_project/ui/pages/pages.dart';
import 'package:base_project/util/app_router.dart';
import 'package:base_project/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  var api = const Config(child: MyApp());

  // set mode dev = 1, prod = 0
  api.setMode(1);

  // set debug
  api.isDebug(true);

  runApp(api);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base Project Flutter',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.routes,
        routes: {
          DetailJobPage.routes: (context) => const DetailJobPage(),
        },
      ),
    );
  }
}
