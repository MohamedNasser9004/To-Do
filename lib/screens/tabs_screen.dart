import 'package:flutter/material.dart';
import 'package:todo/screens/completed_task_screen.dart';
import 'package:todo/screens/favorite_task_screen.dart';
import 'package:todo/screens/my_drawer.dart';
import 'package:todo/screens/pending_task_screen.dart';

import 'add_task_screen.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key});

  static const id = 'tabs_screen';

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  final List<Map<String, dynamic>> _pageDetalis = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'}
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTaskScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetalis[_selectedPageIndex]['title']),
        actions: [
          IconButton(onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetalis[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: 'Pending Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: 'Completed Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
          ]),
    );
  }
}
