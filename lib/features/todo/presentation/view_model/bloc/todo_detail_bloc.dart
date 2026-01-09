import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/get_todo_detail.dart';

part 'todo_detail_event.dart';
part 'todo_detail_state.dart';

class TodoDetailBloc extends Bloc<TodoDetailEvent, TodoDetailState> {
  final GetTodoDetail getTodoDetail;

  TodoDetailBloc(this.getTodoDetail) : super(TodoDetailInitial()) {
    on<LoadTodoDetail>((event, emit) async {
      emit(TodoDetailLoading());
      try {
        final todo = await getTodoDetail(event.id);
        emit(TodoDetailLoaded(todo));
      } catch (e) {
        emit(TodoDetailError(e.toString()));
      }
    });
  }
}
