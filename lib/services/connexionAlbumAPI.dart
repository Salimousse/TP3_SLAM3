import 'dart:convert';
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


    Future<bool> createAlbum(String nomAlbum, String descAlbum,String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum ) async {
  final response = await http.post(
    Uri.parse('http://192.168.203.10:81/api/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "nomalbum": nomAlbum,
      "descalbum": descAlbum,
      "artistealbum": artisteAlbum,
      "groupealbum": groupeAlbum.toString(),
      "pochettealbum": pochetteAlbum,
      "compositeuralbum": compoAlbum,
      
    }),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // si 201 ou 200 alors l'enregistrement est bien créé
    print('✓ Album créé - Code: ${response.statusCode}');
    return true;
  } else {
    print('✗ Echec - Code: ${response.statusCode}, Réponse: ${response.body}');
    return false;
     
  }
}
}
