import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/album.dart';
import 'package:flutter_application_2/models/DataClass/AlbumAPI.dart';
import 'package:flutter_application_2/services/connexionAlbumAPI.dart';

class ListeAlbums extends StatefulWidget {
  const ListeAlbums({Key? key }) : super(key: key);

  @override
  State<ListeAlbums> createState() => _ListeAlbumsState();
}

class _ListeAlbumsState extends State<ListeAlbums> {
  //liste des albums
  List<Map<dynamic, dynamic>> listeAlbumDesc = [];

  // liste pour la recherche
  List<Map<dynamic, dynamic>> _initialList = [];
  
  // indique si le chargement a échoué
  bool _loadingError = false;
// fonction mise à jour de la liste
 void updateList(List<Map> updatedList) {
  setState(() {
    listeAlbumDesc = updatedList.map((e) => Map<dynamic, dynamic>.from(e)).toList();
  });

}
 Future<List<Map>> listeAlbumAPI() async {
    listeAlbumDesc = [];
    try {
      List<AlbumApi>? listeAlbumAPI = await ConnexionAlbumAPI().getAlbums().timeout(
        const Duration(seconds: 10),
        onTimeout: () => null,
      );
      if (listeAlbumAPI != null && listeAlbumAPI.isNotEmpty) {
      listeAlbumAPI.forEach((e) {
        listeAlbumDesc.add({
          'idAlbum': e.idalbum,
          'nomAlbum': e.nomalbum,
          'description': e.descalbum,
          'nomGroupe': e.artistealbum,
          'image': e.pochettealbum,
          'favori': false,
        });
      });
      } else {
        _loadingError = true;
        _chargerDonneesEnDur();
      }
    } catch (e) {
      // En cas d'erreur (timeout, erreur réseau, etc.)
      _loadingError = true;
      _chargerDonneesEnDur();
    }

    return listeAlbumDesc;
  }

  void _chargerDonneesEnDur() {
    // Si la connexion à l'API échoue, afficher les données en dur
    listeAlbumDesc = [
      {
        'idAlbum': 1,
        'nomAlbum': 'Metallica',
        'description': "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
        'nomGroupe': 'Metallica',
        'image': 'Metallica.jpg',
        'favori': false,
      },
      {
        'idAlbum': 2,
        'nomAlbum': 'Ride the Lightning',
        'description': "Ride the lighting est considéré comme l'un des classiques du trash metal et comme une transition musicale entre les débuts de Metallica, Kill 'Em All, Master of Puppets.",
        'nomGroupe': 'Metallica',
        'image': 'Ride the Lightning.jpg',
        'favori': false,
      },
      {
        'idAlbum': 3,
        'nomAlbum': 'Master of Puppets',
        'description': "Master of Puppets est le troisième album studio du groupe de thrash metal américain Metallica, sorti le 3 mars 1986. Il est souvent considéré comme l'un des meilleurs albums de heavy metal de tous les temps et a eu une influence significative sur le développement du genre thrash metal.",
        'nomGroupe': 'Metallica',
        'image': 'Master of Puppets.jpg',
        'favori': false,
      },
    ];
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
    listeAlbumAPI().then((value) {
      setState(() {
        listeAlbumDesc = value;
        _initialList = [...listeAlbumDesc];
      });
    });
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
              // appel de la fonction recherche lors de la saisie
              onChanged: (value) {
                recherche(value);
              },
            ),
          ),
          // liste des albums
          Expanded(
            child: listeAlbumDesc.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: listeAlbumDesc.length,
                    itemBuilder: (context, index) {
                      return Album(
                        nomAlbum: listeAlbumDesc[index]['nomAlbum'],
                        description: listeAlbumDesc[index]['description'],
                        nomGroupe: listeAlbumDesc[index]['nomGroupe'],
                        image: listeAlbumDesc[index]['image'],
                        updateList: updateList,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

}