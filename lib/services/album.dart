import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/info_album.dart';
import 'package:flutter_application_2/models/favori_album.dart';
import 'package:flutter_application_2/screens/page_info_albums.dart';
import 'package:flutter_application_2/screens/page_liste_albums.dart';


class Album extends StatefulWidget {
    Album({Key? key, this.nomAlbum, this.description, this.nomGroupe, this.image, required this.updateList}) 
      : super(key: key); 
   final String? nomAlbum; 
   final String? description; 
   final String? nomGroupe; 
   final String? image;
   final Function(List<Map<dynamic, dynamic>>) updateList;

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
// fonction mise à jour de la liste des favoris
 void updateFavorite(bool newFavorite) {
    List<Map<String, dynamic>> listeAlbumDesc = FavoriAlbum.listeAlbums;
    int index = listeAlbumDesc.indexWhere((element) => element['nomAlbum'] == widget.nomAlbum);
    if (index != -1) {
      listeAlbumDesc[index]['favori'] = newFavorite;
      widget.updateList(listeAlbumDesc);
    }
  }

   @override
   Widget build(BuildContext context) {
      // Récupérer le statut favori de l'album
      List<Map<String, dynamic>> listeAlbumDesc = FavoriAlbum.listeAlbums;
      int index = listeAlbumDesc.indexWhere((element) => element['nomAlbum'] == widget.nomAlbum);
      bool isFavori = index != -1 ? (listeAlbumDesc[index]['favori'] ?? false) : false;
      
      return GestureDetector(
        onTap: () async {
          InfoAlbum album = InfoAlbum(
            nomAlbum: widget.nomAlbum ?? '',
            description: widget.description ?? '',
            nomGroupe: widget.nomGroupe ?? '',
            image: widget.image ?? '',
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
          
          if (result != null && result is bool) {
            updateFavorite(result);
          }
        },
        child: Container(
         padding: EdgeInsets.all(2) ,   child: Card( 
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:    <Widget>[
                  Image.asset("assets/images/" +widget.image!), 
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
