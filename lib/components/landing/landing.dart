/* import 'package:flutter/material.dart';
import 'package:awsshop/models/product.dart';
import 'package:awsshop/components/landing/landing_product.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // Simulación de productos con múltiples imágenes
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
        'https://via.placeholder.com/800x400.png?text=Samsung+Galaxy+S21',
        'https://via.placeholder.com/800x400.png?text=Galaxy+S21+Front',
      ],
    ),
    // Añadir más productos si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItemLanding(product: products[index]);
        },
    );
  }
}
 */

import 'package:awsshop/components/landing/landing_product.dart';
import 'package:awsshop/models/product.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  /* final List<Product> products; */

  const Landing({super.key /* , required this.products */});

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
      // Añadir más productos si es necesario
    ];

    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ProductItemLanding(product: products[index]),
          );
        },
      );
  }
}
