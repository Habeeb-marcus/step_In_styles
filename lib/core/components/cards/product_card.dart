// import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/providers/wishlist_provider.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/models/product_card.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';

class product_card extends ConsumerStatefulWidget {
  const product_card({
    super.key,
    list,
    required this.title,
    required this.price,
    required this.image,
    this.addToWishlist,
    this.detailPageFunc,
    this.isFavoritePage = false,
  });

  final String title;
  final String price;
  final String image;
  final VoidCallback? addToWishlist, detailPageFunc;
  final bool isFavoritePage;

  @override
  ConsumerState<product_card> createState() => _product_cardState();
}

class _product_cardState extends ConsumerState<product_card> {
   bool isLoved = false;
    void _toggleLoveState() {
    setState(() {
      isLoved = true; // Set the icon to the "loved" state immediately
    });

  // Create a delay before reverting the icon back to its default state
  Future.delayed(const Duration(milliseconds: 500), () {
    if (mounted) { // Check if the widget is still in the tree
      setState(() {
        isLoved = false; // Safely revert the icon to its "unloved" state
      });
    }
  });
  }
  @override
  Widget build(BuildContext context, ) {
    return GestureDetector(
      onTap: widget.detailPageFunc,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(sizer(true, 8, context)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: sizer(false, 97, context),
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                  VSpace.medium,
                  Text(
                    'BEST SELLER',
                    textAlign: TextAlign.start,
                    style: AppTextStyle.bodyThree.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'SFProDisplay',
                      fontSize: sizer(true, 10, context),
                    ),
                  ),
                  Wrap(children: [
                    Text(
                      widget.title,
                      style: AppTextStyle.bodyThree.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: sizer(true, 14, context),
                      ),
                    ),
                  ]),
                  VSpace.small,
                  Text(
                    '\$${widget.price}.00',
                    style: AppTextStyle.bodyThree.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
         Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: () {
                  _toggleLoveState(); // Call this function when the icon is tapped

                  // Your existing onTap logic here
                  HapticFeedback.lightImpact();
                  final ProductCard product = ProductCard(
                      title: widget.title,
                      price: widget.price,
                      image: widget.image);
                  
                  if (widget.isFavoritePage) {
                    ref.read(wishlistProvider.notifier).removeProductFromWishlist(product);
                  } else {
                    ref.read(wishlistProvider.notifier).addProductToWishlist(product);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      isLoved ? Icons.favorite : widget.isFavoritePage == true? Icons.delete : Icons.favorite_border,
                      color: isLoved ?Colors.red: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
              // InkWell(
              //   splashColor: Colors.transparent,
              //   onTap: () {
              //     // Create a Product object from the card's details
              //     HapticFeedback.lightImpact();
              //     final ProductCard product = ProductCard(
              //         title: widget.title,
              //         price: widget.price,
              //         image: widget.image);
              //     // Add the product to the wishlist
              //     // addToWishlist!(product);
              //     widget.isFavoritePage == true
              //         ? ref
              //             .read(wishlistProvider.notifier)
              //             .removeProductFromWishlist(product)
              //         : ref
              //             .read(wishlistProvider.notifier)
              //             .addProductToWishlist(product);
              //     // Navigator.of(context).pushNamed(AppRoutes.favoritePageRoute);
              //   },
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       color:
              //           Colors.blue, // Set your desired background color here
              //       borderRadius: BorderRadius.only(
              //           topRight: Radius.circular(20),
              //           bottomLeft:
              //               Radius.circular(20) // Adjust for circular corners
              //           ), // Adjust for circular corners
              //     ),
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.all(8), // Set your desired padding
              //       child: Icon(
              //         widget.isFavoritePage == true
              //             ? Icons.delete
              //             : Icons.favorite_border, // Cross icon
              //         color: Colors.white, // Set your desired icon color here
              //         size: 24, // Set your desired icon size here
              //       ),
              //     ),
              //   ),
              // ),
         
         
         
            
          ],
        ),
      ),
    );
  }
}
