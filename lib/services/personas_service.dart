import 'package:http/http.dart' as http;
import 'package:rrhh/models/personas.dart';

class PersonasService {
  Future<List<Persona>>? getPersonas() async {
    final url = 'http://127.0.0.1:8000/api/personas';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final personasResponse = personasFromMap(response.body);
      return personasResponse.personas;
    }
    return [];
  }
}
