import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              //create a shoe
              Shoe shoe = shoes(name:'Air Jordan', price: '240', imagePath: 'assets/images/air_jordan.png', description: 'cool shoe')
              return ShoeTile(shoe: shoe,
              );
            },
          ),
        ),
      ],
    );
  }
}
