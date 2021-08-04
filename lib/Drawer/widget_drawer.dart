import 'package:flutter/material.dart';
class MenuLateral extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Drawer( //Drawer para crear el menu
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader( //Aca definimos el logo en el menu desplegable
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Expanded(child: 
              Image.asset('assets/images/rh.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          ),
      ListTile( //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
        leading: Icon(Icons.person),
        title: Text('Mis Empleados'),
        onTap: (){
          Navigator.pushNamed(context, '/listadoempleado');
        },
      ),
      ListTile( //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
        leading: Icon(Icons.airline_seat_flat),
        title: Text('Personas'),
        onTap: (){
          Navigator.pushNamed(context, '/listadopersona');
        },
      ),
      ListTile( //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
        leading: Icon(Icons.analytics_rounded),
        title: Text('Mis Datos'),
        onTap: (){},
      ),
      ListTile( //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
        leading: Icon(Icons.airplane_ticket),
        title: Text('Solicitar Vacacion'),
        onTap: (){},
      ),
      ListTile( //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
        leading: Icon(Icons.bedtime_rounded),
        title: Text('Log Out'),
        onTap: (){
          Navigator.pushNamed(context, '/loginpage');

        },
      ),
      ],
    ),
    );
  }
}