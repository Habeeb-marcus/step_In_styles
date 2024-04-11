// e-commerce product detail page with o3d viewer to diplay product in 3d

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:o3d/o3d.dart';

import 'package:step_in_style/core/components/cards/card_product_desc.dart';
import 'package:step_in_style/core/providers/cartProvider.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/models/product_card.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';

class ProductDetail extends ConsumerStatefulWidget {
  final String? productName;
  final String imageModel;
  final String? price;
  final String? description;
  final ProductCard productData;

  const ProductDetail(
      {super.key,
      this.productName = '',
      required this.imageModel,
      required this.productData,
      this.price,
      this.description});

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  final String _pin = '';
  TextEditingController pinEditingController = TextEditingController();
  //  SharedPreferences prefs = await SharedPreferences.getInstance();

  // to control the animation
  final O3DController controller = O3DController(),
      controller2 = O3DController(),
      controller3 = O3DController(),
      controller4 = O3DController();
  List<String> logs = [];
  bool cameraControls = false;

  @override
  void initState() {
    super.initState();
    controller.logger = (data) {
      logs.add(data.toString());
    };
  }

  @override
  Widget build(BuildContext context) {
    final O3DController controller = O3DController();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          // backgroundColor: AppTextStyle.bodyFive.color,
          title: Text(AppLocalizations.of(context)!.product_details,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            child: O3D(
              controller: controller2,
              src: widget.imageModel,
            ),
          ),
          VSpace.large,
          SizedBox(
            child: Expanded(
              child: CardDescriptionWidget(
                productName: widget.productName ?? 'Product Name',
                price: widget.price ?? 'Price',
                description: widget.description ?? 'Description',
                addToCart: () {
                  final cart = ProductCard(
                      title: widget.productData.title,
                      price: widget.productData.price,
                      image: widget.productData.image);
                  //  add to cart logic
                  ref.read(cartProvider.notifier).addProductToCart(cart);
                  Navigator.pushNamed(context, AppRoutes.CartPageRoute);
                },
              ),
            ),
          )
        ])));
  }
}

class ModelDetail extends StatelessWidget {
  final List<Widget> actions;
  final Widget o3d;

  const ModelDetail({
    super.key,
    required this.actions,
    required this.o3d,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.shade100.withOpacity(.3),
        elevation: 0,
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4), 
            topRight:
                Radius.circular(4), 
            bottomLeft: Radius.zero, 
            bottomRight: Radius.zero, 
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            height: 0,
            child: Column(children: [
              Wrap(
                children: actions
                    .map((child) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: child,
                        ))
                    .toList(),
              ),

              Expanded(
                  child: Card(
                // color: AppColors.orange,
                elevation: 0,
                child: AspectRatio(aspectRatio: 1, child: o3d),
              ))

              // long bottom card to display the product details and add to cart button and sizes
            ])));
  }
}
