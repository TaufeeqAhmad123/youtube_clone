import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/theme_provider.dart';
import 'package:flutter_application_1/screen/splash.dart';

import 'package:flutter_application_1/utils/theme/theme_data.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Youtube Clone',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme
      ,
      home: const SplashScreen(),
    );
  }
}

