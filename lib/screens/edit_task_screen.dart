import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc.dart';
import '../model/task.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key, required this.oldTask});
  final Task? oldTask;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: oldTask?.title);
    TextEditingController descriptionController = TextEditingController(text: oldTask?.description);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Edit Task', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editedTask = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: oldTask!.id,
                      isDone: false,
                      isDelete: oldTask?.isDelete,
                      date: DateTime.now().toString(),
                    );
                    context.read<TaskBloc>().add(EditTask(newTask: editedTask, oldTask: oldTask!));
                    Navigator.pop(context);
                  },
                  child: Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
