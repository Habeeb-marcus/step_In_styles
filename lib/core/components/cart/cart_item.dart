
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/providers/cartProvider.dart';

class CartCardItem extends ConsumerWidget {
  final String productName;
  final String price;
  final String image;
  final VoidCallback? onDeleted, increaseCountFunction, decreaseCountFunction;
  final Key cardKey;
  final int itemCount;

  const CartCardItem({super.key, 
    required this.productName,
    required this.price,
    required this.image,
    required this.onDeleted,
    this.increaseCountFunction,
    this.decreaseCountFunction,
    required this.cardKey,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(cartProvider);
    return Card(
      // height: 120,
      key: cardKey,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image), // Make sure this path is correct
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: const TextStyle(fontSize: 20)),
                  Text(
                    '\$${price}.00',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                       
                        child: Row(
                          children: [
                           IconButton(
                          onPressed: decreaseCountFunction,
                          icon: const Icon(Icons.remove)),
                      Text('$itemCount'),
                      IconButton(
                          onPressed: increaseCountFunction,
                          icon:
                              const Icon(Icons.add_circle, color: Colors.blue)),
                          ],
                        ),
                      ),
                      
                      IconButton(
                          onPressed: onDeleted,
                          icon: const Icon(Icons.delete, color: Colors.red,),
                          splashColor: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
