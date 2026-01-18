import 'package:flutter/material.dart';
import 'package:glasses/core/utils/widgets/custom_button_navigation.dart';
import 'package:glasses/features/cart/presentation/pages/cartscreen.dart';
import 'package:glasses/features/home/presentation/pages/allcategories.dart';
import 'package:glasses/features/home/presentation/pages/allproductes.dart';
import 'package:glasses/features/home/presentation/pages/home_geust_screen.dart';
import '../../../features/account/presentation/pages/profile_screen.dart';

class GuestLayout extends StatefulWidget {
  const GuestLayout({super.key});

  @override
  State<GuestLayout> createState() => _GuestLayoutState();
}

class _GuestLayoutState extends State<GuestLayout> {
  int _selectedIndex = 4; // Home index

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      const AccountScreen(),

      const CartScreen(), // 1
      const AllproductsScreen(), // 2
      const AllCtegoriesScreen(), // 3
      HomeGeustScreen(
        onproducttab: () {
          setState(() {
            _selectedIndex = 2; // index of AllCategories
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
