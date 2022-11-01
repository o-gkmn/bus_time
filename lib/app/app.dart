import 'package:bus_time/route/router.dart';
import 'package:bus_time/theme.dart/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: splashRoute,
    );
  }
}
