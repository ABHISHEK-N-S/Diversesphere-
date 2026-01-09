import 'package:diversesphere/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<Todo> getTodoDetail(int id);
  Future<void> addTodo(Todo todo);
}
