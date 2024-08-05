import 'package:awsshop/components/landing/media_item.dart';
import 'package:awsshop/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductItemLanding extends StatefulWidget {
  final Product product;

  const ProductItemLanding({super.key, required this.product});

  @override
  ProductItemLandingState createState() => ProductItemLandingState();
}

class ProductItemLandingState extends State<ProductItemLanding> {
  late List<Media> mediaItems;
  late CarouselController _carouselController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    mediaItems = widget.product.media ?? [];
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerHeight = constraints.maxHeight;

        return Column(
          children: [
            SizedBox(
              height: containerHeight * 0.9,
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: !_isVideoPlaying,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  onPageChanged: (index, reason) {
                    if (mediaItems[index].type == 'VIDEO') {
                      setState(() {
                        _isVideoPlaying = true;
                      });
                    } else {
                      setState(() {
                        _isVideoPlaying = false;
                      });
                    }
                  },
                ),
                items: mediaItems.map((media) {
                  return MediaItem(
                    mediaUrl: media.url!,
                    isVideo: media.type == 'VIDEO',
                    onVideoFinish: () {
                      setState(() {
                        _isVideoPlaying = false;
                      });
                      _carouselController.nextPage();
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              height: containerHeight * 0.1,
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.name ?? 'Nombre del producto',
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.product.price != null
                        ? '\$${widget.product.price!.toStringAsFixed(2)}'
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
}
