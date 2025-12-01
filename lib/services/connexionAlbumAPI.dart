import 'package:flutter_application_2/models/DataClass/AlbumAPI.dart';
import 'package:http/http.dart' as http;

class ConnexionAlbumAPI {
  Future<List<AlbumApi>?> getAlbums() async {
    try {
      var uri = Uri.parse('http://192.168.203.10:81/api/albums');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return albumApiFromJson(response.body);
      }
    } catch (e) {
      print('Erreur : $e');
    }
    return null;
    }
}
