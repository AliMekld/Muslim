import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:muslim/core/api/error_helper.dart';

import '../../utilites/constants/enums.dart';

class ResponseHandler {
  static Response returnResponseBasedOnStatusCode(
      {required Response response}) {
    HttpStatusCode statusCode =
        HttpStatusCode.values.firstWhere((e) => e.code == response.statusCode);
    switch (statusCode) {
      case HttpStatusCode.continue_:
      case HttpStatusCode.ok:
      case HttpStatusCode.created:
      case HttpStatusCode.noContent:
        return response;
      case HttpStatusCode.movedPermanently:
      case HttpStatusCode.found:
      case HttpStatusCode.notModified:
      case HttpStatusCode.badRequest:
      case HttpStatusCode.unauthorized:
      case HttpStatusCode.forbidden:
      case HttpStatusCode.notFound:
      case HttpStatusCode.internalServerError:
      case HttpStatusCode.badGateway:
      case HttpStatusCode.serviceUnavailable:
        debugPrint("status code: ${statusCode.code}  message : ${statusCode.name}");
        throw ServerException(
            "status code: ${statusCode.code}  message : ${statusCode.name}");
    }
  }
}
