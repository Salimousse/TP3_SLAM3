import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/album.dart';

class ListeAlbums extends StatefulWidget {
  const ListeAlbums({Key? key }) : super(key: key);

  @override
  State<ListeAlbums> createState() => _ListeAlbumsState();
}

class _ListeAlbumsState extends State<ListeAlbums> {
  List<Map<dynamic, dynamic>> listeAlbumDesc = [];
  List<Map<dynamic, dynamic>> _initialList = [];
// fonction mise à jour de la liste
 void updateList(List<Map> updatedList) {
  setState(() {
    listeAlbumDesc = updatedList.map((e) => Map<dynamic, dynamic>.from(e)).toList();
  });
}
// fonction recherche
  void recherche(String chaineCa) {
    setState(() {
      if (chaineCa.isEmpty) {
        listeAlbumDesc = [..._initialList];
      } else {
        listeAlbumDesc = _initialList.where((album) {
          String albumName = album['nomAlbum'].toString().toLowerCase();
          return albumName.contains(chaineCa.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // initialise la liste
    _initialList = [
      {'nomAlbum': 'Metallica'},
      {'nomAlbum': 'Ride the Lightning'},
      {'nomAlbum': 'Master of Puppets'},
    ];
    listeAlbumDesc = List.from(_initialList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // barre de recherche
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un album',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                recherche(value);
              },
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              children: <Widget>[
                // si le nom de l'album est ecrit dans la barre de recherche, on l'affiche
                if (listeAlbumDesc.isEmpty || listeAlbumDesc.any((a) => a['nomAlbum'] == 'Metallica'))
                  Album(
                    nomAlbum: "Metallica",
                    description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                    nomGroupe: "Metallica",
                    image: "Metallica.jpg",
                    updateList: updateList,
                  ),
                  // si le nom de l'album est ecrit dans la barre de recherche, on l'affiche
                if (listeAlbumDesc.isEmpty || listeAlbumDesc.any((a) => a['nomAlbum'] == 'Ride the Lightning'))
                  Album(
                    nomAlbum: "Ride the Lightning",
                    description: "Ride the lighting est considéré comme l'un des classiques du trash metal et comme une transition musicale entre les débuts de Metallica, Kill 'Em All, Master of Puppets.",
                    nomGroupe: "Metallica",
                    image: "Ride the Lightning.jpg",
                    updateList: updateList,
                  ),
                  // si le nom de l'album est ecrit dans la barre de recherche, on l'affiche
                if (listeAlbumDesc.isEmpty || listeAlbumDesc.any((a) => a['nomAlbum'] == 'Master of Puppets'))
                  Album(
                    nomAlbum: "Master of Puppets",
                    description: "Master of Puppets est le troisième album studio du groupe de thrash metal américain Metallica, sorti le 3 mars 1986. Il est souvent considéré comme l'un des meilleurs albums de heavy metal de tous les temps et a eu une influence significative sur le développement du genre thrash metal.",
                    nomGroupe: "Metallica",
                    image: "Master of Puppets.jpg",
                    updateList: updateList,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

