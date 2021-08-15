import 'package:flutter/material.dart';

import 'Drawer/widget_drawer.dart';
class BoletaVista extends StatefulWidget {
  

  @override
  _BoletaVistaState createState() => _BoletaVistaState();
}

class _BoletaVistaState extends State<BoletaVista> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Listado de Solicitudes Realizadas'),
      ),
      drawer: MenuLateral(),
    )
    
    );

  }
  }
