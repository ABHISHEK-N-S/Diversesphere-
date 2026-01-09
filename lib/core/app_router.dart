import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/todo/presentation/view/add_task_page.dart';
import '../features/todo/presentation/view/home_page.dart';
import '../features/todo/presentation/view/lets_start_page.dart';
import '../features/todo/presentation/view/todo_detail_page.dart';

import '../features/todo/presentation/view_model/bloc/home_bloc.dart';

class AppRouter {
  static const letsStart = '/';
  static const home = '/home';
  static const addTask = '/add-task';
  static const detail = '/detail';

  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case letsStart:
        return MaterialPageRoute(
          builder: (_) => const LetsStartPage(),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) {
            context.read<HomeBloc>().add(LoadTodos());
            return const HomePage();
          },
        );

      case addTask:
        return MaterialPageRoute(
          builder: (_) => AddTaskPage(), 
        );

      case detail:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TodoDetailPage(todoId: id),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LetsStartPage(),
        );
    }
  }
}
