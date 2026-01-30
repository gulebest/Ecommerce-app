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
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            //search bar
            padding: EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Search', style: TextStyle(color: Colors.grey)),
                Icon(Icons.search, color: Colors.grey),
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
                Text(
                  'Hot Picks',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          //list of shoes for sale
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //create a shoe
                Shoe shoe = Shoe(
                  name: 'Air Jordan',
                  price: '240',
                  imagePath:
                      'assets/images/air_jordan.png', // Using logo.png temporarily as I know it exists
                  description: 'cool shoe',
                );
                //return shoe
                return ShoeTile(shoe: shoe);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 25, right: 25),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
