part of 'todo_detail_bloc.dart';

abstract class TodoDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTodoDetail extends TodoDetailEvent {
  final int id;
  LoadTodoDetail(this.id);
}
