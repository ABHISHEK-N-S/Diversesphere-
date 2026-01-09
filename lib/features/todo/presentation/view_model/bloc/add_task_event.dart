part of 'add_task_bloc.dart';

abstract class AddTaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TitleChanged extends AddTaskEvent {
  final String title;
  TitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class DescriptionChanged extends AddTaskEvent {
  final String description;
  DescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class StartDateChanged extends AddTaskEvent {
  final DateTime date;
  StartDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class EndDateChanged extends AddTaskEvent {
  final DateTime date;
  EndDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class SubmitTask extends AddTaskEvent {}
