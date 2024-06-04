import 'package:AeroTaxi/data/models/service_model/service_model.dart';
import 'package:AeroTaxi/ui/views/services_view/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/ui/widgets/card.dart';
import 'package:AeroTaxi/ui/widgets/empty_data_lottie_widget.dart';
import 'package:AeroTaxi/ui/widgets/loading_widget.dart';

final injector = GetIt.instance;

class StreamDataServices extends StatelessWidget {
  const StreamDataServices({super.key, required this.stream});

  final Stream<QuerySnapshot>? stream;
  static final controller = injector.get<ServicesController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }

        final List<QueryDocumentSnapshot?> listServices =
            snapshot.data?.docs ?? [];

        if (listServices.isNotEmpty) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: listServices.length,
              (context, index) {
                final ServiceModel task = ServiceModel.fromJson(
                    listServices[index]?.data()! as Map<String, dynamic>);
                return _buildCardTask(context, task);
              },
            ),
          );
        } else {
          return _buildEmpyData(context);
        }
      },
    );
  }

  Widget _buildCardTask(BuildContext context, ServiceModel service) {
    return CardWidget(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(15),
      backgroundColor: ColorsAppTheme.primaryColor.withOpacity(0.1),
      child: ListTile(
        title: Text(
          service.origin!,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        subtitle: _buildContent(service),
        onTap: () => controller.onSelectedTask(context, service),
      ),
    );
  }

  Widget _buildContent(ServiceModel service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.destination!,
          maxLines: 2,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Text(
          Jiffy(service.createdAt).format("dd MMMM yyyy"),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildEmpyData(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: const EmptyDataLottie(
            path: 'assets/lottie/empty_list_lottie.json',
            label: "No servicios en este estado",
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(
          5,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: LoadingWidget(
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}
