import 'dart:core';
import 'dart:io';

class Failure {
  static Exception handleException(Exception e) {
    if (e is FormatException) {
      return FormatException(e.message);
    } else if (e is SocketException) {
      return SocketException(e.message);
    } else {
      return ServerException(e.toString());
    }
  }
}

class ServerException extends HttpException {
  ServerException(super.message);
}
