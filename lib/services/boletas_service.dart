import 'package:http/http.dart' as http;
import 'package:rrhh/models/boletas.dart';


class BoletasService {
  Future<List<Boleta>>? getBoletas() async {
    final url = 'https://getdataproject.com/rrhh/public/api/boletas?empleado_id=124';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final boletasresponse= boletasDatosFromMap(response.body);
      return boletasresponse.boletas;
    }
    return [];
  }
}