import 'package:awsshop/services/products/product_service.dart';
import 'package:flutter/material.dart';
import 'package:awsshop/components/landing/landing_product.dart';
import 'package:awsshop/models/product.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  _Landing createState() => _Landing();
}

class _Landing extends State<LandingView> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: futureProducts,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra un indicador de carga mientras se obtienen los datos
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Muestra un mensaje de error si algo sale mal
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Muestra un mensaje si no hay datos
          return const Scaffold(
            body: Center(child: Text('No hay productos disponibles')),
          );
        } else {
          final List<Product> products = snapshot.data!;
          return FullScreenSlider(
            pages: products.map((product) => ProductItemLanding(product: product)).toList(),
          );
        }
      },
    );
  }
}

class FullScreenSlider extends StatelessWidget {
  final List<Widget> pages;

  const FullScreenSlider({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: pages,
      ),
    );
  }
}
