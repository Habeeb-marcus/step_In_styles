
class CartItem {
  String name;
  double price;
  int ? quantity;
  String? imageUrl;

  CartItem( {required this.name, required this.price,  this.quantity,this.imageUrl,});
}


List<CartItem> cartItems = [
  CartItem(name: 'Puma', price: 50.0, quantity: 1, imageUrl: 'assets/images/puma.png'),
  CartItem(name: 'Nike', price: 20.0, quantity: 2, imageUrl: 'assets/images/nike.png'),
  CartItem(name: 'Adidas', price: 30.0, quantity: 1 , imageUrl: 'assets/images/adidas.png'),
  CartItem(name: 'Puma', price: 10.0, quantity: 3, imageUrl: 'assets/images/converse.png'),
  CartItem(name: 'Lonsdale', price: 5.0, quantity: 2, imageUrl: 'assets/images/helix.png'),
];