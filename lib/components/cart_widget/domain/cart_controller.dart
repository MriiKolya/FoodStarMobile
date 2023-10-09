import 'package:FOODSTAR/domain/models/CartModel.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cart = CartModel().obs;

  void addDishToCart(DishModel dish) {
    cart.value.addItem(dish);
    update();
  }

  void removeDishToCart(DishModel dish) {
    cart.value.removeItem(dish);
    update();
  }

  void deleteDish(DishModel dish) {
    cart.value.deleteItem(dish);
    update();
  }

  void clearCart() {
    cart.value.clearCart();
    update();
  }

  get getCurrentTotalCost {
    return cart.value.currentTotalCost;
  }

  get getPreviousTotalCost {
    return cart.value.previousTotalCost;
  }
}
