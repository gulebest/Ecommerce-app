import "package:ecommerce_app/models/shoe.dart";
import "package:flutter/material.dart";

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  const ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //shoe image
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(shoe.imagePath),
          ),

          //description

          //price + details

          //button to add to cart
        ],
      ),
    );
  }
}
