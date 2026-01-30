import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Search query state
  String _searchQuery = '';

  //function to add shoe to cart
  void addShoeToCart(Shoe individualShoe) {
    Provider.of<Cart>(context, listen: false).addToCart(individualShoe);

    //alert the user,shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Successfully Added'),
        content: const Text('Check your cart.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        // Filter shoes based on search query
        List<Shoe> shoes = value.getShoeShop();
        if (_searchQuery.isNotEmpty) {
          shoes = shoes
              .where(
                (shoe) => shoe.name.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
              )
              .toList();
        }

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 25),
            //search bar
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),

            //Message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'every one flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            //hot picks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Hot Picks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to full list or show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('See all functionality coming soon!'),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            //list of shoes for sale
            SizedBox(
              height:
                  420, // Fixed height to prevent overflow and allow scrolling content within ListView
              child: ListView.builder(
                itemCount: shoes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get a shoe from the list
                  Shoe shoe = shoes[index];
                  //return the shoe
                  return ShoeTile(shoe: shoe, onTap: () => addShoeToCart(shoe));
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                left: 25,
                right: 25,
                bottom: 25,
              ),
              child: Divider(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
