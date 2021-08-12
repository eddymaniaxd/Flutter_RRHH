import 'dart:convert';


Vacaciones vacacionesFromMap(String str) => Vacaciones.fromMap(json.decode(str));

String vacacionesToMap(Vacaciones data) => json.encode(data.toMap());

class Vacaciones  {
    Vacaciones ({
  required this.vacaciones,
  required this.total,
  required this.parPaginacion,
  });
  List<Vacacion> vacaciones;
  int total;
  ParPaginacion parPaginacion;
  

 
  
  factory Vacaciones.fromMap (Map <String, dynamic>json) => Vacaciones(
  vacaciones:  List<Vacacion>.from(
            json["vacaciones"].map((x) => Vacaciones.fromMap(x))),
  total: json["total"], 
  parPaginacion: ParPaginacion.fromMap(json["parPaginacion"]),
  );

 Map<String, dynamic> toMap()=> {
   "vacaciones": List<dynamic>.from(vacaciones.map((x) => x.toMap())),
   "total": total,
   "parPaginacion": parPaginacion.toMap(),
};
}
class ParPaginacion {
  ParPaginacion({
    required this.pagActual,
    required this.totPaginas,
  });

  final int pagActual;
  final int totPaginas;

  factory ParPaginacion.fromMap(Map<String, dynamic> json) => ParPaginacion(
        pagActual: json["pagActual"],
        totPaginas: json["totPaginas"],
      );

  Map<String, dynamic> toMap() => {
        "pagActual": pagActual,
        "totPaginas": totPaginas,
      };
}

class Vacacion {
  int id;
  DateTime fechaini;
  DateTime fechafin;
  int dias;
  String observacion;
  int empleado;
  int activo;
  int eliminado;
  DateTime createdAt;
  DateTime updatedAt;

  Vacacion({
    required this.id,
    required this.fechaini,
    required this.fechafin,
    required this.dias,
    required this.observacion,
    required this.empleado,
    
    required this.activo,
    required this.eliminado,
    required this.createdAt,
    required this.updatedAt,
  });


  factory Vacacion.fromMap(Map<String, dynamic> json) => Vacacion(
        id: json["id"],
        
        fechaini: DateTime.parse(json["fecha_ini"]),
        fechafin:  DateTime.parse(json["fecha_fin"]),
        
        dias: json["dias"],
        observacion: json["observacion"],
        empleado: json["empleado_id"],
      
        activo: json["activo"],
        eliminado: json["eliminado"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fecha_ini": fechaini,
        "fecha_fin": fechafin,
        "dias": dias,
        "observacion": observacion,
        "empleado_id": empleado,
        
        //"fecha_nacimiento":
          //  "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        
        "activo": activo,
        "eliminado": eliminado,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
