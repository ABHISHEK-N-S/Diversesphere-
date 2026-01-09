import 'package:diversesphere/core/app_router.dart';
import 'package:diversesphere/features/todo/presentation/view/widgets/header.dart';
import 'package:diversesphere/features/todo/presentation/view/widgets/task_card.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6C5CE7),
        onPressed: () => Navigator.pushNamed(context, AppRouter.addTask),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSection(todoCount: state.todos.length),
                    const SizedBox(height: 24),

                    Text(
                      "Task To do",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),

                    Expanded(
                      child: state.todos.isEmpty
                          ? const Center(child: Text("No tasks yet"))
                          : ListView.separated(
                              itemCount: state.todos.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (_, i) {
                                final todo = state.todos[i];
                                return TaskCard(
                                  title: todo.title,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRouter.detail,
                                    arguments: todo.id,
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
