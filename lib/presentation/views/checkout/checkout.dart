
import 'package:flutter/material.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';


// use paypall or stripe for payment instead of the UI
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          // a card that shows
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            VSpace.medium,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            VSpace.medium,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            VSpace.medium,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),

            VSpace.medium,

            const FullButton(  
          
              buttonText: 'Proceed to Payment',
               buttonFunction: null,
            ),
          ],
        ),
      ),
    );
  }
}



