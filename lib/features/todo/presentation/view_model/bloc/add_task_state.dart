part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool loading;
  final String? error;
   final bool isSuccess;

  const AddTaskState({
    this.title = '',
    this.description = '',
    this.startDate,
    this.endDate,
    this.loading = false,
    this.isSuccess = false,
    this.error,
  });

  AddTaskState copyWith({
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
      bool? isSuccess,
    bool? loading,
    String? error,
  }) {
    return AddTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      loading: loading ?? this.loading,
            isSuccess: isSuccess ?? this.isSuccess,

      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, startDate, endDate, loading, error,isSuccess];
}
