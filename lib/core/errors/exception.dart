import 'dart:io';

class ServerException implements Exception, SocketException {
  InternetAddress? get address => null;

  String get message => 'message';
  OSError? get osError => null;
  int? get port => null;
}

class CacheException implements Exception {}
