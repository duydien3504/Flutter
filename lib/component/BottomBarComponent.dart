import 'package:flutter/material.dart';
import '../Utils.dart';

class BottomBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: Utils.itemBarIndex,
      onTap: (value) {
        Utils.itemBarIndex = value;
        if (value == 0) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cá nhân',
        ),
      ],
    );
  }
}