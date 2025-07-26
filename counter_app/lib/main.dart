import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_model.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/favorite_screen.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const List<String> names = ['Alice', 'Bob', 'Charlie', 'Dave', 'Eve'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(title: 'Flutter Demo Home Page'),
        routes: {
          '/first': (context) => const FirstScreen(),
          '/second': (context) => const SecondScreen(),
          '/favorites': (context) => const FavoriteScreen(),
        },
      ),
    );

  }
}
