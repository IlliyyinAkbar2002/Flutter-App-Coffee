import 'package:http/http.dart' as http;
import 'datamodel.dart';
import 'dart:convert';

class DataManager {
  List<Category>? _menu;
  List<ItemCart> cart = [];

  cartAdd(Product product) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == product.id) {
        item.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      cart.add(ItemCart(product: product, quantity: 1));
    }
  }

  fetchMenu() async {
    const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;
      _menu = [];
      var decodeData = jsonDecode(json) as List<dynamic>;
      for (var item in decodeData) {
        _menu?.add(Category.fromJson(item));
      }
    }
  }

  Future<List<Category>> getMenu() async {
    // Check if the menu has not been fetched yet
    if (_menu == null) {
      // Fetch the menu from the server
      await fetchMenu();
    }
    // Return the menu if it exists, otherwise return an empty list
    return _menu ?? [];
  }

  cartRemove(Product product) {
    cart.removeWhere((item) => item.product == product);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    var total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
