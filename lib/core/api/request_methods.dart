import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'error_helper.dart';
enum MethodCRUDType{
  get,post,put,delete
}
class RequestMethods {
  /// 1- Api Response Model
  /// 2- Create Parameters Of Parent Class[done]
  final String url;
  final Map<String, String>? body;
  final Map<String, String>? headers;
  final Map<String, String>? queryParameters;
  final MethodCRUDType methodType;

  /// 3- Create a Named Constructor For Each Type[done]
  RequestMethods.get({required this.url, this.queryParameters})
      : body = null,
        headers = {},
        methodType = MethodCRUDType.get;
  RequestMethods.post({required this.url, required this.body, this.queryParameters})
      : headers = {},
        methodType = MethodCRUDType.post;
  RequestMethods.put({required this.url, required this.body, this.queryParameters})
      : headers = {},
        methodType = MethodCRUDType.put;
  RequestMethods.delete({required this.url, this.queryParameters})
      : headers = {},
        body = null,
        methodType = MethodCRUDType.delete;

  Future<Response> _method(MethodCRUDType methodType) async {
    final Map<String, String> headers = {
    
    };
    switch (methodType) {
      case MethodCRUDType.get:
        return http.get(
          Uri.parse(url),
          headers: this.headers?..addAll(headers),
        );
      case MethodCRUDType.post:
        return http.post(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: this.headers?..addAll(headers),
        );
      case MethodCRUDType.put:
        return http.put(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: this.headers?..addAll(headers),
        );
      case MethodCRUDType.delete:
        return http.delete(
          Uri.parse(url),
          headers: this.headers?..addAll(headers),
        );
    }
  }

  Future<http.Response> makeRequest() async {
    http.Response response = await _method(methodType);
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("TYPE ERROR ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw ServerException(e.message);
    } on FormatException catch (e) {
      throw ServerException(e.message);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
