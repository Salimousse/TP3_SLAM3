import  'package:flutter/material.dart';
import  'package:flutter_application_2/models/info_album.dart';

class FavoriAlbum {
  static List<Map<String, dynamic>> listeAlbums = [
    {
      'nomAlbum': 'Metallica',
      'image': 'Metallica.jpg',
      'description': 'L\'album marque une évolution importante dans le style du groupe.',
      'favori': false,
    },
    {
      'nomAlbum': 'Ride the Lightning',
      'image': 'Ride the Lightning.jpg',
      'description': 'Ride the lighting est considéré comme l\'un des classiques du trash metal.',
      'favori': false,
    },
    {
      'nomAlbum': 'Master of Puppets',
      'image': 'Master of Puppets.jpg',
      'description': 'Master of Puppets est le troisième album studio du groupe.',
      'favori': false,
    },
  ];
}
