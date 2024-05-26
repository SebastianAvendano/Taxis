import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:task/ui/views/login_view/login_controller.dart';
import 'package:task/ui/views/login_view/login_view_widgets/sliders.dart';
import 'package:task/ui/widgets/activity_indicator%20copy.dart';
import 'package:task/ui/widgets/button.dart';

final injector = GetIt.instance;

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _controller = injector.get<LoginController>();

  @override
  void initState() {
    super.initState();
    _controller.init(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Sliders(),
          _buildButton(context),
        ],
      ),
    );
  }

  Padding _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 70,
      ),
      child: ValueListenableBuilder(
        valueListenable: _controller.isLoading,
        builder: (context, isLoading, _) => isLoading
            ? const ActivityIndicator()
            : ButtonWidget(
                label: "Ingresar con Google",
                leading: const Icon(
                  FontAwesome5Brands.google,
                  color: Colors.white,
                ),
                spacing: const SizedBox(width: 30),
                onTap: () => _controller.login(context),
              ),
      ),
    );
  }
}
