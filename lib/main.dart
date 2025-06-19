import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nawel_application/Features/splash/presentation/views/splash_screen.dart';
import 'package:nawel_application/core/routing/app_router.dart';
import 'package:nawel_application/core/routing/app_routes.dart';
import 'package:nawel_application/core/di/injection.dart';
import 'package:nawel_application/core/di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
