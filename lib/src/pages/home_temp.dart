import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  // Forma larga
  /*List<Widget> _crearItems() {
    List<Widget> lista = List<Widget>();
    for (String i in opciones) {
      final tempWidget = ListTile(
        title: Text(i),
      );

      lista..add(tempWidget)
           ..add(Divider());
    }

    return lista;
  }*/

  // Forma corta
  List<Widget> _crearItems() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () { },
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
