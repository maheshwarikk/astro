import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  final void Function(int) itemSelected;
  const BottomNavigator({
    Key? key,
    required this.itemSelected,
  }) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(color: Colors.orange, size: 25),
      unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 25),
      selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.orange),
      unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.orange),
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          this.index = index;
        });
        // _navigateToScreens(index);
      },
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "Talk to Astrologer",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_outlined),
          label: "Ask Question",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy),
          label: "Reports",
        ),
      ],
    );
  }

  _navigateToScreens(index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/talk_to_astro');
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
}
