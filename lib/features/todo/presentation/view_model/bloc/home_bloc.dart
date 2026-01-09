import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/get_all_todos.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllTodos getAllTodos;

  HomeBloc(this.getAllTodos) : super(HomeInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(HomeLoading());
      try {
        final todos = await getAllTodos();
        emit(HomeLoaded(todos));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
