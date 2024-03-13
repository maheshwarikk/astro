import 'package:flutter/material.dart';
import 'package:india_today/widgets/app_bar.dart';
import 'package:india_today/widgets/bottom_navigation.dart';
import 'package:india_today/widgets/drawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  const MyScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: child,
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigator(
        itemSelected: (item) {},
      ),
    );
  }
}
