import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/auth/domain/usecase/login_usecase.dart';
import 'package:nawel_application/Features/auth/domain/usecase/signup_usecase.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_event.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<SignUpEvent>(onRegister);
  }

  Future<void> onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await loginUseCase(event.email, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> onRegister(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await registerUseCase(event.email, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
