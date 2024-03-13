part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent {
  const BottomNavigationEvent();
}

class AppStarted extends BottomNavigationEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTapped extends BottomNavigationEvent {
  final int index;

  PageTapped({required this.index});

  @override
  String toString() => 'PageTapped: $index';
}
