import 'package:flutter/cupertino.dart';
import 'package:project_assignment_e/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Result> _cartItems = [];
  List<Result> get cartItems => _cartItems;

  double _cartTotal = 0;
  double get cartTotal => _cartTotal;

  //add item to a cart
  List<Result> itemAddToCart(Result product) {
    _cartItems.add(product);
    notifyListeners();

    return _cartItems;
  }

  //remove item from the cart
  List<Result> itemRemoveFromCart(Result product) {
    _cartItems.remove(product);
    notifyListeners();

    return _cartItems;
  }

  //get total value of the cart items
  double getcartTotal() {
    _cartTotal = 0;

    for (var i = 0; i < cartItems.length; i++) {
      _cartTotal += cartItems[i].price!.toDouble();
    }
    
    return _cartTotal;
  }


}
