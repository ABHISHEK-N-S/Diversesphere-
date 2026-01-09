
import 'package:diversesphere/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.start_date,
    required super.end_date,
    required super.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      start_date: DateTime.parse(json['start_date']),
      end_date: DateTime.parse(json['end_date']),
      isCompleted: json['is_completed'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'start_date': start_date.toIso8601String(),
        'end_date': end_date.toIso8601String(),
        'is_completed': isCompleted,
      };  
}
