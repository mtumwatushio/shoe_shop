import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/shoe_model.dart';
import '../widgets/shoe_item_widget.dart';
import 'shoe_details_screen.dart';
import 'package:shoe_shop/signing/signing_in.dart';  // SignInScreen import

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ShoeModel> shoes = [
    ShoeModel(name: 'Nike', image: 'assets/images/two.jpg', price: 50.0),
    ShoeModel(name: 'Salomon', image: 'assets/images/three.jpg', price: 80.0),
    ShoeModel(name: 'Jordan', image: 'assets/images/one.jpg', price: 90.0),
    ShoeModel(name: 'Air', image: 'assets/images/ten.jpg', price: 70.0),
  ];

  bool _isExpanded = false;

  final List<Color> cardColors = [
    const Color.fromARGB(255, 6, 170, 211),
    const Color.fromARGB(255, 239, 242, 239),
    const Color.fromARGB(255, 212, 18, 18),
    const Color.fromARGB(255, 229, 190, 230),
  ];

  final Color nameColor = Colors.white;
  final Color priceColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Shop'),
        actions: [
          IconButton(
            icon: Icon(_isExpanded ? Icons.expand_more : Icons.expand_less),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _isExpanded ? 1 : 2,
          childAspectRatio: _isExpanded ? 3 : 1,
        ),
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoeDetailsScreen(shoe: shoes[index]),
                ),
              );
            },
            child: ShoeItemWidget(
              shoe: shoes[index],
              color: cardColors[index % cardColors.length],
              nameColor: nameColor,
              priceColor: priceColor,
            ),
          );
        },
      ),
    );
  }
}
