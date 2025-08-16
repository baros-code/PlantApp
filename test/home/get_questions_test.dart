// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions.dart';

import '../helper.dart';

void main() {
  late GetQuestions getQuestions;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getQuestions = GetQuestions(mockHomeRepository);
  });

  test('GetQuestions should return questions when successful', () async {
    // Arrange
    const questions = <Question>[]; // using empty for simplicity
    final mockResult = Result<List<Question>, Failure>.success(
      value: questions,
    );

    when(
      () => mockHomeRepository.getQuestions(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getQuestions();

    // Assert
    expect(result, mockResult);
    verify(() => mockHomeRepository.getQuestions()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });

  test('GetQuestions should return failure when it fails', () async {
    // Arrange
    final mockResult = Result<List<Question>, Failure>.failure(
      const Failure(message: 'test'),
    );

    when(
      () => mockHomeRepository.getQuestions(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getQuestions();

    // Assert
    expect(result, mockResult);
    verify(() => mockHomeRepository.getQuestions()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
