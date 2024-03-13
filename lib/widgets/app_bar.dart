import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: MaterialButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        child: SizedBox(
          height: kToolbarHeight / 2,
          child: Image.asset('images/icons/hamburger.png'),
        ),
      ),
      title: SizedBox(
        height: kToolbarHeight / 1.5,
        child: Image.asset(
          'images/icons/logo.png',
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
            height: kToolbarHeight / 2,
            child: Image.asset('images/icons/profile.png'),
          ),
        ),
      ],
    );
  }
}
