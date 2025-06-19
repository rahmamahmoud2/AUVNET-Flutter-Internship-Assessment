import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel_application/Features/home/data/models/banner_model.dart';

abstract class BannersRemoteDataSource {
  Future<List<BannerModel>> fetchBanners();
}

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  final FirebaseFirestore firestore;

  BannersRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<BannerModel>> fetchBanners() async {
    final snapshot = await firestore.collection('banners').get();
    for (var doc in snapshot.docs) {
      print("🔥 doc data: ${doc.data()}");
    }

    return snapshot.docs.map((doc) => BannerModel.fromMap(doc.data())).toList();
  }
}
