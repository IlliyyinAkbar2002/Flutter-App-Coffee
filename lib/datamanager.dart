// import 'package:http/http.dart' as http;
import 'datamodel.dart';

class DataManager {
  List<Category> _menu;
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

  cartRemove(Product product) {
    cart.removeWhere((item) => item.product.id == product.id);
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
