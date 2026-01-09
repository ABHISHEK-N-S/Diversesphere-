import 'package:diversesphere/core/app_router.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/add_task_bloc.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/home_bloc.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/todo_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// DATA
import 'package:diversesphere/features/todo/data/datasource/todo_remote_datasource.dart';
import 'package:diversesphere/features/todo/data/repository/todo_repository_impl.dart';

// DOMAIN
import 'package:diversesphere/features/todo/domain/usecases/add_todo.dart';
import 'package:diversesphere/features/todo/domain/usecases/get_all_todos.dart';
import 'package:diversesphere/features/todo/domain/usecases/get_todo_detail.dart';

// PRESENTATION


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Datasource
    final todoDatasource = TodoRemoteDatasource();

    // 🔹 Repository
    final todoRepository = TodoRepositoryImpl(todoDatasource);

    // 🔹 UseCases
    final getAllTodos = GetAllTodos(todoRepository);
    final addTodo = AddTodo(todoRepository);
    final getTodoDetail = GetTodoDetail(todoRepository);

    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (_) => HomeBloc(getAllTodos)),
    BlocProvider(create: (_) => AddTaskBloc(addTodo)),
    BlocProvider(create: (_) => TodoDetailBloc(getTodoDetail)),
        
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerate,
        initialRoute: AppRouter.letsStart,
      ),
    );
  }
}
