
import 'package:diversesphere/features/todo/domain/entities/todo.dart';
import 'package:diversesphere/features/todo/domain/repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository repo;
  AddTodo(this.repo);
  Future<void> call(Todo todo) => repo.addTodo(todo);
}
