import 'package:flutter/material.dart';

class TaskTitle extends StatefulWidget {
  const TaskTitle({super.key});

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  bool isChecked = false;

  void checkboxCallBack(bool? newValue) {
    setState(() {
      isChecked = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'task1',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallBack,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final void Function(bool?) toggleCheckboxState;

  const TaskCheckBox({
    super.key,
    required this.checkboxState,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.purpleAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
