// add to cart page


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/components/cart/cart_item.dart';
import 'package:step_in_style/core/providers/cartProvider.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(cartProvider);
    final cartItems = ref.watch(cartProvider).cartlistItems;

    final double total = cartItems.fold(
        0,
        (sum, item) =>
            sum + (double.parse(item.price) * item.quantity).toDouble());

    double subtotal = total;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.cart,
          style:  AppTextStyle.headerFour,
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('No items in cart yet'),
            )
          : Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizer(true, 17, context),
                        vertical: sizer(false, 10, context),
                      ),
                      child: ListView.separated(
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            VSpace.medium,
                        itemBuilder: (context, index) {
                          return CartCardItem(
                            cardKey: ValueKey(cartItems[index].title +
                                cartItems[index]
                                    .price), // Add a key here (optional
                            productName: cartItems[index].title,
                            price: cartItems[index].price,
                            image: cartItems[index].image,
                            itemCount: cartItems[index].quantity,
                            increaseCountFunction: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .incrementItemCount(cartItems[index].title);
                            },
                            decreaseCountFunction: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .decrementItemCount(cartItems[index].title);
                            },
                            onDeleted: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeProductFromCart(cartItems[index]);

                              // recalculating the total
                              final double total = cartItems.fold(
                                  0,
                                  (sum, item) =>
                                      sum +
                                      (double.parse(item.price) * item.quantity)
                                          .toDouble());
                            },
                          );
                        },
                      )),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: _buildCheckoutSection(subtotal, total)),
              ],
            ),
    );
  }

  Widget _buildCheckoutSection(double subtotal, double total) {
    return Card(
      // padding: const EdgeInsets.all(20),
      // decoration: BoxDecoration( boxShadow: [BoxShadow(blurRadius: 0, color: AppColors.)]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal', style: TextStyle(fontSize: 16)),
                Text('\$${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(AppLocalizations.of(context)!.total,
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            FullButton(
              buttonFunction: () {
                Navigator.pushNamed(context, AppRoutes.CheckoutPageRoute);
              },
              buttonText: AppLocalizations.of(context)!.checkout,
            ),
          ],
        ),
      ),
    );
  }
}

