part of 'todo_detail_bloc.dart';

abstract class TodoDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoDetailInitial extends TodoDetailState {}

class TodoDetailLoading extends TodoDetailState {}

class TodoDetailLoaded extends TodoDetailState {
  final Todo todo;
  TodoDetailLoaded(this.todo);
}

class TodoDetailError extends TodoDetailState {
  final String message;
  TodoDetailError(this.message);
}
