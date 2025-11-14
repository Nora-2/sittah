
import 'package:flutter/material.dart';
import 'package:glasses/core/utils/widgets/custom_button_navigation.dart';
import 'package:glasses/features/home/presentation/pages/allcategories.dart';
import 'package:glasses/features/home/presentation/pages/allproductes.dart';
import 'package:glasses/features/home/presentation/pages/home_geust_screen.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('السلة Screen', style: TextStyle(fontSize: 24)));
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('حسابي Screen', style: TextStyle(fontSize: 24)));
  }
}


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
      const AccountScreen(),  // 0
      const CartScreen(),     // 1
      const AllproductsScreen(),  // 2
      const AllCtegoriesScreen(), // 3
      HomeGeustScreen(),
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
