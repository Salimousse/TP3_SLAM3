import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/favori_album.dart';
import 'package:flutter_application_2/models/info_album.dart';

class PageInfoAlbums extends StatefulWidget {
  final InfoAlbum album;

  const PageInfoAlbums({Key? key, required this.album}) : super(key: key);

  @override
  State<PageInfoAlbums> createState() => _PageInfoAlbumsState();
}

class _PageInfoAlbumsState extends State<PageInfoAlbums> {

  late bool favoriAlbum;
  List <Map<String, dynamic>> ListeAlbumDesc = FavoriAlbum.listeAlbums;
  
  @override
  void initState() {
    super.initState();
    // Initialiser avec la valeur actuelle de l'album
    int index = ListeAlbumDesc.indexWhere((element) => element['nomAlbum'] == widget.album.nomAlbum);
    favoriAlbum = index != -1 ? (ListeAlbumDesc[index]['favori'] ?? false) : false;
  }
  // fonction pour changer le statut favori
  void _toggleFavorite(String rechercheIndex) {
    int index = ListeAlbumDesc.indexWhere((element) => element['nomAlbum'] == rechercheIndex);
    setState(() {
      favoriAlbum = !favoriAlbum;
      if (index != -1) {
        ListeAlbumDesc[index]['favori'] = favoriAlbum;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informations sur l'album"),
        // le bouton recupere le statut favori et le renvoie a la page precedente
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, favoriAlbum);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image de l'album
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/" + widget.album.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Détails de l'album
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informations sur l'album",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.album.nomGroupe,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.album.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  // bouton favori mis en noir si favori
                  ElevatedButton.icon(
                    icon: Icon(favoriAlbum ? Icons.star : Icons.star_border),
                    style: favoriAlbum ? ElevatedButton.styleFrom(backgroundColor: Colors.black) : null,  
                    label: Text("Favori"),
                    onPressed: () {
                      setState(() {
                        _toggleFavorite(widget.album.nomAlbum);
                      });
                    },
                  )
                  ,
                ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
