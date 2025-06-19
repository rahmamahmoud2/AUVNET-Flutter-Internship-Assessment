import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/Features/home/domain/usecase/get_service_usecase.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServicesUseCase getServicesUseCase;

  ServicesBloc(this.getServicesUseCase) : super(ServicesInitial()) {
    on<FetchServicesEvent>((event, emit) async {
      emit(ServicesLoading());
      final result = await getServicesUseCase();
      result.fold(
        (failure) => emit(ServicesError(message: failure.message)),
        (services) => emit(ServicesLoaded(services: services)),
      );
    });
  }
}
