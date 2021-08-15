// To parse this JSON data, do
//
//     final solicitudVacacion = solicitudVacacionFromMap(jsonString);

import 'dart:convert';

SolicitudVacacion solicitudVacacionFromMap(String str) => SolicitudVacacion.fromMap(json.decode(str));

String solicitudVacacionToMap(SolicitudVacacion data) => json.encode(data.toMap());

class SolicitudVacacion {
    SolicitudVacacion({

        required this.vacaciones,
    });

    
    final List<Vacacione> vacaciones;

    factory SolicitudVacacion.fromMap(Map<String, dynamic> json) => SolicitudVacacion(
        
        vacaciones: List<Vacacione>.from(json["vacaciones"].map((x) => Vacacione.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {

        "vacaciones": List<dynamic>.from(vacaciones.map((x) => x.toMap())),
    };
}

class Vacacione {
    Vacacione({
        required this.id,
        required this.fechaIni,
        required this.fechaFin,
        required this.dias,
        required this.observacion,
        required this.estado,
    });

    final int id;
    final DateTime fechaIni;
    final DateTime fechaFin;
    final int dias;
    final String observacion;
    final String estado;

    factory Vacacione.fromMap(Map<String, dynamic> json) => Vacacione(
        id: json["id"],
        fechaIni: DateTime.parse(json["fecha_ini"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        dias: json["dias"],
        observacion: json["observacion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fecha_ini": "${fechaIni.year.toString().padLeft(4, '0')}-${fechaIni.month.toString().padLeft(2, '0')}-${fechaIni.day.toString().padLeft(2, '0')}",
        "fecha_fin": "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "dias": dias,
        "observacion": observacion,
        "estado": estado,
    };
}
