import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/album.dart';

class ListeAlbums extends StatelessWidget {
  const ListeAlbums({Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
      return  Container(
        color: Colors.white,
        alignment: Alignment.center,
  child: ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
    children: <Widget>[
      Album(
        nomAlbum: "Metallica",
        description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
        nomGroupe: "Metallica",
        image: "Metallica.jpg"
      ),
      Album(
        nomAlbum: "Ride the Lightning",
        description: "Ride the lighting est considéré comme l'un des classiques du trash metal et comme une transition musicale entre les débuts de Metallica, Kill 'Em All, Master of Puppets.",
        nomGroupe: "Metallica",
        image: "Ride the Lightning.jpg"
      ),

      Album (
        nomAlbum: "Master of Puppets",
        description: "Master of Puppets est le troisième album studio du groupe de thrash metal américain Metallica, sorti le 3 mars 1986. Il est souvent considéré comme l'un des meilleurs albums de heavy metal de tous les temps et a eu une influence significative sur le développement du genre thrash metal.",
        nomGroupe: "Metallica",
        image: "Master of Puppets.jpg"
      ),
    ],
  ),
   
      );
  }
}
