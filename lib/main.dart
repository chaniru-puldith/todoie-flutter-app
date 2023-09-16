import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoie/models/task_data.dart';
import 'package:todoie/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const TaskScreen(),
      ),
    );
  }
}
