
import 'package:diversesphere/features/todo/domain/entities/todo.dart';
import 'package:diversesphere/features/todo/domain/repositories/todo_repository.dart';

class GetTodoDetail {
  final TodoRepository repo;
  GetTodoDetail(this.repo);
  Future<Todo> call(int id) => repo.getTodoDetail(id);
}
