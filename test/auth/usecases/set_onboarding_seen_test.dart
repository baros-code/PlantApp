// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/auth/domain/usecases/set_onboarding_seen.dart';

import '../../helper.dart';

void main() {
  late SetOnboardingSeen setOnboardingSeen;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    setOnboardingSeen = SetOnboardingSeen(mockAuthRepository);
  });

  test('SetOnboardingSeen should return success when successful', () async {
    // Arrange
    final mockResult = Result<Object, Failure>.success();
    when(
      () => mockAuthRepository.setOnboardingSeen(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await setOnboardingSeen();

    // Assert
    expect(result, mockResult);
    verify(() => mockAuthRepository.setOnboardingSeen()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('SetOnboardingSeen should return failure when it fails', () async {
    // Arrange
    final mockResult = Result<Object, Failure>.failure(
      const Failure(message: 'test'),
    );
    when(
      () => mockAuthRepository.setOnboardingSeen(),
    ).thenAnswer((_) async => mockResult);

    // Act
    final result = await setOnboardingSeen();

    // Assert
    expect(result, mockResult);
    verify(() => mockAuthRepository.setOnboardingSeen()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
