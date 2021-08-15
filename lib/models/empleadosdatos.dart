// To parse this JSON data, do
//
//     final empleadoDatos = empleadoDatosFromMap(jsonString);

import 'dart:convert';

EmpleadoDatos empleadoDatosFromMap(String str) => EmpleadoDatos.fromMap(json.decode(str));

String empleadoDatosToMap(EmpleadoDatos data) => json.encode(data.toMap());

class EmpleadoDatos {

    EmpleadoDatos({
        required this.id,
        required this.correoCorporativo,
        required this.profesion,
        required this.activo,
        required this.persona,
        required this.cargo,
        required this.sucursal,
        required this.sueldoBasico,
        required this.fechaInicio,
        required this.fechaFinal,
    });

    final int id;
    final String correoCorporativo;
    final String profesion;
    final int activo;
    final String persona;
    final String cargo;
    final String sucursal;
    final String sueldoBasico;
    final DateTime fechaInicio;
    final DateTime fechaFinal;

    factory EmpleadoDatos.fromMap(Map<String, dynamic> json) => EmpleadoDatos(
        id: json["id"],
        correoCorporativo: json["correo_corporativo"],
        profesion: json["profesion"],
        activo: json["activo"],
        persona: json["persona"],
        cargo: json["cargo"],
        sucursal: json["sucursal"],
        sueldoBasico: json["sueldo_basico"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFinal: DateTime.parse(json["fecha_final"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "correo_corporativo": correoCorporativo,
        "profesion": profesion,
        "activo": activo,
        "persona": persona,
        "cargo": cargo,
        "sucursal": sucursal,
        "sueldo_basico": sueldoBasico,
        "fecha_inicio": "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fecha_final": "${fechaFinal.year.toString().padLeft(4, '0')}-${fechaFinal.month.toString().padLeft(2, '0')}-${fechaFinal.day.toString().padLeft(2, '0')}",
    };
}
