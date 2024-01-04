import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/task_bloc.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widgets/tasks_list.dart';


class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});


  static const id = 'tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Chip(
                  label: Text("${taskList.length} Tasks"),
                ),
              ),
            ),
            TasksList(taskList: taskList),
          ],
        );
      },
    );
  }
}
