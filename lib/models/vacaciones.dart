import 'package:rrhh/askvacacion.dart';
import 'package:rrhh/models/empleados.dart';

class Vacaciones  {
  final int total;

  final ParPaginacion parPaginacion;

  final List<Vacacion> vacaciones;

  Vacaciones ({
  required this.vacaciones,
  required this.total,
  required this.parPaginacion,
  });
  
  factory Vacaciones.fromMap (Map <String, dynamic>json) => Vacaciones(
  vacaciones: 
  List<Vacacion>.from(json["vacaciones"].map((x) => Vacaciones.fromMap(x))),
  total: json["total"], 
  parPaginacion: ParPaginacion.fromMap(json["parPaginacion"]),
  );

}