abstract class Failure {}

class ServerFailure extends Failure {
  final String? msg;

  ServerFailure({this.msg});
}

class CacheFailure extends Failure {}

class NoInternetFailure extends Failure {}
