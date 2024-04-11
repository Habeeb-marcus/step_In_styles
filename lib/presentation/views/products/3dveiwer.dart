// // e-commerce product detail page with o3d viewer to diplay product in 3d 

// import 'package:flutter/material.dart';
// import 'package:o3d/o3d.dart';


// class ProductDetail extends StatefulWidget {
//   final String ? AppState;
//   const ProductDetail({super.key, this.AppState= ''});

//   @override
//   State<ProductDetail> createState() => _ProductDetailState();
// }

// class _ProductDetailState extends State<ProductDetail> {
//   final String _pin = '';
//   TextEditingController pinEditingController = TextEditingController();
//   //  SharedPreferences prefs = await SharedPreferences.getInstance();

//    // to control the animation
//   final O3DController controller = O3DController(),
//       controller2 = O3DController(),
//       controller3 = O3DController(),
//       controller4 = O3DController();
//   List<String> logs = [];
//   bool cameraControls = false;
   

//     @override
//   void initState() {
//     super.initState();
//     controller.logger = (data) {
//       logs.add(data.toString());
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         // backgroundColor: AppTextStyle.bodyFive.color,
//         title: const Text('Product Detail'),
//         centerTitle: true,
//         elevation: 0,
//               actions: [
//           IconButton(
//               onPressed: () => 
//                   controller.cameraOrbit(20, 20, 5),
//               icon: const Icon(Icons.change_circle)),
//           IconButton(
//               onPressed: () =>
//                   controller.cameraTarget(1.2, 1, 4), 
//               icon: const Icon(Icons.change_circle_outlined)),
//         ],
//       ),
//       body: O3D.asset(
//         src: 'assets/glb/poly.glb',
//         controller: controller,
//       ),
//     //   SafeArea(
//     //     child: GestureDetector(
//     //       onTap: () {
//     //         FocusScopeNode currentFocus = FocusScope.of(context);
//     //         if (!currentFocus.hasPrimaryFocus) {
//     //           currentFocus.unfocus();
//     //         }
//     //       },
//     //       child: SingleChildScrollView(
//     //         child: Padding(
//     //           padding: EdgeInsets.only(
//     //               left: sizer(true, 16, context),
//     //               right: sizer(true, 16, context),
//     //               top: sizer(true, 40, context)),
//     //           child: Column(
//     //             crossAxisAlignment: CrossAxisAlignment.start,
//     //             children: [
                  
//     //               // const AuthenticationHeader(),
//     //               InkWell(
//     //                 child: Image.asset(
//     //                   'assets/icons/back.png',
//     //                   height: 40,
//     //                   width: 40,// Adjust the height as needed
//     //                 ),
//     //                 onTap: () {
//     //                   // Call Navigator.pop() to go back to the previous screen
//     //                   Navigator.pop(context);
//     //                 },
//     //               ),
//     //                 // Add a SizedBox with a height of 20
//     //                 SizedBox(height: 20),
//     //                 // Add a Container with a height of 300 and width of 300
//     //                 Container(
                      
//     //                   width: 300,
//     //                   // Add a child: Center widget
//     //                   child: Center(
//     //                     // Add a child: Text widget with the text '3D Viewer'
//     //                     child: Text('3D Viewer'),
//     //                   ),
//     //                 ),
//     //                 // Add a SizedBox with a height of 20
//     //                 SizedBox(height: 20),
//     //                 // Add a FullButton widget with the text 'Add to Cart'
//     //                 O3D.asset(
//     //      src: 'assets/glb/scene.gltf', 
//     //      controller: controller,
//     //   ),

//     // // ModelDetail(
//     // //           actions: [
//     // //             FilledButton(
//     // //               onPressed: () => controller.variantName = null,
//     // //               child: const Text('Default'),
//     // //             ),
//     // //             FilledButton(
//     // //               onPressed: () => controller.variantName = 'street',
//     // //               child: const Text('street'),
//     // //             ),
//     // //             FilledButton(
//     // //               onPressed: () => controller.variantName = 'beach',
//     // //               child: const Text('beach'),
//     // //             ),
//     // //           ],
//     // //           o3d: O3D(
//     // //             controller: controller,
//     // //             src: 'assets/glb/scene.gltf',
//     // //             // variantName: 'street',
//     // //           ),
//     // //         ),
                
                
                
//     //                 FullButton(
//     //                   buttonText: 'Add to Cart',
//     //                   // Add an onPressed function that navigates to the DashboardPage
//     //                   buttonFunction: () {
//     //                     Navigator.push(
//     //                       context,
//     //                       MaterialPageRoute(builder: (context) => DashboardPage()),
//     //                     );
//     //                   },
//     //                 ),
//     //               ],
                  
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     );
//   }
// }




// class ModelDetail extends StatelessWidget {
//   final List<Widget> actions;
//   final Widget o3d;

//   const ModelDetail({
//     super.key,
//     required this.actions,
//     required this.o3d,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.blue.shade100.withOpacity(.3),
//       elevation: 0,
//       margin: const EdgeInsets.all(16),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: Container(
//         padding: const EdgeInsets.all(4),
//         width: double.infinity,
//         height: 400,
//         child: Column(
//           children: [
//             Wrap(
//               children: actions
//                   .map((child) => Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 6, vertical: 2),
//                         child: child,
//                       ))
//                   .toList(),
//             ),
//             Expanded(
//                 child: Card(
//               color: Colors.blue.shade100.withOpacity(.3),
//               elevation: 0,
//               child: AspectRatio(aspectRatio: 1, child: o3d),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }