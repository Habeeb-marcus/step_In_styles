// best seller page with list of products of best seller using my product_card widget in  grid view with 2 col

import 'package:flutter/material.dart';
import 'package:step_in_style/core/components/cards/product_card.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/models/product_card.dart';
import 'package:step_in_style/presentation/animations/fade_in_slide.dart';

class BestSellerPage extends StatefulWidget {
  const BestSellerPage({super.key});

  @override
  State<BestSellerPage> createState() => _BestSellerPageState();
}

class _BestSellerPageState extends State<BestSellerPage> {
  List<ProductCard> products = [
     ProductCard(
      title: 'Nike Air Max',
      price: '200.00',
      image: 'assets/images/nike.png',
    ),
     ProductCard(
      title: 'Puma Suede',
      price: '150.00',
      image: 'assets/images/puma.png',
    ),
     ProductCard(
      title: 'Adidas Superstar',
      price: '180.00',
      image: 'assets/images/adidas.png',
    ),
     ProductCard(
      title: 'Converse All Star',
      price: '120.00',
      image: 'assets/images/converse.png',
    ),
     ProductCard(
      title: 'Helix Sandals',
      price: '50.00',
      image: 'assets/images/helix.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Sellers',
        
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        ),

        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
         shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: sizer(true, 15, context),
                      mainAxisSpacing: 17,
                      childAspectRatio: sizer(true, 152, context) /
                          sizer(false, 201, context),
                    ),
        itemCount: products.length,
        itemBuilder: (context, index) {
                      return 
                       InkWell(
                          onTap: () {
                            // Get.to(() => ProductDetail());
                            Navigator.pushNamed(context, AppRoutes.productDetailRoute);
                          },
                         child: FadeInSlide(
            duration: productData[index].anim_duration!,
                           child: product_card(
                              title: productData[index].title,
                              price: productData[index].price,
                              image: productData[index].image,
                                                 
                                                 ),
                         ),
                       );
                    },
      ),
    );
  }
}

