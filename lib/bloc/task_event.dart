part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class ChangeSupMenuItem extends TaskEvent {
  final int index;

  ChangeSupMenuItem({
    required this.index,
  });
}
