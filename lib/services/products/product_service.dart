import 'dart:convert';
import 'package:awsshop/services/utils/get_platfom.dart';
import 'package:http/http.dart' as http;
import 'package:awsshop/models/product.dart'; 

Future<List<Product>> fetchAllProducts() async {

String baseUrl = await getUrlByPlatform();

  final response = await http.get(Uri.parse('$baseUrl/products'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> productsJson = jsonResponse['data'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<Product> fetchOneProduct() async {
  
  String baseUrl = await getUrlByPlatform();

   final response = await http.get(Uri.parse('$baseUrl/products/1'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final Product productJson = jsonResponse['data'];
    return productJson;
  } else {
    throw Exception('Failed to load products');
  }
}
