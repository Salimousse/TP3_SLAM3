import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/info_album.dart';
import 'package:flutter_application_2/models/favori_album.dart';
import 'package:flutter_application_2/screens/page_info_albums.dart';
import 'package:flutter_application_2/screens/page_liste_albums.dart';


// Widget Album : représente un album dans la liste, gère l'affichage et le clic pour voir les détails
class Album extends StatefulWidget {
   Album({Key? key, required this.idAlbum, this.nomAlbum, this.description, this.nomGroupe, this.image, this.linkyoualbum, this.linkArtiste, required this.updateList}) 
    : super(key: key); 
  final int idAlbum;
  final String? nomAlbum; 
  final String? description; 
  final String? nomGroupe; 
  final String? image;
  final String? linkyoualbum;
  final String? linkArtiste;
  final Function(List<Map<dynamic, dynamic>>) updateList;

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
// Met à jour la liste des favoris et notifie le parent via updateList
 void updateFavorite(bool newFavorite) {
    List<Map<String, dynamic>> listeAlbumDesc = FavoriAlbum.listeAlbums;
    int index = listeAlbumDesc.indexWhere((element) => element['nomAlbum'] == widget.nomAlbum);
    if (index != -1) {
      listeAlbumDesc[index]['favori'] = newFavorite;
      widget.updateList(listeAlbumDesc);
    }
  }

  @override
  // Affiche la carte de l'album, gère le clic pour ouvrir les détails et le retour après modification
   Widget build(BuildContext context) {
      // Récupérer le statut favori de l'album
      List<Map<String, dynamic>> listeAlbumDesc = FavoriAlbum.listeAlbums;
      int index = listeAlbumDesc.indexWhere((element) => element['nomAlbum'] == widget.nomAlbum);
      bool isFavori = index != -1 ? (listeAlbumDesc[index]['favori'] ?? false) : false;

      return GestureDetector(
        onTap: () async {
          InfoAlbum album = InfoAlbum(
            id: widget.idAlbum,
            nomAlbum: widget.nomAlbum ?? '',
            description: widget.description ?? '',
            nomGroupe: widget.nomGroupe ?? '',
            image: widget.image ?? '',
            linkyoualbum: widget.linkyoualbum,
            linkArtiste: widget.linkArtiste,
          );

          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersive,
          );
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageInfoAlbums(album: album),
            ),
          );
          if (result == true) {
            // Rafraîchir la liste après modification
            if (mounted) {
              // On appelle la fonction updateList avec la nouvelle liste récupérée depuis l'API
              // On suppose que le parent (ListeAlbums) a une méthode pour recharger la liste
              // On utilise un callback pour demander le rafraîchissement
              widget.updateList([]); // On passe une liste vide pour signaler le rafraîchissement
            }
          }
        },
        child: Container(
         padding: EdgeInsets.all(2) ,   child: Card( 
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:    <Widget>[
                  widget.image != null && widget.image!.isNotEmpty
                    ? (widget.image!.startsWith('http')
                        ? Image.network(widget.image!, width: 100, height: 100, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.album, size: 100))
                        : Image.asset("assets/images/${widget.image!}", width: 100, height: 100, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.album, size: 100)))
                    : Icon(Icons.album, size: 100),
                  Expanded(
                     child: Container(
                        padding: EdgeInsets.all(5), child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                              children: <Widget>[ 
                              
                              Text(widget.nomAlbum!, style: TextStyle(fontWeight: 
                                 FontWeight.bold)), Text(widget.description!), 
                              Text("Valeur: " + widget.nomGroupe.toString()), 
                           ], 
                        )
                     )
                  ),
                  // met en jaune l'icone si mis en favori 
                  Icon(
                    isFavori ? Icons.star : Icons.star_border,
                    color: isFavori ? Colors.amber : Colors.grey,
                    size: 30,
                  ),
               ]
            )
         ),


         
        ),
      );
   }
}
