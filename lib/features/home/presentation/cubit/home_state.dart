part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeQuestionsLoading extends HomeState {}

final class HomeQuestionsLoaded extends HomeState {
  const HomeQuestionsLoaded(this.questions);

  final List<Question> questions;
}

final class HomeQuestionsError extends HomeState {}

final class HomeCategoriesLoading extends HomeState {}

final class HomeCategoriesLoaded extends HomeState {
  const HomeCategoriesLoaded(this.categories);

  final List<Category> categories;
}

final class HomeCategoriesError extends HomeState {}
