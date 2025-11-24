import  'package:flutter/material.dart';
import  'package:flutter_application_2/models/info_album.dart';

class FavoriAlbum {
  static List<Map<String, dynamic>> listeAlbums = [
    {
      'nomAlbum': 'Album 1',
      'image': 'album1.jpg',
      'description': 'Description de l\'album 1',
      'favori': false,
    },
    {
      'nomAlbum': 'Album 2',
      'image': 'album2.jpg',
      'description': 'Description de l\'album 2',
      'favori': false,
    },
  ];
}
