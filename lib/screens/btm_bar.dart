import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mechanics/provider/cart_provider.dart';
import 'package:mechanics/provider/dark_theme_provider.dart';
import 'package:mechanics/screens/cart/cart_screen.dart';
import 'package:mechanics/screens/categories.dart';
import 'package:mechanics/screens/home_screen.dart';
import 'package:mechanics/screens/user.dart';
import 'package:badges/badges.dart' as badge;
import 'package:mechanics/widget/text_widget.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Home Screen',
    },
    {
      'page': CategoriesScreen(),
      'title': 'Categories Screen',
    },
    {
      'page': const CartScreen(),
      'title': 'Cart Screen',
    },
    {
      'page': const UserScreen(),
      'title': 'user Screen',
    },
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text( _pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark
            ? Theme.of(context).cardColor
            : Color.fromRGBO(119, 16, 76, 0.644),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor:
            _isDark ? Colors.white : const Color.fromARGB(255, 230, 216, 216),
        selectedItemColor: _isDark ? Colors.white : Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Consumer<CartProvider>(builder: (_, myCart, ch) {
              return badge.Badge(
                badgeAnimation: const badge.BadgeAnimation.slide(),
                badgeStyle: badge.BadgeStyle(
                  shape: badge.BadgeShape.circle,
                  badgeColor: Color.fromARGB(255, 139, 32, 86),
                  borderRadius: BorderRadius.circular(8),
                ),
                position: badge.BadgePosition.topEnd(top: -7, end: -7),
                badgeContent: FittedBox(
                    child: TextWidget(
                        text: myCart.getCartItems.length.toString(),
                        color: Colors.white,
                        textSize: 15)),
                child: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              );
            }),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
      ),
    );
  }
}
