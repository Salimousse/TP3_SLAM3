import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/info_album.dart';
import 'package:flutter_application_2/screens/page_info_albums.dart';
import 'package:flutter_application_2/screens/page_liste_albums.dart';


class Album extends StatelessWidget {
    Album({Key? key, this.nomAlbum, this.description, this.nomGroupe, this.image}) 
      : super(key: key); 
   final String? nomAlbum; 
   final String? description; 
   final String? nomGroupe; 
   final String? image; 

   Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          InfoAlbum album = InfoAlbum(
            nomAlbum: nomAlbum ?? '',
            description: description ?? '',
            nomGroupe: nomGroupe ?? '',
            image: image ?? '',
          );

          final Function (List<Map<dynamic,dynamic>>)updateList;

          

    
          
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersive,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageInfoAlbums(album: album),
            ),
          );
        },
        child: Container(
         padding: EdgeInsets.all(2) ,   child: Card( 
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:    <Widget>[
                  Image.asset("assets/images/" +image!), Expanded(
                     child: Container(
                        padding: EdgeInsets.all(5), child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                              children: <Widget>[ 
                              
                              Text(this.nomAlbum!, style: TextStyle(fontWeight: 
                                 FontWeight.bold)), Text(this.description!), 
                              Text("Valeur: " + this.nomGroupe.toString()), 
                           ], 
                        )
                     )
                  )
               ]
            )
         ),


         
        ),
      );
   }
}
