import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_controller.dart';
import 'package:AeroTaxi/ui/widgets/section_widget.dart';

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
          name: "Faqs",
          icon: MaterialCommunityIcons.alert_box_outline,
          onTap: () => context.router.push(const FaqsRoute()),
        ),
        _buildRow(
          name: "Documentos legales",
          icon: MaterialCommunityIcons.file_document_multiple_outline,
          onTap: () => context.router.push(const LegalDocumentRoute()),
        ),
        _buildRow(
          name: "Quiero ser taxista",
          icon: Icons.car_crash_outlined,
          onTap: () => _controller.handleRedirectSurvey(),
        ),
        _buildRow(
          name: "Linea de atención",
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
        leading: Icon(
          icon,
          color: ColorsAppTheme.blueColor,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: ColorsAppTheme.blueColor,
        ),
        title: _buildLabel(name),
        onTap: onTap,
      );

  Widget _buildLabel(String label) => Text(
        label,
        style: const TextStyle(
          color: ColorsAppTheme.blueColor,
        ),
      );
}
