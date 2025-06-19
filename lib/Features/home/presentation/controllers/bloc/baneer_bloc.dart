import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/domain/usecase/banner_usecase.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_event.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_state.dart';

abstract class BannerEvent {}

class FetchBannersEvent extends BannerEvent {}

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUseCase getBannersUseCase;

  BannerBloc(this.getBannersUseCase) : super(BannerState()) {
    on<FetchBannersEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final banners = await getBannersUseCase();
        emit(state.copyWith(banners: banners, isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });
  }
}
