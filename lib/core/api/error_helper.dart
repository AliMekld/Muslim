import 'dart:core';
import 'dart:io';


class Failure implements Exception {
    final String _message;

  Failure(this._message);
   Exception handleException() {
    if (_message.contains("FormatException")) {
      return  FormatException(_message);
    } else if (_message.contains("SocketException")) {
        return SocketException(_message);
    } else {
      return ServerException(_message);
    }
  }
}

class ServerException extends Failure {
  ServerException(super.message);
}
