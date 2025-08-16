import 'package:equatable/equatable.dart';
import 'package:plant_app/features/auth/domain/usecases/get_onboarding_seen.dart';
import 'package:plant_app/features/auth/domain/usecases/set_onboarding_seen.dart';

import '../../../../core/presentation/safe_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit(this._getOnboardingSeen, this._setOnboardingSeen)
    : super(AuthInitial());

  final GetOnboardingSeen _getOnboardingSeen;
  final SetOnboardingSeen _setOnboardingSeen;

  bool isOnboardingSeen = false;

  Future<void> checkOnboardingSeen() async {
    final result = await _getOnboardingSeen();
    if (result.isSuccessful) {
      if (result.value == true) {
        isOnboardingSeen = true;
        emit(AuthOnboardingSeen());
        return;
      }
    }
    isOnboardingSeen = false;
    emit(AuthOnboardingNotSeen());
  }

  Future<void> setOnboardingSeen() => _setOnboardingSeen();
}
