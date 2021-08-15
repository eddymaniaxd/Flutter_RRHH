
// To parse this JSON data, do
//
//     final vacacion = vacacionFromMap(jsonString);


import 'dart:convert';

Vacacion vacacionFromMap(String str) => Vacacion.fromMap(json.decode(str)); //String a object

String vacacionToMap(Vacacion data) => json.encode(data.toMap()); //Objeto  a String

class Vacacion {
    Vacacion({
        required this.fechaIni,
        required this.fechaFin,
        required this.observacion,
        required this.empleado_id
    });

    final String fechaIni;
    final String fechaFin;
    final String observacion;
    final String empleado_id;


    factory Vacacion.fromMap(Map<String, dynamic> json) => Vacacion(
        fechaIni: json["fecha_ini"],
        fechaFin: json["fecha_fin"],
        observacion: json["observacion"],
        empleado_id: json["empleado_id"],
    );

    Map<String, dynamic> toMap() => {
        "fecha_ini": fechaIni,
        "fecha_fin": fechaFin,
        "observacion": observacion,
        "empleado_id": empleado_id,
    };
}
