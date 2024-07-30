import 'package:awsshop/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductItemLanding extends StatelessWidget {
  final Product product;

  const ProductItemLanding({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Usar LayoutBuilder para obtener el tamaño del contenedor padre
        double containerHeight = constraints.maxHeight;

        return Column(
          children: [
            // Carrusel de imágenes que ocupa el 90% de la altura del contenedor
            Container(
              height: containerHeight * 0.9,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: product.imageList?.map((imageUrl) => _buildImageItem(imageUrl)).toList() ?? [],
              ),
            ),
            // Información del producto que ocupa el 10% de la altura del contenedor
            Container(
              height: containerHeight * 0.1,
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name ?? 'Nombre del producto',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    product.price != null
                        ? '\$${product.price!.toStringAsFixed(2)}'
                        : 'Sin precio',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
