import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_provider/widgets/homescreen.dart';
import 'package:todo_provider/providers/todos_model.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        title: 'Todos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
