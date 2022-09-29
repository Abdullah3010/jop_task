import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  int index = 0;
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      if (event is ChangeSupMenuItem) {
        index = event.index;
        emit(ChangeSupMenuItemState(index: event.index));
      }
    });
  }
}
