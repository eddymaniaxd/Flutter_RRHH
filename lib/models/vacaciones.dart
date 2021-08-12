
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
        required this.empleadoId,
    });

    final DateTime fechaIni;
    final DateTime fechaFin;
    final String observacion;
    final String empleadoId;


    factory Vacacion.fromMap(Map<String, dynamic> json) => Vacacion(
        fechaIni: DateTime.parse(json["fecha_ini"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        observacion: json["observacion"],
        empleadoId: json["empleado_id"],
    );

    Map<String, dynamic> toMap() => {
        "fecha_ini": "${fechaIni.year.toString().padLeft(4, '0')}-${fechaIni.month.toString().padLeft(2, '0')}-${fechaIni.day.toString().padLeft(2, '0')}",
        "fecha_fin": "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "observacion": observacion,
        "empleado_id": empleadoId,
    };
}
