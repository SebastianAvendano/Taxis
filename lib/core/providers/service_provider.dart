import 'package:AeroTaxi/data/models/service_model/service_model.dart';

import 'disposable_provider.dart';

class ServiceProvider extends DisposableProvider {
  ServiceModel _selectedService = const ServiceModel();

  ServiceModel get selectedService => _selectedService;

  set selectedService(ServiceModel selectedService) {
    _selectedService = selectedService;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _selectedService = const ServiceModel();
  }
}
