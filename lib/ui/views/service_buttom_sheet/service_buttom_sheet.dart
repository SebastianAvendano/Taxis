import 'package:AeroTaxi/core/providers/service_provider.dart';
import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/data/models/service_model/service_model.dart';
import 'package:AeroTaxi/ui/views/service_buttom_sheet/service_buttom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/ui/widgets/header_bottom_sheet.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/ui/widgets/button.dart';

final injector = GetIt.instance;

class ServiceBottomSheet extends StatefulWidget {
  const ServiceBottomSheet({super.key});

  @override
  State<ServiceBottomSheet> createState() => _ServiceBottomSheetState();
}

class _ServiceBottomSheetState extends State<ServiceBottomSheet> {
  final _controller = injector.get<ServiceBottomSheetController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ServiceProvider>(
        builder: (context, serviceProvider, child) {
          final ServiceModel selectedTask = serviceProvider.selectedService;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheet(title: ""),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  children: [
                    _buildContent(selectedTask),
                    Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                      return ButtonWidget(
                        margin: const EdgeInsets.only(bottom: 30),
                        label: userProvider.user.id == selectedTask.client!.id!
                            ? "Eliminar"
                            : "Confirmar carrera",
                        backgroundColor: ColorsAppTheme.orangeColor,
                        spacing: const SizedBox(width: 20),
                        onTap: () =>
                            userProvider.user.id == selectedTask.client!.id
                                ? _controller.deleteService(context)
                                : _controller.confirmService(context),
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(ServiceModel selectedTask) {
    final formatCurrency =
        NumberFormat.currency(locale: 'es_CO', symbol: 'COP');
    final formattedValue = formatCurrency.format(selectedTask.value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formattedValue,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildSpacing(),
        _buildTextRich(
            key: "Cliente:", value: selectedTask.client!.displayName!),
        _buildSpacing(),
        if (selectedTask.driver!.id!.isNotEmpty) ...[
          _buildTextRich(
              key: "Conductor:", value: selectedTask.driver!.displayName!),
          _buildSpacing(),
        ],
        _buildTextRich(key: "Origen:", value: selectedTask.origin!),
        _buildSpacing(),
        _buildTextRich(key: "Destino:", value: selectedTask.destination!),
        const SizedBox(height: 30)
      ],
    );
  }

  SizedBox _buildSpacing() => const SizedBox(height: 10);

  RichText _buildTextRich({
    required String key,
    required String value,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: key,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
