// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/auth/domain/usecases/get_onboarding_seen.dart';

import '../../helper.dart';

void main() {
  late GetOnboardingSeen getOnboardingSeen;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    getOnboardingSeen = GetOnboardingSeen(mockAuthRepository);
  });

  test('GetOnboardingSeen should return value when successful', () async {
    // Arrange
    final mockResult = Result<bool, Failure>.success(value: true);
    when(
      () => mockAuthRepository.getOnboardingSeen(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getOnboardingSeen();

    // Assert
    expect(result, mockResult);
    verify(() => mockAuthRepository.getOnboardingSeen()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('GetOnboardingSeen should return failure when it fails', () async {
    // Arrange
    final mockResult = Result<bool, Failure>.failure(
      const Failure(message: 'test'),
    );
    when(
      () => mockAuthRepository.getOnboardingSeen(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await getOnboardingSeen();

    // Assert
    expect(result, mockResult);
    verify(() => mockAuthRepository.getOnboardingSeen()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
