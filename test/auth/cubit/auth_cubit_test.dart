// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';

import '../../helper.dart';

void main() {
  late MockGetOnboardingSeen mockGetOnboardingSeen;
  late MockSetOnboardingSeen mockSetOnboardingSeen;
  late AuthCubit authCubit;

  setUp(() {
    mockGetOnboardingSeen = MockGetOnboardingSeen();
    mockSetOnboardingSeen = MockSetOnboardingSeen();
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
    '''checkOnboardingSeen emits AuthOnboardingNotSeen when repo catches exception''',
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
