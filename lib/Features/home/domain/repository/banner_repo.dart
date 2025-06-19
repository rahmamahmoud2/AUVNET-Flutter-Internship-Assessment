import 'package:nawel_application/Features/home/data/repository/banner_repo_impl.dart';
import 'package:nawel_application/Features/home/domain/entities/banner_entity.dart';

abstract class BannerRepository {
  Future<List<BannerEntity>> getBanners();
}

class BannerRepoImpl implements BannerRepository {
  final BannersRemoteDataSource remoteDataSource;

  BannerRepoImpl(this.remoteDataSource);

  @override
  Future<List<BannerEntity>> getBanners() => remoteDataSource.fetchBanners();
}
