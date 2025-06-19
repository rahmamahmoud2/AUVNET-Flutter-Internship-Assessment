import 'package:nawel_application/Features/auth/data/datasources/auth_remote_data_source.dart';

import 'package:nawel_application/Features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> login(String email, String password) {
    return remoteDataSource.logIn(email, password);
  }

  @override
  Future<void> signUp(String email, String password) {
    return remoteDataSource.signUp(email, password);
  }
}
