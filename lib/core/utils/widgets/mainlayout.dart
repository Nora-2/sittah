
import 'package:flutter/material.dart';
import 'package:glasses/core/utils/widgets/custom_button_navigation.dart';
import 'package:glasses/features/account/presentation/pages/profile_screen.dart';
import 'package:glasses/features/cart/presentation/pages/cartscreen.dart';
import 'package:glasses/features/home/presentation/pages/allcategories.dart';
import 'package:glasses/features/home/presentation/pages/allproductes.dart';
import 'package:glasses/features/home/presentation/pages/home_main_screen.dart';






class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 4; // Home index

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      const AccountScreen(),  // 0
      const CartScreen(),     // 1
      const AllproductsScreen(),  // 2
      const AllCtegoriesScreen(), // 3
      HomeMainScreen(
        onCategoryTap: () {
          setState(() {
            _selectedIndex = 3; // index of AllCategories
          });
        },
      ),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
