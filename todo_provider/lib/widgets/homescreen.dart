import 'package:flutter/material.dart';
import 'package:todo_provider/tabs/all_tasks.dart';
import 'package:todo_provider/tabs/complete_tasks.dart';
import 'package:todo_provider/tabs/incomplete_tasks.dart';
import 'package:todo_provider/widgets/add_task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen(),
                  ));
            },
          )
        ],
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Completed',
            ),
            Tab(
              text: 'Incomplete',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          AllTasksTab(),
          CompletedTasksTab(),
          IncompleteTasksTab(),
        ],
        controller: controller,
      ),
    );
  }
}
