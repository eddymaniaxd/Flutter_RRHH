import 'package:flutter/material.dart';
import 'package:rrhh/Drawer/widget_drawer.dart';
class Vacacion extends StatefulWidget {
 

  @override
   VacacionState createState() =>  VacacionState();
}

class  VacacionState extends State <Vacacion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: Text('SOLICITE SU VACACION!'),
        ),
        drawer: MenuLateral(),
      ),
      );
  }
}