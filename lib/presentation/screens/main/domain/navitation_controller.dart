import 'package:FOODSTAR/components/discount_widgets/delivery_suggestions.dart';
import 'package:FOODSTAR/components/discount_widgets/new_suggestions.dart';
import 'package:FOODSTAR/components/discount_widgets/prices_for_your_favorite.dart';
import 'package:FOODSTAR/components/discount_widgets/support_Ukraine.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/cart_screen.dart';
import 'package:FOODSTAR/presentation/screens/home/presentation/home_screen.dart';
import 'package:FOODSTAR/presentation/screens/menu/presentation/menu_screen.dart';
import 'package:FOODSTAR/presentation/screens/more/presentation/more_scree.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/profile_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    selectedIndex.value = 0;
    update();
    super.onInit();
  }

  final pages = [
    const HomeScreen(),
    const CartScreen(),
    const MenuScreen(),
    const ProfileUserScreen(),
    const MoreScreen()
  ];

  void setSelectedIndex(int index) {
    if (index == selectedIndex.value) {
      return;
    } else {
      selectedIndex.value = index;
    }
    update();
  }

  final discound = [
    const FavoriteDishDiscount(),
    const NewSuggestionsDiscount(),
    const DeliverySuggestionsDiscount(),
    const SupportUkraineDiscount(),
    // const EmploymentDiscount(),
  ];

  void signOut() {
    AuthenticationRepository.instance.signOutController();
  }
}
