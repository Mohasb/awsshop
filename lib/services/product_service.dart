// lib/services/product_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awsshop/models/Product.dart'; // Asegúrate de importar correctamente

Future<List<Product>> fetchProducts() async {

 String apiUrl = 'http://10.0.2.2:8080/api/products'; // Para emulador de Android
// String apiUrl = 'http://127.0.0.1:8080/api/products'; // Para emulador de iOS
// String apiUrl = 'http://<TU_IP>:8080/api/products'; // Para dispositivo físico
// String apiUrl = 'http://localhost:8080/api/products'; // Para pc o web


  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> productsJson = jsonResponse['data'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
