import 'package:flutter/material.dart';
import 'package:todoie/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoie/models/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        title: const Text('Please Confirm'),
                        content: Text(
                          'Are you sure to remove \'${currentTask.name}\' Task?',
                        ),
                        actions: [
                          // The "Yes" button
                          TextButton(
                            onPressed: () {
                              // Remove the box
                              setState(() {
                                taskData.deleteTask(currentTask);
                              });

                              // Close the dialog
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Close the dialog
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'))
                        ],
                      );
                    });
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
