part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class ChangeSupMenuItemState extends TaskState {
  final int index;

  ChangeSupMenuItemState({
    required this.index,
  });
}
