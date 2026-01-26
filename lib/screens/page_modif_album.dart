import  'package:flutter/material.dart';
import 'package:flutter_application_2/services/connexionAlbumAPI.dart';
import 'package:flutter_application_2/models/DataClass/AlbumAPI.dart';
  
  
  class PageModifAlbum  extends StatefulWidget {
  final AlbumApi album;
  final int idAlbum;
  const PageModifAlbum({Key? key, required this.album, required this.idAlbum}) : super(key: key);

  @override
  State<PageModifAlbum> createState() => _PageModifAlbumState();
}

class _PageModifAlbumState extends State<PageModifAlbum> {
  // Formulaire de modification d'un album (tous les champs)
  final _formKey = GlobalKey<FormState>();
  // Contrôleurs pour chaque champ du formulaire
  late TextEditingController _nomController;
  late TextEditingController _descController;
  late TextEditingController _artisteController;
  late TextEditingController _pochetteController;
  late TextEditingController _compoController;
  late TextEditingController _linkYouController;
  late TextEditingController _linkArtisteController;
  late bool _groupealbum;

  @override
  // Initialisation des contrôleurs avec les valeurs de l'album à modifier
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.album.nomalbum ?? '');
    _descController = TextEditingController(text: widget.album.descalbum ?? '');
    _artisteController = TextEditingController(text: widget.album.artistealbum ?? '');
    _pochetteController = TextEditingController(text: widget.album.pochettealbum ?? '');
    _compoController = TextEditingController(text: widget.album.compositeuralbum ?? '');
    _linkYouController = TextEditingController(text: widget.album.linkyoualbum ?? '');
    _linkArtisteController = TextEditingController(text: widget.album.linkartistealbum ?? '');
    _groupealbum = widget.album.groupealbum;
  }

  @override
  // Libération des ressources des contrôleurs
  void dispose() {
    _nomController.dispose();
    _descController.dispose();
    _artisteController.dispose();
    _pochetteController.dispose();
    _compoController.dispose();
    _linkYouController.dispose();
    _linkArtisteController.dispose();
    super.dispose();
  }
// Page de modification d'album avec tous les champs et validation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier l\'album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom de l\'album'),
                // Validation du champ (obligatoire)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de l\'album';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description de l\'album';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _artisteController,
                decoration: const InputDecoration(labelText: 'Artiste'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de l\'artiste';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('Groupe'),
                value: _groupealbum,
                onChanged: (bool value) {
                  setState(() {
                    _groupealbum = value;
                  });
                },
              ),
              TextFormField(
                controller: _pochetteController,
                decoration: const InputDecoration(labelText: 'Pochette (URL)'),
              ),
              TextFormField(
                controller: _compoController,
                decoration: const InputDecoration(labelText: 'Compositeur'),
              ),
              TextFormField(
                controller: _linkYouController,
                decoration: const InputDecoration(labelText: 'Lien YouTube'),
              ),
              TextFormField(
                controller: _linkArtisteController,
                decoration: const InputDecoration(labelText: 'Lien Artiste'),
              ),
              const SizedBox(height: 20),


              // bouton pour valider en utlisant updatealbum 
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool success = await ConnexionAlbumAPI().updateAlbum(
                      widget.idAlbum,
                      _nomController.text,
                      _descController.text,
                      _artisteController.text,
                      _groupealbum,
                      _pochetteController.text,
                      _compoController.text,
                      _linkYouController.text,
                      _linkArtisteController.text,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Album modifié avec succès !')),
                      );
                      Navigator.pop(context, true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Erreur lors de la modification de l\'album')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('Enregistrer les modifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}