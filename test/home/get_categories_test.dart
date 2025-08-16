// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/home/domain/entities/category_response.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories.dart';
import 'package:plant_app/features/home/domain/entities/pagination.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';

import '../helper.dart';

void main() {
  late GetCategories getCategories;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCategories = GetCategories(mockHomeRepository);
  });

  test('GetCategories should return data when successful', () async {
    // Arrange
    final response = CategoryResponse(
      data: const <Category>[],
      meta: const Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0),
    );
    final mockResult = Result<CategoryResponse, Failure>.success(
      value: response,
    );

    when(
      () => mockHomeRepository.getCategories(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getCategories();

    // Assert
    expect(result, mockResult);
    verify(() => mockHomeRepository.getCategories()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });

  test('GetCategories should return failure when it fails', () async {
    // Arrange
    final mockResult = Result<CategoryResponse, Failure>.failure(
      const Failure(message: 'test'),
    );

    when(
      () => mockHomeRepository.getCategories(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getCategories();

    // Assert
    expect(result, mockResult);
    verify(() => mockHomeRepository.getCategories()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
