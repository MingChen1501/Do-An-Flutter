import 'package:flutter/cupertino.dart';
import '../Modals/cart_model.dart';
import 'package:flutter_application_1/DB/db_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  DbCart db = DbCart();

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    //notifyListeners();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalPrice = prefs.getDouble('total_price')??0.0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    if (_totalPrice < 0) _totalPrice = 0;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  //so luong
  int _quantity = 1;
  int get quantity => _quantity;
  void addQuantity() {
    _quantity++;
    notifyListeners();
  }

  void removeQuantity() {
    if (_quantity > 1) {
      _quantity--;
   }
    notifyListeners();
  }
 void   setQuantity(){
     _quantity=1;
    // notifyListeners();
  }
  int getQuantity() => _quantity;


}
