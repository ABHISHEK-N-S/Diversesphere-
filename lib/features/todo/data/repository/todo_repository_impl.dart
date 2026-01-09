
import 'package:diversesphere/features/todo/data/datasource/todo_remote_datasource.dart';
import 'package:diversesphere/features/todo/data/models/todo_model.dart';
import 'package:diversesphere/features/todo/domain/entities/todo.dart';
import 'package:diversesphere/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  Future<void> addTodo(Todo todo) =>
      datasource.addTodo(todo as TodoModel);

  @override
  Future<List<Todo>> getAllTodos() =>
      datasource.getAllTodos();

  @override
  Future<Todo> getTodoDetail(int id) =>
      datasource.getTodoDetail(id);
}
