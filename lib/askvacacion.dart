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
    TextEditingController controllerEp = new TextEditingController(); 
  
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
              _empleadotextfield(),
              SizedBox(
                height: 15,
              ),
              _obsertextfield(),
              SizedBox(
                height: 20.0,
              ),
              _bottomSoli(),

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
            controller: controllerFin ,
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
  Widget _bottomSoli() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Enviar Solicitud'),
          ),
        onPressed: () async{
          
          Vacacion vacacion = new Vacacion (fechaIni: DateTime.parse(
          controllerFini.text), fechaFin: DateTime.parse(controllerFin.text)  , 
          observacion:  controllerObs.text, empleadoId: controllerEp.text);
          
          bool estado = await new VacacionesService().solivacacion(vacacion);
          if (estado){
            Navigator.pushNamed(context, '');
          }else {
            setState(() {
                mensaje = "Error!";
            });
          }
          
          });
    });
  }

  Widget _empleadotextfield() {
return StreamBuilder(
      // ignore: non_constant_identifier_names
      builder: (BuildContext context, AsyncSnapshot) {
        return Container (
          padding: EdgeInsets.all(20),
           child: TextFormField(
            controller: controllerEp ,
             decoration: InputDecoration(
               labelText: 'EmpleadoID',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300], 
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          )
        );
    });

  } 
  }

