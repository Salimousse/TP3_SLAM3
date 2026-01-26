import 'dart:convert';
import 'package:flutter_application_2/models/DataClass/AlbumAPI.dart';
import 'package:http/http.dart' as http;

// Service pour gérer les appels API liés aux albums (GET, POST, PUT)
class ConnexionAlbumAPI {
  // Récupère la liste des albums depuis l'API
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


    // Crée un nouvel album via l'API
    Future<bool> createAlbum(String nomAlbum, String descAlbum,String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum, String linkAlbum , String linkArtiste ) async {
      print("--- Début createAlbum ---");
      print("Données envoyées : Nom=$nomAlbum, Artiste=$artisteAlbum, Groupe=$groupeAlbum");
      
  final response = await http.post(
    Uri.parse('http://192.168.203.10:81/api/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "nomalbum": nomAlbum,
      "descalbum": descAlbum,
      "artistealbum": artisteAlbum,
      "groupealbum": groupeAlbum,
      "pochettealbum": pochetteAlbum,
      "compositeuralbum": compoAlbum,
      "linkyoualbum": linkAlbum,
      "linkartistealbum": linkArtiste,
    }),
  );

 
  if (response.statusCode == 201) {
    // si 201 alors l’enregistrement est bien créé
    return true;
  } else {
     print("Erreur lors de la création de l'album");
     return false;
     
  }

}
  // Modifie un album existant via l'API
  Future<bool> updateAlbum(int idAlbum, String nomAlbum, String descAlbum, String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum, String linkAlbum, String linkArtiste) async {
 
    
    try {
      final response = await http.put(
        Uri.parse('http://192.168.203.10:81/api/albums'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "idalbum": idAlbum,
          "nomalbum": nomAlbum,
          "descalbum": descAlbum,
          "artistealbum": artisteAlbum,
          "groupealbum": groupeAlbum,
          "pochettealbum": pochetteAlbum,
          "compositeuralbum": compoAlbum,
          "linkyoualbum": linkAlbum,
          "linkartistealbum": linkArtiste,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Album modifié avec succès");
        return true;
      } else {
        print("Erreur lors de la modification de l'album : ${response.statusCode}");
        print("Réponse serveur : ${response.body}");
        return false;
      }
    } catch (e) {
      print("Erreur lors de la modification : $e");
      return false;
    }
  }}
