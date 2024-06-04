import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/data/models/profile_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:AeroTaxi/ui/views/home_view/home_controller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:provider/provider.dart';

final injector = GetIt.instance;

class ButtonCreateService extends StatelessWidget {
  const ButtonCreateService({
    super.key,
  });

  static final controller = injector.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final UserModel currentUser = userProvider.user;
        return currentUser.rol == "CLIENT"
            ? FloatingActionButton(
                onPressed: () => controller.onNewService(context),
                backgroundColor: ColorsAppTheme.primaryColor,
                child: Container(
                  height: 50,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: ColorsAppTheme.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    MaterialCommunityIcons.plus,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
