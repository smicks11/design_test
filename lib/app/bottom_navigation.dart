import 'package:design_test/modules/home/home.dart';
import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _children = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  List<Widget> get children => _children;

  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
