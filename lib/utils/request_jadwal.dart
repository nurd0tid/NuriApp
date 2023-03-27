import 'package:http/http.dart' as http;

const baseUrl = 'https://api.myquran.com/v1';

class RequestJadwal {
  final String url;
  final dynamic body;

  RequestJadwal({required this.url, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(baseUrl + url), body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    print(baseUrl + url);
    return http.get(Uri.parse(baseUrl + url)).timeout(Duration(minutes: 2));
  }
}
