import 'package:flutter/material.dart';
import 'package:todoie/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoie/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.tasks[index];
            return TaskTitle(
              isChecked: currentTask.isDone,
              taskTitle: currentTask.name,
              checkboxCallBack: (checkboxState) {
                taskData.updateTask(currentTask);
              },
              longPressCallBack: () {
                taskData.deleteTask(currentTask);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
