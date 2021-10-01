import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/model/task_data.dart';
import 'package:provider/provider.dart';

class ListTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallBack: (checkBoxState) {
                  taskData.updataTask(task);
                },
                longPressCallBack: () {
                  taskData.deleteTask(task);
                });
          },
          itemCount: taskData.itemCount,
        );
      },
    );
  }
}
