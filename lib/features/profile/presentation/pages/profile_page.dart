import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/profile/presentation/controllers/profile_controller.dart';

class ProfilePage extends ControlledView<ProfileController, Object> {
  ProfilePage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _ProfileSubView());
  }
}

class _ProfileSubView extends SubView<ProfileController> {
  _ProfileSubView();

  @override
  Widget buildView(BuildContext context, ProfileController controller) {
    return const Center(child: Text('Profile'));
  }
}
