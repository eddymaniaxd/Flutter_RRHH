

import 'package:http/http.dart' as http;
import 'package:rrhh/models/vacaciones.dart';

class VacacionesService {
  Future<bool> solivacacion(Vacacion vacacion) async {
    final url = 'http://127.0.0.1:8000/api/vacaciones/solicitud';
    var vac = vacacionToMap(vacacion);
    final response = await http.post(Uri.parse(url),
    body: vac,
    headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }else 
    return false;
  }
}
