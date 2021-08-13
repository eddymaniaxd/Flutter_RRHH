import 'package:flutter/material.dart';
import 'package:rrhh/Drawer/widget_drawer.dart';

class VistaSolicitudes extends StatefulWidget {
  VistaSolicitudes({Key? key}) : super(key: key);

  @override
  _VistaSolicitudesState createState() => _VistaSolicitudesState();
}

class _VistaSolicitudesState extends State<VistaSolicitudes> {
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