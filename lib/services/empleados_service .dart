import 'package:http/http.dart' as http;
import 'package:rrhh/models/empleados.dart';

class EmpleadosService {
  Future<List<Empleado>>? getEmpleados() async {
    final url = 'http://127.0.0.1:8000/api/empleados';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final empleadosResponse = empleadosFromMap(response.body);
      return empleadosResponse.empleados;
    }
    return [];
  }
}
