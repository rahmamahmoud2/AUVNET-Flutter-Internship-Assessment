import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/main_layout_event.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/main_layout_state.dart';

class HomeNavBloc extends Bloc<HomeNavEvent, HomeNavState> {
  HomeNavBloc() : super(HomeNavState(currentIndex: 0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.newIndex));
    });
  }
}
