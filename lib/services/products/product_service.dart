// lib/services/product_service.dart
import 'dart:convert';
import 'package:awsshop/services/utils/get_platfom.dart';
import 'package:http/http.dart' as http;
import 'package:awsshop/models/Product.dart'; // Asegúrate de importar correctamente






Future<List<Product>> fetchAllProducts() async {

  final response = await http.get(Uri.parse('${getUrlByPlatform()}/products'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> productsJson = jsonResponse['data'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<Product> fetchOneProduct() async {
   final response = await http.get(Uri.parse('${getUrlByPlatform()}/products/1'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final Product productJson = jsonResponse['data'];
    return productJson;
  } else {
    throw Exception('Failed to load products');
  }
}
