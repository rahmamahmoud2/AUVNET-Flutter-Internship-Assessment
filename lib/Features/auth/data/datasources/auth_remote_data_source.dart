abstract class AuthRemoteDataSource {
  Future<void> signUp(String email, String password);
  Future<void> logIn(String email, String password);
}
