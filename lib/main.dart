import 'package:flutter/material.dart';
import 'package:india_today/utils/router.dart';
import 'package:india_today/widgets/app_bar.dart';
import 'package:india_today/widgets/bottom_navigation.dart';
import 'package:india_today/widgets/my_scaffold.dart';

import 'screens/panchang/panchang_screen.dart';
import 'screens/talk_to_astro/astro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> pages = ['/', 'talk_to_astro'];

class _MyAppState extends State<MyApp> {
  AppRouter router = AppRouter();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
