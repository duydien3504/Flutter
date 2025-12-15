import 'package:flutter/material.dart';
import 'Utils.dart';
import 'view/StudentView.dart';
import 'view/StudentDetailView.dart';

void main() {
  runApp(MaterialApp(
    navigatorKey: Utils.navigatorKey,
    title: 'Quản Lý Sinh Viên',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => StudentView(),
      '/studentDetail': (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return StudentDetailView();
      }
    },
  ));
}