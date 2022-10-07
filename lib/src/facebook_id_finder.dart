import 'package:http/http.dart' as http;

Future<String?> findFacebookIdByUrl(String url) async {
  if (!url.contains("https://")) {
    url = "https://$url";
  }
  if (url.contains("//m.")) {
    url = url.replaceAll("//m.", "//www.");
  }
  Uri? uri = Uri.tryParse(url);
  if (uri == null) {
    throw Exception("Invalid url");
  }
  if (uri.queryParameters['id'] != null) {
    return uri.queryParameters['id']!;
  }
  String segment = uri.pathSegments.first;
  late RegExp regex;
  switch (segment) {
    case "groups":
      regex = RegExp(r'"fb://group/(.*?)"');
      break;
    default:
      regex = RegExp(r'"fb://profile/(.*?)"');
  }
  var response = await http.get(uri);
  var body = response.body;
  var result = regex.firstMatch(body);
  if (result == null) {
    return null;
  }
  return result.group(1);
}
