import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.image, required this.price, required this.itemCount, required this.increaseFunction, required this.decreaseFunction, required this.productName});

  final String image, productName;
  final double price;
  final int itemCount;
  final VoidCallback increaseFunction;
  final VoidCallback decreaseFunction;
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
             children: [
               Container(
                 height: 70,
                 width: 100,
                 decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                 child: Image.asset(image), // Make sure this path is correct
               ),
               Expanded(
                 child: Container(
                   color: Colors.grey,
                   padding: const EdgeInsets.all(10),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(productName, style: const TextStyle(fontSize: 20)),
                       Text('Price: \$${price.toStringAsFixed(2)}'),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           IconButton(onPressed: decreaseFunction, icon: const Icon(Icons.remove)),
                           Text('$itemCount'),
                           IconButton(onPressed: increaseFunction, icon: const Icon(Icons.add_circle, color: Colors.blue)),
                           IconButton(onPressed: () {}, icon: const Icon(Icons.delete), splashColor: Colors.red),
                         ],
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
}