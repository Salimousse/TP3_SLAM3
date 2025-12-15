 import 'package:flutter/material.dart ';
import 'package:flutter_application_2/services/connexionAlbumAPI.dart';
 

 class PageAjoutAlbums  extends StatefulWidget {
   const PageAjoutAlbums ({Key? key}) : super (key: key);

   @override
   State<PageAjoutAlbums > createState() => _PageAjoutAlbumsState();



 }


  class _PageAjoutAlbumsState extends State<PageAjoutAlbums > {
    final _formKey = GlobalKey<FormState>();
    String? _nomalbum;
    String? _descalbum;
    String? _artistealbum;
    String? _pochettealbum;
    bool _groupealbum = false;
    String? _compoAlbum;
    String? _linkyoualbum ;
    String? _linkartiestalbum ;

    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter un album'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom de l\'album',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le nom de l\'album';
                    }
                    _nomalbum = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer la description de l\'album';
                    }
                    _descalbum = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Artiste',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le nom de l\'artiste';
                    }
                    _artistealbum = value;
                    return null;
                  },
                ),
                SwitchListTile(
                  title: const Text( 'groupe'),
                  value: _groupealbum,
                  onChanged: (bool value) {
                    setState(() {
                      _groupealbum = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Pochette (URL)',
                  ),
                  validator: (value) {
                    _pochettealbum = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Compositeur',
                  ),
                  validator: (value) {
                    _compoAlbum = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Lien YouTube',
                  ),
                  validator: (value) {
                    _linkyoualbum = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Lien Artiste',
                  ),
                  validator: (value) {
                    _linkartiestalbum = value;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                     
                      
                      bool success = await ConnexionAlbumAPI().createAlbum(
                        _nomalbum!, 
                        _descalbum!, 
                        _artistealbum!, 
                        _groupealbum, 
                        _pochettealbum ?? '', 
                        _compoAlbum ?? '',
                        _linkyoualbum ?? '',
                        _linkartiestalbum ?? '',
                      
                      );
                      
                     
                      
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Album ajouté avec succès !')),
                        );
                        Navigator.pop(context, true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Erreur lors de l\'ajout de l\'album')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('Ajouter l\'album'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }