import 'package:flutter/material.dart';
import 'package:awsshop/components/landing/landing_product.dart';
import 'package:awsshop/models/product.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        name: 'iPhone 13 Pro',
        price: 1299.99,
        description: 'El último iPhone con gran cámara y pantalla OLED.',
        imageList: [
          'https://m.media-amazon.com/images/I/71iIaQjJunL._AC_UF894,1000_QL80_.jpg',
          'https://thumb.pccomponentes.com/w-530-530/articles/57/578926/1959-apple-iphone-13-pro-128gb-grafito-libre.jpg',
          'https://media.ldlc.com/r1600/ld/products/00/05/88/59/LD0005885979_1_0005927925.jpg',
          'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202407/09/00194612400294____15__640x640.jpg',
        ],
      ),
      Product(
        id: 2,
        name: 'Samsung Galaxy S21',
        price: 999.99,
        description: 'Potente smartphone con cámara de alta resolución.',
        imageList: [
          'https://m.media-amazon.com/images/I/61SDL9BHt6L._AC_UF894,1000_QL80_.jpg',
          'https://images.samsung.com/is/image/samsung/p6pim/es/sm-a546blgceub/gallery/es-galaxy-a54-5g-sm-a546-sm-a546blgceub-thumb-535688426',
          'https://images.samsung.com/is/image/samsung/p6pim/es/sm-a057gzkueub/gallery/es-galaxy-a05s-sm-a057-sm-a057gzkueub-539177447?\$650_519_PNG\$',
        ],
      ),
      // Agregar más productos si es necesario
    ];

    return FullScreenSlider(
      pages: products.map((product) => ProductItemLanding(product: product)).toList(),
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
