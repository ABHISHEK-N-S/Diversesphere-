part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Todo> todos;
  HomeLoaded(this.todos);

  @override
  List<Object?> get props => [todos];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
