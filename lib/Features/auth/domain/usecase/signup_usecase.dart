import 'package:nawel_application/Features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call(String email, String password) async {
    return await repository.signUp(email, password);
  }
}
