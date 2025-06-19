import 'package:nawel_application/Features/home/domain/entities/banner_entity.dart';
import 'package:nawel_application/Features/home/domain/repository/banner_repo.dart';

class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase(this.repository);

  Future<List<BannerEntity>> call() => repository.getBanners();
}
