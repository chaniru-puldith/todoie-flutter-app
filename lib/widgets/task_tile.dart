import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final VoidCallback longPressCallBack;

  const TaskTitle({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallBack,
    required this.longPressCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.purpleAccent,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
