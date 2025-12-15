import 'package:http/http.dart' as http;
import 'dart:convert';

List<AlbumApi> albumApiFromJson(String str) =>
    List<AlbumApi>.from(json.decode(str).map((x) => AlbumApi.fromMap(x)));

String postAlbumToJson(List<AlbumApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class AlbumApi {
  AlbumApi({
    required this.idalbum,
    this.nomalbum,
    this.descalbum,
    this.artistealbum,
    required this.groupealbum,
    this.pochettealbum,
    this.compositeuralbum,
    this.linkyoualbum,
    this.linkartistealbum,
  });

  int idalbum;
  String? nomalbum;
  String? descalbum;
  String? artistealbum;
  bool groupealbum;
  String? pochettealbum;
  String? compositeuralbum;
  String? linkyoualbum;
  String? linkartistealbum;



  factory AlbumApi.fromMap(Map<String, dynamic> json) => AlbumApi(
        idalbum: json["idalbum"],
        nomalbum: json["nomalbum"],
        descalbum: json["descalbum"],
        artistealbum: json["artistealbum"],
        groupealbum: json["groupealbum"],
        pochettealbum: json["pochettealbum"],
        compositeuralbum: json["compositeuralbum"],
        linkyoualbum: json["linkyoualbum"],
        linkartistealbum: json["linkartistealbum"],
      );

  Map<String, dynamic> toJson() => {
        "idalbum": idalbum,
        "nomalbum": nomalbum  ,
        "descalbum": descalbum,
        "artistealbum": artistealbum,
        "groupealbum": groupealbum,
        "pochettealbum": pochettealbum,
        "compositeuralbum": compositeuralbum,
        "linkyoualbum": linkyoualbum,
        "linkartistealbum": linkartistealbum,
      };

  
 
  
}