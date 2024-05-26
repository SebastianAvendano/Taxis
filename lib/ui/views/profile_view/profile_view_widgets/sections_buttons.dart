import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/views/profile_view/profile_controller.dart';
import 'package:task/ui/widgets/section_widget.dart';

final injector = GetIt.instance;

class SectionButtons extends StatelessWidget {
  const SectionButtons({super.key});

  static final _controller = injector.get<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      child: _buildItems(context),
    );
  }

  Widget _buildItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildRow(
          name: "Centro de ayuda",
          icon: MaterialCommunityIcons.help_circle_outline,
          onTap: () {},
        ),
        _buildRow(
          name: "Whatsapp",
          icon: MaterialCommunityIcons.whatsapp,
          onTap: () => _controller.launchSupport(),
        ),
        _buildRow(
          name: "Cerrar sesión",
          icon: MaterialCommunityIcons.logout_variant,
          onTap: () => _controller.logout(context),
        ),
      ],
    );
  }

  Widget _buildRow({
    required String name,
    required IconData icon,
    required VoidCallback onTap,
  }) =>
      ListTile(
        leading: Icon(icon),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: _buildLabel(name),
        onTap: onTap,
      );

  Widget _buildLabel(String label) => Text(label);
}
