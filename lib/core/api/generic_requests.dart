import 'dart:convert';

import 'package:muslim/core/api/resposeHandler.dart';

import 'request_methods.dart';

class GenericRequest<T> {
  ///- TODO
  final RequestMethods method;
  final T Function(Map<String, dynamic> json) fromMap;

  GenericRequest({required this.method, required this.fromMap});

  Future<List<T>> getList() async {
    print("object");
    final response = await method.doRequest();
    final responseBody =  ResponseHandler.returnResponseBasedOnStatusCode(
      response: response,
    );
print(response.body);
      // print("notList");
    List<T> tList = [];
    if (responseBody is List) {
      List<Map<String, dynamic>> jsonList =
      jsonDecode(responseBody.body);
      tList = List<T>.from(jsonList.map((e) => fromMap(e)));
    }else{
    }
    return tList;
  }

  Future<T> getObject() async {
    final response = await method.doRequest();
    final responseBody =  ResponseHandler.returnResponseBasedOnStatusCode(
        response: response);
    T object = fromMap(jsonDecode(responseBody.body));
    return object;
  }
}
