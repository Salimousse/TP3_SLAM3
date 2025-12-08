import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/carousel_widget.dart';
import 'package:flutter_application_2/services/connexionAlbumAPI.dart';
import 'package:flutter_application_2/models/DataClass/AlbumAPI.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({Key? key}) : super(key: key);

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  List<Widget> carouselImages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _chargerAlbumsAPI();
  }

  Future<void> _chargerAlbumsAPI() async {
    try {
      List<AlbumApi>? albums = await ConnexionAlbumAPI().getAlbums().timeout(
        const Duration(seconds: 10),
        onTimeout: () => null,
      );
      
      if (albums != null && albums.isNotEmpty) {
        setState(() {
          // Prendre maximum 5 albums
          final albumsLimites = albums.take(5).toList();
          carouselImages = albumsLimites.map((album) {
            String? imageUrl = album.pochettealbum;
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? (imageUrl.startsWith('http')
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.album, size: 100),
                        )
                      : Image.asset(
                          'assets/images/$imageUrl',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.album, size: 100),
                        ))
                  : Icon(Icons.album, size: 100),
            );
          }).toList();
          isLoading = false;
        });
      } else {
        _chargerImagesParDefaut();
      }
    } catch (e) {
      _chargerImagesParDefaut();
    }
  }

  void _chargerImagesParDefaut() {
    setState(() {
      carouselImages = [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/Metallica.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/Hardwired.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/Master of Puppets.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/Ride the Lightning.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/And Justice for All.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          // Carrousel d'images
          isLoading
              ? Center(child: CircularProgressIndicator())
              : CarouselWidget(carouselItems: carouselImages),
          const SizedBox(height: 20),
          
          Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/image_vinyle.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Bienvenue sur l\'application de gestion d\'album',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'News',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Dernières actualités'),
                ],
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Version 1 en cours de développement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Wait and see'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
