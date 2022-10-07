import 'package:facebook_id_finder/facebook_id_finder.dart';
import 'package:test/test.dart';

void main() {
  test('test', () async {
    String? url = await findFacebookIdByUrl("https://web.facebook.com/MetaCambodia");
  });
}
