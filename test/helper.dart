// ignore_for_file: prefer-match-file-name

import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/utils/logger.dart';
import 'package:plant_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockHomeRepository extends Mock implements HomeRepository {}

class MockLogger extends Mock implements Logger {}
