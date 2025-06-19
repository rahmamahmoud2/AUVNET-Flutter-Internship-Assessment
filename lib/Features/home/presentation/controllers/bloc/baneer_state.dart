import 'package:nawel_application/Features/home/domain/entities/banner_entity.dart';

class BannerState {
  final List<BannerEntity> banners;
  final bool isLoading;
  final String? error;

  BannerState({this.banners = const [], this.isLoading = false, this.error});

  BannerState copyWith({
    List<BannerEntity>? banners,
    bool? isLoading,
    String? error,
  }) {
    return BannerState(
      banners: banners ?? this.banners,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
