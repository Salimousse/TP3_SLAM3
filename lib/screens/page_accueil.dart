import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/carousel_widget.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    // Liste d'images pour le carrousel
    final List<Widget> carouselImages = [
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

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          // Carrousel d'images
          CarouselWidget(carouselItems: carouselImages),
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
