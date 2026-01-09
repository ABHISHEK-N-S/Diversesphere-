// domain/entities/todo.dart
class Todo {
  final int id;
  final String title;
  final String description;
  final DateTime start_date;
  final DateTime end_date;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.start_date,
    required this.end_date,
    required this.isCompleted,
  });
}
