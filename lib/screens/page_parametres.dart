import 'package:flutter/material.dart';

class PageParametres extends StatelessWidget {
  const PageParametres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Card(
            child: Row(
              children: const <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "Configurer les paramètres de l'application",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Work in progress"),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Param2",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Work in progress"),
              ],
            ),
          ),
        ),  
        ],
      ),
    );
  }
}
