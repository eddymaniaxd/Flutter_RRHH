import 'package:http/http.dart' as http;
import 'package:rrhh/models/empleados.dart';

class EmpleadosDatosService {
  Future<EmpleadoDatos?> showdatosemp() async {
    final url = 'https://getdataproject.com/rrhh/public/api/empleados/datos?empleado_id=124';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final datosresponse = empleadoDatosFromMap (response.body);
      return datosresponse;
    
    }
   return null;
  }
}
