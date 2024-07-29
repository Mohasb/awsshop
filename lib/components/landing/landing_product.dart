/* import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awsshop/models/product.dart';

class ProductItemLanding extends StatelessWidget {
  final Product product;

  const ProductItemLanding({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Carrusel de imágenes
            Expanded(
              flex: 9,
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
                items: product.imageList
                        ?.map((imageUrl) => _buildImageItem(imageUrl))
                        .toList() ??
                    [],
              ),
            ),
            // Información del producto
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? 'Nombre del producto',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.price != null
                            ? '\$${product.price!.toStringAsFixed(2)}'
                            : 'Sin precio',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
 */

/* import 'package:awsshop/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductItemLanding extends StatelessWidget {
  final Product product;

  const ProductItemLanding({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Carrusel de imágenes que ocupa el 90% de la altura
          Expanded(
            flex: 9,
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
          // Información del producto que ocupa el 10% de la altura
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(20.0),
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
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
} */

import 'package:awsshop/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductItemLanding extends StatelessWidget {
  final Product product;

  const ProductItemLanding({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Altura del contenedor de acuerdo con el tamaño del viewport
          double containerHeight = constraints.maxHeight;

          return Column(
            children: [
              // Carrusel de imágenes que ocupa el 90% de la altura del contenedor
              Flexible(
                flex: 9,
                child: Container(
                  height: containerHeight * 0.8, // Ajusta la altura
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
              ),
              // Información del producto que ocupa el 10% de la altura del contenedor
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(20.0),
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
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
