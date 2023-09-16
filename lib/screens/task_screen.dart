import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoie/models/task_data.dart';
import 'package:todoie/screens/add_task_screen.dart';
import 'package:todoie/widgets/tasks_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.purpleAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                clipBehavior: Clip.antiAlias, // or hardEdge must
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTaskScreen(),
                  ),
                ),
              );
            },
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Todoie',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${taskData.isEmpty ? 'No' : taskData.taskCount} ${taskData.taskCount == 1 ? 'Task' : 'Tasks'}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: const TasksList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
