import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';

class ServiceModel extends MainService {
  ServiceModel({
    required String id,
    required String name,
    required String imageUrl,
    required String description,
  }) : super(id: id, name: name, imageUrl: imageUrl, description: description);
  factory ServiceModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceModel(
      id: data['id'] ?? doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
