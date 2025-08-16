// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:plant_app/features/home/domain/entities/category_response.dart';
import 'package:plant_app/features/home/domain/entities/pagination.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions.dart';
import 'package:plant_app/features/home/presentation/cubit/home_cubit.dart';

class _MockGetQuestions extends Mock implements GetQuestions {}

class _MockGetCategories extends Mock implements GetCategories {}

void main() {
  late _MockGetQuestions mockGetQuestions;
  late _MockGetCategories mockGetCategories;
  late HomeCubit homeCubit;

  setUp(() {
    mockGetQuestions = _MockGetQuestions();
    mockGetCategories = _MockGetCategories();
    homeCubit = HomeCubit(mockGetQuestions, mockGetCategories);
  });

  tearDown(() {
    homeCubit.close();
  });

  test('initial state is HomeInitial', () {
    expect(homeCubit.state, isA<HomeInitial>());
    expect(homeCubit.questionsCache, isEmpty);
    expect(homeCubit.categoriesCache, isEmpty);
  });

  group('getQuestions', () {
    test('emits loading then loaded on success and updates cache', () async {
      when(
        () => mockGetQuestions(),
      ).thenAnswer((_) async => Result.success(value: const <Question>[]));

      expectLater(
        homeCubit.stream,
        emitsInOrder([isA<HomeQuestionsLoading>(), isA<HomeQuestionsLoaded>()]),
      );

      await homeCubit.getQuestions();

      expect(homeCubit.questionsCache, isA<List<Question>>());
      verify(() => mockGetQuestions()).called(1);
      verifyNoMoreInteractions(mockGetQuestions);
    });

    test('emits loading then error on failure', () async {
      when(() => mockGetQuestions()).thenAnswer(
        (_) async => Result<List<Question>, Failure>.failure(
          const Failure(message: 'error'),
        ),
      );

      expectLater(
        homeCubit.stream,
        emitsInOrder([isA<HomeQuestionsLoading>(), isA<HomeQuestionsError>()]),
      );

      await homeCubit.getQuestions();
      verify(() => mockGetQuestions()).called(1);
      verifyNoMoreInteractions(mockGetQuestions);
    });
  });

  group('getCategories', () {
    test('emits loading then loaded on success and updates cache', () async {
      final response = CategoryResponse(
        data: const <Category>[],
        meta: const Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0),
      );
      when(
        () => mockGetCategories(),
      ).thenAnswer((_) async => Result.success(value: response));

      expectLater(
        homeCubit.stream,
        emitsInOrder([
          isA<HomeCategoriesLoading>(),
          isA<HomeCategoriesLoaded>(),
        ]),
      );

      await homeCubit.getCategories();

      expect(homeCubit.categoriesCache, isA<List<Category>>());
      verify(() => mockGetCategories()).called(1);
      verifyNoMoreInteractions(mockGetCategories);
    });

    test('emits loading then error on failure', () async {
      when(() => mockGetCategories()).thenAnswer(
        (_) async => Result<CategoryResponse, Failure>.failure(
          const Failure(message: 'error'),
        ),
      );

      expectLater(
        homeCubit.stream,
        emitsInOrder([
          isA<HomeCategoriesLoading>(),
          isA<HomeCategoriesError>(),
        ]),
      );

      await homeCubit.getCategories();
      verify(() => mockGetCategories()).called(1);
      verifyNoMoreInteractions(mockGetCategories);
    });
  });
}
