part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HotDogState extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<HomeModelTopics> topics;

  HomeSuccess({required this.topics});
}

final class HomeError extends HomeState {
  HomeError(this.exception);
  final dynamic exception;
}
