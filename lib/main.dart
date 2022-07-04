import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ha_theme.dart';
import 'models/models.dart';
import 'screens/splash_screen.dart';
// TODO: Import app_router

void main() {
  runApp(
    const HomeAutomation(),
  );
}

class HomeAutomation extends StatefulWidget {
  const HomeAutomation({Key? key}) : super(key: key);

  @override
  _HomeAutomationState createState() => _HomeAutomationState();
}

class _HomeAutomationState extends State<HomeAutomation> {
  final _sensorManager = SensorManager();
  final _profileManager = ProfileManager();
  // TODO: Create AppStateManager
  // TODO: Define AppRouter

  // TODO: Initialize app router

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _sensorManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        // TODO: Add AppStateManager ChangeNotifierProvider
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = HATheme.dark();
          } else {
            theme = HATheme.light();
          }

          return MaterialApp(
            theme: theme,
            title: 'HomeAutomation',
            // TODO: Replace with Router widget
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
