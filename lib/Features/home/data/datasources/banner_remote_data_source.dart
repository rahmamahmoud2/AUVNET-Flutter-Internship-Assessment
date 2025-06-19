import 'package:nawel_application/Features/home/domain/entities/banner_entity.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerEntity>> fetchBanners();
}
