import 'package:flutter/material.dart';
import 'package:todo/screens/recycle_bin.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/task_bloc.dart';
import '../model/task.dart';
import 'tabs_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return SafeArea(
          child: Drawer(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: Text(
                  'Task Drawer',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(TapsScreen.id),
                    child: ListTile(
                      leading: const Icon(Icons.folder_special),
                      title: const Text('My Tasks'),
                      trailing: Text("${state.pendingTasks.length} | ${state.completedTasks.length}"),
                    ),
                  );
                },
              ),
              const Divider(),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text("${state.removedTasks.length}"),
                ),
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                      value: state.switchValue,
                      onChanged: (newValue) {
                        newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      });
                },
              )
            ],
          )),
        );
      },
    );
  }
}
