import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              height: 100,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Daily Panchangs'),
            onTap: () {
              Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Talk to Astro'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/talk-to-astro');
            },
          ),
        ],
      ),
    );
  }
}
