import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Near Me',
      theme: ThemeData.light(),
      initialRoute: Routes.loadingScreen,
      routes: Routes.getRoutes(),
    );
  }
}
