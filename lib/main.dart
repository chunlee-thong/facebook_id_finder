import 'package:http/http.dart' as client;

void main() async {
  
  String? groupId = await findFacebookIdByUrl("https://www.fb.com/groups/1213995236055162/");
  String? profileId = await findFacebookIdByUrl("https://www.facebook.com/chunlee.thong");
  String? profileId2 = await findFacebookIdByUrl("https://www.facebook.com/profile.php?id=100086420950741");
  String? pageId = await findFacebookIdByUrl("https://www.facebook.com/Noobie4GMK");
  print("My groupId:   $groupId: ${groupId?.length}");
  print("My profileId: $profileId: ${profileId?.length}");
  print("My profileId2: $profileId2: ${profileId2?.length}");
  print("My pageId:    $pageId: ${pageId?.length}");
}

Future<String?> findFacebookIdByUrl(String facebookUrl) async {
  if (facebookUrl.contains("//m.")) {
    facebookUrl = facebookUrl.replaceAll("//m.", "//www.");
  }
  Uri? uri = Uri.tryParse(facebookUrl);
  if (uri == null) {
    print("Invalid uri");
    return null;
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
  var response = await client.get(uri);
  var body = response.body;
  var result = regex.firstMatch(body);
  if (result == null) {
    print("no match found");
    return null;
  }

  return result.group(1);
}
