import 'request_methods.dart';

class GenericRequest<T> {
  ///- TODO
  final RequestMethods method;
  final T Function(Map<String, dynamic> json) fromMap;

  GenericRequest(this.method, this.fromMap);

  Future<List<T>> getList() async {
    //todo
    return [];
  }

  Future<T> getObject() async {
    //todo
    T object = fromMap({});
    return object;
  }
}
