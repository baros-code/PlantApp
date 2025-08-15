import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/presentation/controller.dart';

class PaywallController extends Controller<Object> {
  PaywallController(super.logger, super.popupManager);

  late final AuthCubit _authCubit;

  @override
  void onStart() {
    super.onStart();
    _authCubit = context.read<AuthCubit>();
  }

  void setOnboardingSeen() {
    _authCubit.setOnboardingSeen();
  }
}
