import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/task_bloc.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widgets/task_tile.dart';
import '../blocs/bloc_exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.taskList}) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.description),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );

    // Expanded(
    //   child: ListView.builder(
    //     itemCount: taskList.length,
    //     itemBuilder: (context, index) {
    //       var task = taskList[index];
    //       return TaskTile(task: task);
    //     },
    //   ),
    // );
  }
}
