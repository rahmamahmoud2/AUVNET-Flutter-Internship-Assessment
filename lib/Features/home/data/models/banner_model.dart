import 'package:nawel_application/Features/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({required super.imageUrl});

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    final imageUrl = map['imageUrl'];
    if (imageUrl == null || imageUrl is! String || imageUrl.isEmpty) {
      print("❌ Invalid imageUrl in document: $map");
    }
    return BannerModel(imageUrl: imageUrl ?? '');
  }
}
