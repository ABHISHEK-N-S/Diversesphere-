
import 'package:diversesphere/features/todo/domain/entities/todo.dart';
import 'package:diversesphere/features/todo/domain/repositories/todo_repository.dart';

class GetAllTodos {
  final TodoRepository repo;
  GetAllTodos(this.repo);
  Future<List<Todo>> call() => repo.getAllTodos();
}
