import 'package:AeroTaxi/data/models/service_model/service_model.dart';
import 'package:AeroTaxi/ui/views/home_view/home_controller.dart';
import 'package:AeroTaxi/ui/widgets/empty_data_lottie_widget.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/section_name_view_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_widgets/button_add_service.dart';

final injector = GetIt.instance;

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool locationPermissionGranted = false;
  late GoogleMapController? mapController;

  final _controller = injector.get<HomeController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.initView(context: context);
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      locationPermissionGranted = true;
    } else {
      locationPermissionGranted = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SectionNameView(
            title: "Mapa de taxis",
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: _controller.getListService(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox();
                }

                final List<QueryDocumentSnapshot?> listServices =
                    snapshot.data?.docs ?? [];

                if (listServices.isNotEmpty) {
                  final services = listServices
                      .map((doc) => ServiceModel.fromJson(
                          doc?.data() as Map<String, dynamic>))
                      .toList();
                  return _buildMap(services);
                } else {
                  return _buildEmpyData(context);
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const ButtonCreateService(),
    );
  }

  Widget _buildEmpyData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: const EmptyDataLottie(
          path: 'assets/lottie/empty_list_lottie.json',
          label: "No servicios disponibles en tu zona",
        ),
      ),
    );
  }

  GoogleMap _buildMap(List<ServiceModel> services) {
    final markers = services.map((service) {
      return Marker(
        markerId: MarkerId(service.id ?? ''),
        position: LatLng(double.parse(service.lat ?? '0'),
            double.parse(service.long ?? '0')),
        infoWindow: InfoWindow(
          title: service.title,
          snippet: 'Conductor: ${service.driver!.displayName!}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    }).toSet();

    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationEnabled: locationPermissionGranted,
      mapType: MapType.terrain,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController controller) =>
          mapController = controller,
      initialCameraPosition: const CameraPosition(
        zoom: 12,
        target: LatLng(2.8364366, -75.2899375),
      ),
      markers: markers,
    );
  }
}
