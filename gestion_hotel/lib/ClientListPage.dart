import 'dart:html';

import 'package:flutter/material.dart';


class ClientListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Le widgetListTile"),
            ),
      body :ListView(
         children : <Widget>[
           ListTile(
            title : Text('John Doe'),
            subtitle : Text('Chambre 12 - Tel: 12345678 - Email: john.doe@example.com - Arrivée: 01/01/2020 - Sortie: 05/01/2020 - Chambre: Deluxe'),
           
          ),
         ListTile(
            title : Text('Jane Doe'),
            subtitle: Text('Chambre 18 - Tel: 87654321 - Email: jane.doe@example.com - Arrivée: 02/01/2020 - Sortie: 03/01/2020 - Chambre: Standard'),
           
          ),
         ListTile(
            title : Text('James Smith'),
            subtitle: Text('Chambre 25'),
           
          ),
        ],
      ),
      ),
    );
  }
}







