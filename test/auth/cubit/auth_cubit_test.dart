// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/auth/domain/usecases/get_onboarding_seen.dart';
import 'package:plant_app/features/auth/domain/usecases/set_onboarding_seen.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';

class _MockGetOnboardingSeen extends Mock implements GetOnboardingSeen {}

class _MockSetOnboardingSeen extends Mock implements SetOnboardingSeen {}

void main() {
  late _MockGetOnboardingSeen mockGetOnboardingSeen;
  late _MockSetOnboardingSeen mockSetOnboardingSeen;
  late AuthCubit authCubit;

  setUp(() {
    mockGetOnboardingSeen = _MockGetOnboardingSeen();
    mockSetOnboardingSeen = _MockSetOnboardingSeen();
    authCubit = AuthCubit(mockGetOnboardingSeen, mockSetOnboardingSeen);
  });

  tearDown(() {
    authCubit.close();
  });

  test('initial state is AuthInitial', () {
    expect(authCubit.state, isA<AuthInitial>());
    expect(authCubit.isOnboardingSeen, isFalse);
  });

  test(
    'checkOnboardingSeen emits AuthOnboardingSeen when repo returns true',
    () async {
      when(
        () => mockGetOnboardingSeen(),
      ).thenAnswer((_) async => Result<bool, Failure>.success(value: true));

      expectLater(authCubit.stream, emits(isA<AuthOnboardingSeen>()));

      await authCubit.checkOnboardingSeen();

      expect(authCubit.isOnboardingSeen, isTrue);
      expect(authCubit.state, isA<AuthOnboardingSeen>());
      verify(() => mockGetOnboardingSeen()).called(1);
      verifyNoMoreInteractions(mockGetOnboardingSeen);
    },
  );

  test(
    'checkOnboardingSeen emits AuthOnboardingNotSeen when repo returns false',
    () async {
      when(
        () => mockGetOnboardingSeen(),
      ).thenAnswer((_) async => Result<bool, Failure>.success(value: false));

      expectLater(authCubit.stream, emits(isA<AuthOnboardingNotSeen>()));

      await authCubit.checkOnboardingSeen();

      expect(authCubit.isOnboardingSeen, isFalse);
      expect(authCubit.state, isA<AuthOnboardingNotSeen>());
      verify(() => mockGetOnboardingSeen()).called(1);
      verifyNoMoreInteractions(mockGetOnboardingSeen);
    },
  );

  test(
    'checkOnboardingSeen emits AuthOnboardingNotSeen when repo catches exception',
    () async {
      when(() => mockGetOnboardingSeen()).thenAnswer(
        (_) async =>
            Result<bool, Failure>.failure(const Failure(message: 'error')),
      );

      expectLater(authCubit.stream, emits(isA<AuthOnboardingNotSeen>()));

      await authCubit.checkOnboardingSeen();

      expect(authCubit.isOnboardingSeen, isFalse);
      expect(authCubit.state, isA<AuthOnboardingNotSeen>());
      verify(() => mockGetOnboardingSeen()).called(1);
      verifyNoMoreInteractions(mockGetOnboardingSeen);
    },
  );
}
