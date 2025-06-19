import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel_application/Features/home/data/datasources/services_remote_datasource.dart';
import 'package:nawel_application/Features/home/data/models/service_model.dart';

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final FirebaseFirestore firestore;

  ServicesRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ServiceModel>> fetchServices() async {
    final snapshot = await firestore.collection('services').get();
    for (var doc in snapshot.docs) {
      print(doc.data());
      print(doc.id);
    }
    return snapshot.docs.map((doc) => ServiceModel.fromDocument(doc)).toList();
  }
}
