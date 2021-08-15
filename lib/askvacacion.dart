import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rrhh/Drawer/widget_drawer.dart';
import 'package:rrhh/models/vacaciones.dart';
import 'package:rrhh/services/vacaciones_service.dart';
import 'package:http/http.dart' as http;

class VacacionVista extends StatefulWidget {
  @override
  _VacacionVistaState createState() => _VacacionVistaState();
}

class _VacacionVistaState extends State<VacacionVista> {
  var empleado_id = "124";
  TextEditingController controllerFini = new TextEditingController();
  TextEditingController controllerFin = new TextEditingController();
  TextEditingController controllerObs = new TextEditingController();
//Controladores para mostrar dias disponibles y Controlador para mostrar dias solicitados
  TextEditingController controllerDiasdispo = new TextEditingController();
  TextEditingController controllerDiasolic = new TextEditingController();
  //bool _enabled = false;

  //DateTime _dateTime[12,12];
  var totdias = '';
  void diasSolicitados() async {
    var fechaIni = controllerFini.text;
    var fechaFin = controllerFin.text;
    var url = Uri.parse(
        'https://getdataproject.com/rrhh/public/api/vacaciones/dias-vacaciones?fecha_ini=' +
            fechaIni +
            '&fecha_fin=' +
            fechaFin);
    var response = await http.get(url);
    //var data = json.decode(response.body);
    controllerDiasolic.text = response.body;
  }

  void diasDisponibles() async {
    var url = Uri.parse(
        'https://getdataproject.com/rrhh/public/api/vacaciones/dias?empleado_id=' +
            empleado_id);
    var response = await http.get(url);
    var data = json.decode(response.body);
    var dias_vacaciones = data["dias_vacaciones"];
    var dias_aprobados = data["dias_aprobados"];
    var dias_diponibles = dias_vacaciones - dias_aprobados;
    controllerDiasdispo.text = dias_diponibles.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Please Fill The Form'),
        ),
        body: Column(
          children: [
            new Text('Solicite su Vacacion!'),
            _fechainitextfield(),
            SizedBox(
              height: 1.0,
            ),
            _fechafintextfield(),
            SizedBox(
              height: 1.0,
            ),
            _diasdispontextfield(),
      
            SizedBox(
                //height: 1.0,
                ),
            _totaldiassoltextfield(),
            SizedBox(
              height: 2.0,
            ),
            _obsertextfield(),
            SizedBox(
              height: 2.0,
            ),
            _bottomSVerificar(),
            SizedBox(
              height: 2.0,
            ),
            _bottomSoli(),
            SizedBox(
              height: 2.0,
            ),
            _bottomSVerSolic(),
            SizedBox(
              height: 2.0,
            ),
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
      return Container(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: controllerFini,
            decoration: InputDecoration(
              labelText: 'Fecha Inicio',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _fechafintextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: EdgeInsets.all(20),
        child: TextFormField(
          controller: controllerFin,
          decoration: InputDecoration(
            labelText: 'Fecha Final',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.grey[300],
            filled: true,
            //hintText: "Ingresa fecha final vacacional"
          ),
        ),
      );
    });
  }

  Widget _diasdispontextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            readOnly: true,
            controller: controllerDiasdispo,
            decoration: InputDecoration(
                labelText: 'Dias disponibles',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: "Ingresa fecha final vacacional"),
          ));
    });
  }

  Widget _totaldiassoltextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            readOnly: true,
            controller: controllerDiasolic,
            decoration: InputDecoration(
              labelText: 'Total dias solicitados',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _obsertextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: controllerObs,
            decoration: InputDecoration(
              labelText: 'Observacion',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  String mensaje = "";
  Widget _bottomSoli() {
    //Agregar boton para mostrar vacaciones_solicitudes
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text('Enviar Solicitud'),
          ),
          onPressed: () async {
            Vacacion vacacion = new Vacacion(
              fechaIni: controllerFini.text,
              fechaFin: controllerFin.text,
              observacion: controllerObs.text,
              empleado_id: empleado_id,
            );
            var dias_diponibles = int.parse(controllerDiasdispo.text);
            var dias_solicitados = int.parse(controllerDiasolic.text);
            if (dias_diponibles >= dias_solicitados) {
              bool estado =
                  await new VacacionesService().solivacacion(vacacion);
              if (estado) {
                Navigator.pushNamed(context,'/dashboard'); //agregar vista listado solicitud (routes)
              } else {
                setState(() {
                  mensaje = "Error!";
                });
              }
            } else {/// alert, mensaje que diga "los dias solicitados es mayor a los dias que disponibles de vacaciones"
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context)=> AlertDialog(
                    title: Text('ERROR! Ya no tienes dias disponibles para tu vacacion'),
                    
                    content: Text('Dias solicitados es mayor a los dias  disponibles'),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(onPressed: (){
                            Navigator.pushNamed(context, '/askvacacion');
                      },
                       child: Text('Volver'))
                    ],
                    //backgroundColor: Colors.redAccent,
                    //shape: CircleBorder(),
                  ),
                  );
            }
          });
    });
  }

  Widget _bottomSVerSolic() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text('Ver Solicitud'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () {
            Navigator.pushNamed(context, '/listadosolicitud');
          });
    });
  }

  Widget _bottomSVerificar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text('Verificar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () {
            diasDisponibles();
            diasSolicitados();
          });
    });
  }
}
