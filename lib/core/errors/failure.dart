abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(String message) : super(message);
}
