// model for he product card


class ProductCard {
  final String title;
  final String price;
  final String image;
  final String? image_model;
  final double? anim_duration;
  final String? description;
   int quantity;

   ProductCard( {
    required this.title,
    required this.price,
    required this.image,
    this.image_model,
    this.anim_duration,
    this.description,
    this.quantity = 1,
     
  });
}


List<ProductCard>  productData =  [
    ProductCard(
    title: 'Nike Air Pegasus',
    price: '470',
    image: 'assets/images/products/nike_pegasus.png',
    image_model: 'assets/glb/nike_air_pegasus_36.glb',
    anim_duration: 0.9,
    description: 'The Converse All Star is a classic shoe that has been worn by generations of people. The shoe features a canvas upper, a rubber sole, and a lace-up closure. Whether you’re hitting the basketball court or just hanging out with friends, the Converse All Star is the perfect choice for any occasion.',

  ),
  ProductCard(
    title: 'Nike Air 720',
    price: "120",
    image: 'assets/images/products/Nike_720.png',
    image_model: 'assets/glb/nike_air_720.glb',
    anim_duration: 0.5,
    description: 'The Nike Air 720 is a modern take on a classic design. The shoe features a lightweight and breathable upper, a comfortable EVA midsole, and a durable rubber outsole. Whether you’re hitting the gym or running errands, the Nike Air 720 is the perfect choice for all-day comfort and style',
  ),
  ProductCard(
    title: 'Puma Future Rider',
    price: '100',
    image: 'assets/images/products/puma.png',
    image_model: 'assets/glb/materials_variants_shoe.glb',
    anim_duration: 0.6,
    description: 'The Puma Future Rider is a modern take on a classic design. The shoe features a lightweight and breathable upper, a comfortable EVA midsole, and a durable rubber outsole. Whether you’re hitting the gym or running errands, the Puma Future Rider is the perfect choice for all-day comfort and style.',
  ),
  ProductCard(
    title: 'Blue vans',
    price: '80',
    image: 'assets/images/products/blue_vans.png',
    image_model: 'assets/glb/blue_vans.glb',
    anim_duration: 0.7,
    description: 'The Blue Vans are a classic shoe that has been worn by generations of people. The shoe features a canvas upper, a rubber sole, and a lace-up closure. Whether you’re hitting the basketball court or just hanging out with friends, the Blue Vans are the perfect choice for any occasion',

  ),
  ProductCard(
    title: 'Nike Air Max 270',
    price: '90',
    image: 'assets/images/products/air_max.png',
    image_model: 'assets/glb/nike_air_max_90.glb',
    anim_duration: 0.8,
    description: 'This Nike Air Max 270 is inspired by two icons of big Air: the Air Max 180 and Air Max 93. It features Nike’s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks. ',

  ),

    ProductCard(
    title: 'Christian Dior Vibe',
    price: '470',
    image: 'assets/images/products/dior.png',
    image_model: 'assets/glb/dior.glb',
    anim_duration: 0.9,
    description: 'This Dior Vibe sneaker reinterprets the classic running shoe with the House\'s haute. The sneaker, complete with a transparent rubber sole, can be combined with any casual or elegant outfit for a contemporary look.',

  ),
    ProductCard(
    title: 'Salomon X_raise',
    price: '370',
    image: 'assets/images/products/x-raise.png',
    image_model: 'assets/glb/shoe05.glb',
    anim_duration: 0.9,
    description: 'The Salomon X RAISE hiking shoe features a modern, athletic look & is designed with features to support stability, comfort, & performance so no matter the trail, you can go the distance.',

  ),
    ProductCard(
    title: 'Salomon Sneaker',
    price: '200',
    image: 'assets/images/products/salomon.png',
    image_model: 'assets/glb/salomon_xt6_sneaker_photo_scan.glb',
    anim_duration: 0.9,
    description: 'The Converse All Star is a classic shoe that has been worn by generations of people. The shoe features a canvas upper, a rubber sole, and a lace-up closure. Whether you’re hitting the basketball court or just hanging out with friends, the Converse All Star is the perfect choice for any occasion.',

  ),
    ProductCard(
    title: 'Adidas Campus Grey',
    price: '130',
    image: 'assets/images/products/adida_camp.png',
    image_model: 'assets/glb/adidas_campus_00s_grey.glb',
    anim_duration: 0.9,
    description: 'The Adidas Campus Grey is a classic shoe that has been worn by generations of people. The shoe features a canvas upper, a rubber sole, and a lace-up closure. Whether you’re hitting the basketball court or just hanging out with friends, the Converse All Star is the perfect choice for any occasion.',
  ),
    ProductCard(
    title: 'Active Sneakers',
    price: '185',
    image: 'assets/images/products/active.png',
    image_model: 'assets/glb/poly.glb',
    anim_duration: 0.9,
    description: 'The Adidas Campus Grey is a classic shoe that has been worn by generations of people. The shoe features a canvas upper, a rubber sole, and a lace-up closure. Whether you’re hitting the basketball court or just hanging out with friends, the Converse All Star is the perfect choice for any occasion.',
  ),

  

];
