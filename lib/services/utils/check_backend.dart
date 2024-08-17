// lib/services/backend_service.dart
import 'package:awsshop/services/utils/get_platfom.dart';
import 'package:http/http.dart' as http;

Future<void> checkBackend() async {
  String baseUrl = await getUrlByPlatform();

  try {
    final response = await http.get(Uri.parse('$baseUrl/products/1'));

    if (response.statusCode != 200) {
      throw Exception('Error en el backend: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Backend no disponible');
  }
}
