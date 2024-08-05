import 'package:http/http.dart' as http;

enum RequestType { get, post, put, delete }

class RequestMethods {
  final RequestType type;
  final Uri uri;
  final Map<String, dynamic> body;
  final Map<String, dynamic> header;

  RequestMethods.get(this.uri)
      : type = RequestType.get,
        header = {},
        body = {};
  //-
  RequestMethods.post(
    this.uri,
    this.body,
  )   : type = RequestType.post,
        header = {};

  //-
  RequestMethods.put(this.uri, this.body)
      : type = RequestType.put,
        header = {};

  //-
  RequestMethods.delete(this.uri)
      : type = RequestType.get,
        header = {},
        body = {};

  Future<http.Response> _requestByType() async {
    http.Response response;
    switch (type) {
      case RequestType.get:
        response = await http.get(uri);
      case RequestType.post:
        response = await http.post(uri, body: body);
      case RequestType.put:
        response = await http.put(uri, body: body);
      case RequestType.delete:
        response = await http.delete(uri);
    }
    return response;
  }

  ///TODO create request Method that takes this private [_requestByType]
  Future<void> doRequest() async {}
}
