part of '../task_bloc.dart';

@immutable
class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemovedTask extends TaskEvent {
  final Task task;

  RemovedTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class MarkFavoritOrUnfavoriteTask extends TaskEvent {
  final Task task;

  MarkFavoritOrUnfavoriteTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class EditTask extends TaskEvent {
  final Task oldTask;
  final Task newTask;

  EditTask({required this.oldTask, required this.newTask});

  @override
  List<Object?> get props => [
        oldTask,
        newTask,
      ];
}

class RestoreTask extends TaskEvent {
  final Task task;

  RestoreTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteAllTasks extends TaskEvent {}
