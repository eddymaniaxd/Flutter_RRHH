// To parse this JSON data, do
//
//     final boletasDatos = boletasDatosFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BoletasDatos boletasDatosFromMap(String str) => BoletasDatos.fromMap(json.decode(str));

String boletasDatosToMap(BoletasDatos data) => json.encode(data.toMap());

class BoletasDatos {
    BoletasDatos({

        required this.boletas,
    });


    final List<Boleta> boletas;

    factory BoletasDatos.fromMap(Map<String, dynamic> json) => BoletasDatos(

        boletas: List<Boleta>.from(json["boletas"].map((x) => Boleta.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {

        "boletas": List<dynamic>.from(boletas.map((x) => x.toMap())),
    };
}

class Boleta {
    Boleta({
        required this.id,
        required this.empleadoId,
        required this.nombres,
        required this.primerApellido,
        required this.segundoApellido,
        required this.ci,
        required this.ciexp,
        required this.liquidoPagable,
        required this.cargo,
        required this.periodo,
        required this.createdAt,
        required this.pagado,
        required this.fechaPago,
    });

    final int id;
    final int empleadoId;
    final String nombres;
    final String primerApellido;
    final String segundoApellido;
    final String ci;
    final String ciexp;
    final String liquidoPagable;
    final String cargo;
    final String periodo;
    final DateTime createdAt;
    final int pagado;
    final DateTime fechaPago;

    factory Boleta.fromMap(Map<String, dynamic> json) => Boleta(
        id: json["id"],
        empleadoId: json["empleado_id"],
        nombres: json["nombres"],
        primerApellido: json["primer_apellido"],
        segundoApellido: json["segundo_apellido"],
        ci: json["ci"],
        ciexp: json["ciexp"],
        liquidoPagable: json["liquido_pagable"],
        cargo: json["cargo"],
        periodo: json["periodo"],
        createdAt: DateTime.parse(json["created_at"]),
        pagado: json["pagado"],
        fechaPago: json["fecha_pago"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "empleado_id": empleadoId,
        "nombres": nombres,
        "primer_apellido": primerApellido,
        "segundo_apellido": segundoApellido,
        "ci": ci,
        "ciexp": ciexp,
        "liquido_pagable": liquidoPagable,
        "cargo": cargo,
        "periodo": periodo,
        "created_at": createdAt.toIso8601String(),
        "pagado": pagado,
        "fecha_pago": fechaPago,
    };
}
