import 'package:FOODSTAR/domain/models/DishModel.dart';

class CartModel {
  List<CartItem> items = [];
  double previousTotalCost = 0.0; // Предыдущая общая стоимость
  double currentTotalCost = 0.0; // Текущая общая стоимость

  // Добавить товар в корзину
  void addItem(DishModel dish) {
    for (CartItem item in items) {
      if (item.dish.title == dish.title) {
        if (item.quantity != 99) {
          item.quantity++;
        }
        updateTotalCost(); // Обновляем общую стоимость
        return; // Завершаем функцию
      }
    }

    // Если товара нет в корзине, добавляем его
    items.add(CartItem(dish: dish, quantity: 1));
    updateTotalCost(); // Обновляем общую стоимость
  }

  // Удалить товар из корзины
  void removeItem(DishModel dish) {
    for (CartItem item in items) {
      if (item.dish.title == dish.title) {
        if (item.quantity > 1) {
          // Если количество товара больше одного, уменьшаем количество
          item.quantity--;
        } else {
          // Если количество товара равно одному, удаляем товар из корзины
          items.remove(item);
        }
        updateTotalCost(); // Обновляем общую стоимость
        return; // Завершаем функцию
      }
    }
  }

  void deleteItem(DishModel dish) {
    for (CartItem item in items) {
      if (item.dish.title == dish.title) {
        items.remove(item);
        updateTotalCost(); // Обновляем общую стоимость
        return;
      }
    }
  }

  // Очистить корзину
  void clearCart() {
    items.clear();
    updateTotalCost(); // Обновляем общую стоимость
  }

  // Получить общее количество товаров в корзине
  int get itemCount {
    int count = 0;
    for (CartItem item in items) {
      count += item.quantity;
    }
    return count;
  }

  void updateTotalCost() {
    previousTotalCost = currentTotalCost;
    currentTotalCost = calculateTotalCost();
  }

  // Рассчитать общую стоимость товаров в корзине
  double calculateTotalCost() {
    double total = 0.0;
    for (CartItem item in items) {
      total += item.dish.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final DishModel dish;
  int quantity;

  CartItem({required this.dish, required this.quantity});
}
