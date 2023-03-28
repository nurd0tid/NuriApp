import 'package:http/http.dart' as http;

const baseUrl = 'https://api.quran.gading.dev/';

class RequestQuran {
  final String url;
  final dynamic body;

  RequestQuran({required this.url, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(baseUrl + url), body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    print(baseUrl + url);
    return http.get(Uri.parse(baseUrl + url)).timeout(Duration(minutes: 2));
  }
}
