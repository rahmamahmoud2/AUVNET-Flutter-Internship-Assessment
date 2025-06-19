import 'package:nawel_application/Features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
