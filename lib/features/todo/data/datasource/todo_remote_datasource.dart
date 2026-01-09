import 'package:diversesphere/core/supa_Service.dart';
import 'package:diversesphere/features/todo/data/models/todo_model.dart';
class TodoRemoteDatasource {
  final _client = SupabaseService.client;

  Future<List<TodoModel>> getAllTodos() async {
    final res = await _client.from('todos').select();
    return (res as List).map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<TodoModel> getTodoDetail(int id) async {
    final res =
        await _client.from('todos').select().eq('id', id).single();
    return TodoModel.fromJson(res);
  }

  Future<void> addTodo(TodoModel todo) async {
    await _client.from('todos').insert(todo.toJson()).select();
  }
}

