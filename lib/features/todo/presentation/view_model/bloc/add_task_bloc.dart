import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/todo_model.dart';
import '../../../domain/usecases/add_todo.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';
class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final AddTodo addTodo;

  AddTaskBloc(this.addTodo) : super(const AddTaskState()) {
    on<TitleChanged>(
      (e, emit) => emit(state.copyWith(title: e.title)),
    );

    on<DescriptionChanged>(
      (e, emit) => emit(state.copyWith(description: e.description)),
    );

    on<StartDateChanged>(
      (e, emit) => emit(state.copyWith(startDate: e.date)),
    );

    on<EndDateChanged>(
      (e, emit) => emit(state.copyWith(endDate: e.date)),
    );

    on<SubmitTask>((event, emit) async {
      emit(state.copyWith(loading: true, error: null));

      try {
        await addTodo(
          TodoModel(
            id: 0,
            title: state.title,
            description: state.description,
            start_date: state.startDate ?? DateTime.now(),
            end_date: state.endDate ?? DateTime.now(),
            isCompleted: false,
          ),
        );

emit(const AddTaskState(isSuccess: true));       } catch (e) {
        emit(state.copyWith(
          loading: false,
          error: e.toString(),
        ));
      }
    });
  }
}
