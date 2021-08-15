import 'package:flutter/material.dart';
import 'package:rrhh/models/empleados.dart';
import 'package:rrhh/services/empleados_service%20.dart';

import 'Drawer/widget_drawer.dart';


class ListadoEmpleado extends StatefulWidget {
  

  @override
  _ListadoEmpleadoState createState() => _ListadoEmpleadoState();
}

class _ListadoEmpleadoState extends State<ListadoEmpleado> {
  @override
  void didUpdateWidget(ListadoEmpleado oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Datos'),
        actions: <Widget>[
        //  ElevatedButton(
          //    style: ButtonStyle(
            //    backgroundColor: MaterialStateProperty.all<Color>(
              //    Theme.of(context).primaryColor,
                //),
              //),
              //onPressed: () {
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => ListadoEmpleados()),
                //);
              //},
              //child: Text("Ver Empleado")),
        ],
      ),
      
      drawer: MenuLateral(), //Importo menu lateral desde la carpeta drawer
      
      body: FutureBuilder<EmpleadoDatos?>(
        future: EmpleadosDatosService().showdatosemp(),
        builder: (BuildContext context, AsyncSnapshot<EmpleadoDatos?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
             // itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                EmpleadoDatos item = snapshot.data!;
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (DismissDirection direction) {
                    // ClientDatabaseProvider.db.deleteClientWithId(item.id);
                  },
                  child: ListTile(
                    
                    title: Text(item.profesion),
                    subtitle: Text(item.sucursal),
                    leading: CircleAvatar(
                      child: Text(item.sueldoBasico),
                      
                    ),
                  
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => AddEditClientPage(
                      //       true,
                      //       client: item,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  }
