import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/task.dart';
import 'package:todo/screens/edit_task_screen.dart';

import '../blocs/task_bloc.dart';
import 'popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTasks(BuildContext context, Task task) {
    task.isDelete!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemovedTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: EditTaskScreen(oldTask: task)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_border_outlined)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Text(
                        DateFormat()
                            .add_yMMMMd()
                            .add_Hms()
                            .format(DateTime.parse(task.date)),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: task.isDone,
                        onChanged: task.isDelete == false
                            ? (value) {
                                context
                                    .read<TaskBloc>()
                                    .add(UpdateTask(task: task));
                              }
                            : null),
                    PopupMenu(
                      task: task,
                      cancelOrDeleteCallback: () =>
                          _removeOrDeleteTasks(context, task),
                      likeOrUnlikeCallback: () => context.read<TaskBloc>().add(
                            MarkFavoritOrUnfavoriteTask(task: task),
                          ),
                      editTaskCallBack: () {
                        Navigator.of(context).pop();
                        _editTask(context);
                      },
                      restoreTaskCallBack: () =>
                          context.read<TaskBloc>().add(RestoreTask(task: task)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ListTile(
// title: Text(
// task.title,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// decoration: task.isDone! ? TextDecoration.lineThrough : null),
// ),
// trailing: Checkbox(
// value: task.isDone, // Use the actual value of task.isDone
// // tristate: false,
// onChanged: task.isDelete == false
// ? (value) {
// context.read<TaskBloc>().add(UpdateTask(task: task));
// }
//     : null),
// onLongPress: () => _removeOrDeleteTasks(context, task),
// );
