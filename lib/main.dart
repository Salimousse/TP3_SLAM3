import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/page_parametres.dart';
import 'package:flutter_application_2/widgets/appbar.dart';
import 'package:flutter_application_2/screens/page_accueil.dart';
import 'package:flutter_application_2/screens/page_liste_albums.dart';
import 'package:flutter_application_2/screens/page_ajout_albums.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



void main()  async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
  
  // Retirer le splash screen après un court délai
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Gestion des albums'),
      routes: {},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

 

  @override
  Widget build(BuildContext context) {
    final listePages = <Widget>[
      const PageAccueil(),
      const ListeAlbums(),
      const PageParametres(),
    ];

    return Scaffold(
      appBar: AppBar_Principal(
        title: widget.title,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: listePages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.music_note),
            label: 'Liste des albums',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0 ? FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PageAjoutAlbums()),
          );
          // Si un album a été ajouté, naviguer vers la liste des albums
          if (result == true) {
            setState(() {
              _currentIndex = 1; // Aller à l'onglet "Liste des albums"
            });
          }
        },
        tooltip: 'Ajouter un album',
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
