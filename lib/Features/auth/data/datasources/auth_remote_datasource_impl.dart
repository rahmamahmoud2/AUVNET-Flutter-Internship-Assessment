import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel_application/Features/auth/data/datasources/auth_remote_data_source.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDatasourceImpl({required this.firebaseAuth});
  @override
  Future<void> logIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
