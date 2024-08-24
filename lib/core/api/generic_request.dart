import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'error_helper.dart';
import 'request_methods.dart';
import 'package:http/http.dart' as http;
class GenericRequest<T> {
  T Function(Map<String, dynamic>) fromJson;
  RequestMethods method;
  GenericRequest({required this.method, required this.fromJson});

  Future<List<T>> getList() async {
    try {
    http.Response result = await method.makeRequest();
      if (jsonDecode(result.body)["data"] is List) {
        debugPrint(jsonDecode(result.body).toString());
        List<T> tList = [];
        tList = List.from(jsonDecode(result.body)["data"].map((e) => fromJson(e)));
        return tList;
      } else {
        throw Exception("Not A List ");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(e.toString());
    }
  }

  Future<T> getObject() async {
    http.Response result = await method.makeRequest();
    try {
      T object = fromJson(jsonDecode(result.body)["data"]);
      return object;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<http.Response> getResponse() async {
    http.Response result = await method.makeRequest();
    try {
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
