import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  const TaskTitle({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required Null Function(bool? checkBoxState) checkBoxCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.purpleAccent,
          onChanged: (bool? value) {},
        ));
  }
}
