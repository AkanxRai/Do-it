import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/Dashboard/dashboard.dart';
import 'package:to_do/theme/themes.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox<dynamic>('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: DarkMode,
      home: const Dashboard(),
    );
  }
}
