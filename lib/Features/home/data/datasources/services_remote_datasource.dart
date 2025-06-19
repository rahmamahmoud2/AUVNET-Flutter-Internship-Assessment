import 'package:nawel_application/Features/home/data/models/service_model.dart';

abstract class ServicesRemoteDataSource {
  Future<List<ServiceModel>> fetchServices();
}
