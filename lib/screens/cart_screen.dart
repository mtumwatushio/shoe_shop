// // screens/cart_screen.dart

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/cart_model.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartModel>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Your Cart')),
//       body: ListView.builder(
//         itemCount: cart.cartItems.length,
//         itemBuilder: (context, index) {
//           final shoe = cart.cartItems[index];
//           return ListTile(
//             leading: Image.asset(shoe.image, height: 50, fit: BoxFit.cover),
//             title: Text(shoe.name),
//             subtitle: Text('\$${shoe.price}'),
//             trailing: IconButton(
//               icon: const Icon(Icons.remove_circle_outline),
//               onPressed: () {
//                 cart.removeFromCart(shoe);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Total: \$${cart.totalPrice}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ElevatedButton(
//               onPressed: () {
//                 cart.clearCart();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Checked out!')),
//                 );
//               },
//               child: const Text('Checkout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
