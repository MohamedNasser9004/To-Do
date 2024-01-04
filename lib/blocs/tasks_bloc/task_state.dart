part of '../task_bloc.dart';

@immutable
class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;

  const TaskState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object?> get props =>
      [pendingTasks, completedTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      "pendingTasks": pendingTasks.map((x) => x.toMap()).toList(),
      "completedTasks": completedTasks.map((x) => x.toMap()).toList(),
      "favoriteTasks": favoriteTasks.map((x) => x.toMap()).toList(),
      "removedTasks": removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> json) {
    return TaskState(
      pendingTasks:
          List<Task>.from(json["pendingTasks"]?.map((x) => Task.fromMap(x))),
      completedTasks:
          List<Task>.from(json["completedTasks"]?.map((x) => Task.fromMap(x))),
      favoriteTasks:
          List<Task>.from(json["favoriteTasks"]?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(json["removedTasks"]?.map((x) => Task.fromMap(x))),
    );
  }
}
