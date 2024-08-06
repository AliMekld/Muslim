import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:muslim/core/api/error_helper.dart';

enum RequestType { get, post, put, delete }

class RequestMethods {

  final RequestType type;
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, String>? headers;
  final Map<String, String>? queryParameters;

  RequestMethods.get(
    this.url, {
    this.queryParameters,
  })  : type = RequestType.get,
        headers = {},
        body = {};
  //-
  RequestMethods.post(this.url, this.body, {this.queryParameters})
      : type = RequestType.post,
        headers = {};

  //-
  RequestMethods.put(this.url, this.body, {this.queryParameters})
      : type = RequestType.put,
        headers = {};

  //-
  RequestMethods.delete(this.url, {this.queryParameters})
      : type = RequestType.delete,
        headers = {},
        body = {};

  Future<http.Response> _requestByType() async {
    debugPrint("url: $url");
    headers?.addAll({'Content-Type': 'application/json'});
    debugPrint("headers: $headers");



    http.Response response;
    switch (type) {
      case RequestType.get:
        response = await http.get(
          Uri(path: url, queryParameters: queryParameters),
          headers: headers,
        );
      case RequestType.post:
        response = await http.post(
          Uri(path: url, queryParameters: queryParameters),
          body: body,
          headers: headers,
        );
      case RequestType.put:
        response = await http.put(
          Uri(path: url, queryParameters: queryParameters),
          body: body,
          headers: headers,
        );
      case RequestType.delete:
        response = await http.delete(
          Uri(path: url, queryParameters: queryParameters),
          headers: headers,
        );
    }
    return response;
  }

  Future<http.Response> doRequest() async {
   ///TODO :Fix Error Here
    try {
      final response = await _requestByType();
      // print(jsonDecode(response));
      return response;
    } on Exception catch (e) {
      throw Failure(e.toString()).handleException();
    }
  }
}
