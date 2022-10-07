import 'package:facebook_id_finder/facebook_id_finder.dart';

void main() async {
  String? randomGroup = await findFacebookIdByUrl("https://www.fb.com/groups/1213995236055162/");
  String? me = await findFacebookIdByUrl("https://www.facebook.com/chunlee.thong");
  String? random = await findFacebookIdByUrl("https://www.facebook.com/profile.php?id=100086420950741");
  String? gmk = await findFacebookIdByUrl("https://web.facebook.com/Noobie4GMK");
  String? meta = await findFacebookIdByUrl("https://www.facebook.com/MetaCambodia");
  String? ezecom = await findFacebookIdByUrl("https://www.facebook.com/ezecom");
  print("My groupId:    $randomGroup: ${randomGroup?.length}");
  print("me:  $me: ${me?.length}");
  print("random: $random: ${random?.length}");
  print("gmk:     $gmk: ${gmk?.length}");
  print('Meta:          $meta');
  print('Ezecom:        $ezecom');
}
