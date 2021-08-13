import 'package:flutter/material.dart';
import 'package:rrhh/Drawer/widget_drawer.dart';
import 'package:rrhh/models/vacaciones.dart';
import 'package:rrhh/services/vacaciones_service.dart';
class VacacionVista extends StatefulWidget {
   @override
  _VacacionVistaState createState() => _VacacionVistaState();
}

  class _VacacionVistaState extends State<VacacionVista> {
    TextEditingController controllerFini = new TextEditingController(); 
    TextEditingController controllerFin = new TextEditingController(); 
    TextEditingController controllerObs = new TextEditingController(); 
  
  
  //DateTime _dateTime[12,12];
  var selectDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: 
      AppBar(
        title: Text('Please Fill The Form'),
      ),
      body: Column(
        children: [
        new Text('Solicite su Vacacion!'),
          _fechainitextfield(),
              SizedBox(
                height: 15,
              ),
              _fechafintextfield(),
              SizedBox(
                height: 20.0,
              ),
   
              _obsertextfield(),
              SizedBox(
                height: 20.0,
              ),
              _bottomSoli(),
                  SizedBox(
                height: 20.0,
              ),
          
              _bottomSVerSolic(),

        ],
      ),
      drawer: MenuLateral(),
      ),
      );
   }

  Widget _fechainitextfield() {
    return StreamBuilder(
      // ignore: non_constant_identifier_names
      builder: (BuildContext context, AsyncSnapshot) {
        return Container (
          padding: EdgeInsets.all(20),
           child: TextFormField(
            controller: controllerFini ,
             decoration: InputDecoration(
               labelText: 'Fecha Inicio',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300], 
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          )
          );
    });
    
  }

  Widget _fechafintextfield() {
  return StreamBuilder(
      // ignore: non_constant_identifier_names
      builder: (BuildContext context, AsyncSnapshot) {
        return Container (
            padding: EdgeInsets.all(20),
           child: TextFormField(
            controller: controllerFin ,
             decoration: InputDecoration(
               labelText: 'Fecha Final',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300], 
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          )
          );

    });
    
  }

  Widget _obsertextfield() {
return StreamBuilder(
      // ignore: non_constant_identifier_names
      builder: (BuildContext context, AsyncSnapshot) {
        return Container (
          padding: EdgeInsets.all(20),
           child: TextFormField(
            controller: controllerObs ,
             decoration: InputDecoration(
               labelText: 'Observacion',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300], 
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          )
        );
    });
    
  }
    

String mensaje ="";
  Widget _bottomSoli() { //Agregar boton para mostrar vacaciones_solicitudes
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Enviar Solicitud'),
          ),
        onPressed: () async{
          
          Vacacion vacacion = new Vacacion (
            fechaIni: controllerFini.text, 
            fechaFin: controllerFin.text , 
            observacion:  controllerObs.text, );
          
          bool estado = await new VacacionesService().solivacacion(vacacion);
          if (estado){
            Navigator.pushNamed(context, '/dashboard'); //agregar vista listado solicitud (routes)
          }else {
            setState(() {
                mensaje = "Error!";
            });
          }
          
          });
    });
  }

Widget  _bottomSVerSolic() {
  
  return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ver Solicitud'),
          ),
          
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
          elevation: 10.0, 
          color: Colors.greenAccent,
          onPressed: () {
              Navigator.pushNamed(context, '/listadosolicitud');
          });
    });
}

  }

