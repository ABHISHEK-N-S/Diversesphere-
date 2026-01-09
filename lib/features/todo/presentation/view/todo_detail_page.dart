import 'package:diversesphere/features/todo/presentation/view_model/bloc/todo_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetailPage extends StatelessWidget {
  final int todoId;
  const TodoDetailPage({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    context.read<TodoDetailBloc>().add(LoadTodoDetail(todoId));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade50,
              Colors.blue.shade50,
              Colors.yellow.shade50,
              Colors.pink.shade50,
            ],
            stops: const [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const TodoDetailAppBar(),
              Expanded(
                child: BlocBuilder<TodoDetailBloc, TodoDetailState>(
                  builder: (context, state) {
                    if (state is TodoDetailLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF6C3FF5),
                        ),
                      );
                    }
                    if (state is TodoDetailLoaded) {
                      return TodoDetailContent(todo: state.todo);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoDetailAppBar extends StatelessWidget {
  const TodoDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Todo Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class TodoDetailContent extends StatelessWidget {
  final dynamic todo;
  const TodoDetailContent({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoCard(todo: todo),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final dynamic todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoCardHeader(title: todo.title),
          const SizedBox(height: 12),
          TodoCardDescription(description: todo.description),
          const SizedBox(height: 16),
          const TodoCardFooter(time: "10:00 AM"),
        ],
      ),
    );
  }
}

class TodoCardHeader extends StatelessWidget {
  final String title;
  const TodoCardHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.work_outline,
            color: Colors.pink.shade300,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class TodoCardDescription extends StatelessWidget {
  final String description;
  const TodoCardDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade600,
        height: 1.5,
      ),
    );
  }
}

class TodoCardFooter extends StatelessWidget {
  final String time;
  const TodoCardFooter({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 16,
              color: Colors.purple.shade300,
            ),
            const SizedBox(width: 6),
            Text(
              time,
              style: TextStyle(
                fontSize: 13,
                color: Colors.purple.shade300,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 13,
              color: Colors.purple.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}