import 'shoe.dart';
import 'package:flutter/foundation.dart';
class Cart extends ChangeNotifier {
  //list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Max 270',
      description:
          'The Nike Air Max 270 features Nike\'s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.',
      price: '150',
      imagePath: 'lib/images/airmax270.png',
    ),
    Shoe(
      name: 'Air Force 1',
      description:
          'The legend lives on in the Nike Air Force 1, the iconic basketball shoe that puts a fresh spin on what you know best: durable leather, clean lines and classic style.',
      price: '120',
      imagePath: 'lib/images/airforce1.png',
    ),
    Shoe(
      name: 'Air Jordan 1',
      description:
          'The Air Jordan 1 Retro High OG stays true to the original design with premium materials and authentic details that celebrate its rich heritage.',
      price: '170',
      imagePath: 'lib/images/airjordan1.png',
    ),
    Shoe(
      name: 'Blazer Mid \'77',
      description:
          'The Nike Blazer Mid \'77 Vintage combines retro style with modern comfort, featuring a high-top silhouette and vintage-inspired details.',
      price: '100',
      imagePath: 'lib/images/blazermid77.png',
    ),
  ];

  //list of shoes in the cart
  List<Shoe> userCart = [];
  //get list of shoes for sale
  List<Shoe> getShoeShop() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
  
  
  }

