import 'package:http/http.dart' as http;
import 'package:rrhh/models/empleadosdatos.dart';

class EmpleadosService {
  Future<List<EmpleadoDatos>>? showdatosemp() async {
    final url = 'http://127.0.0.1:8000/api/empleados/datos?empleado_id=124';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final datosresponse = empleadoDatosFromMap (response.body);
    
    }
    return [];
  }
}
