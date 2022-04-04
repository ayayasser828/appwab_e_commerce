import 'package:appwab_e_commerce/UI/screens/change_lang_screen.dart';
import 'package:appwab_e_commerce/UI/screens/delivery_details_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/home_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/bottom_nav_bar_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/search_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/shopping_cart_screen.dart';
import 'package:appwab_e_commerce/UI/screens/product_category_screen.dart';
import 'package:appwab_e_commerce/UI/screens/product_details_screen.dart';
import 'package:appwab_e_commerce/bussiness%20logic/general/general_cubit.dart';
import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRouts(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case navBar:
        return MaterialPageRoute(builder: (_) => NavBar());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case pCategory:
        return MaterialPageRoute(builder: (_) => const ProductCategoryScreen());
      case productDetails:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => GeneralCubit(),
              child: const ProductDetailsScreen(),
            ));
      case cart:
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
      case changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case deliveryDetails:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => GeneralCubit(),
              child: const DeliveryDetailsScreen(),
            ));
    }
  }
}