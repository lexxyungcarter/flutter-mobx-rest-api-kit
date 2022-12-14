import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app_router.dart';
import 'di/locator.dart';
import 'ui/error_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  // api getters
  // now hide splash screen
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MobX Todo App',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.light,
      routes: appRoutes,
      onGenerateRoute: (settings) => onGenerateAppRoute(settings),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ErrorScreen(),
      ),
    );
  }
}
