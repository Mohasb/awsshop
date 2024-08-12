/* import 'package:awsshop/models/product.dart';
import 'package:awsshop/services/products/product_service.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: (products.length + 2) ~/ 3 * 2,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  final productIndex = index ~/ 2 * 3;
                  if (productIndex < products.length) {
                    return _buildProductRow(context, [products[productIndex]]);
                  }
                } else {
                  final productIndex = index ~/ 2 * 3 + 1;
                  if (productIndex < products.length) {
                    final items = <Product>[];
                    items.add(products[productIndex]);
                    if (productIndex + 1 < products.length) {
                      items.add(products[productIndex + 1]);
                    }
                    return _buildProductRow(context, items);
                  }
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildProductRow(BuildContext context, List<Product> products) {
    if (products.length == 1) {
      final product = products[0];
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: product.imageList?.first ?? '',
              height: 200,
              fit: BoxFit.scaleDown,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/placeholder.png',
                  height: 200,
                  fit: BoxFit.scaleDown,
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(10.0),
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Fondo para el texto
                child: Column(
                  children: [
                    Text(product.description ?? '',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(product.price.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )),
          ),
        ],
      );
    } else {
      return Row(
        children: products.map((product) {
          return Expanded(
            child: Column(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: product.imageList?.first ?? '',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.scaleDown,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/placeholder.png', // Asegúrate de tener esta imagen en tus assets
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.scaleDown,
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  product.description ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  product.price.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        }).toList(),
      );
    }
  }
}
 */

import 'package:flutter/material.dart';

class ProductsGridPage extends StatelessWidget {
  const ProductsGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Grid de Productos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
