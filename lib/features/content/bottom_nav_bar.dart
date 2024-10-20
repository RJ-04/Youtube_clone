import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int index) onPressed;
  const BottomNavigation({required this.onPressed, super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GNav(
        rippleColor: Colors.pink[200]!,
        hoverColor: Colors.grey[200]!,
        haptic: true,
        tabBorderRadius: 20,
        tabActiveBorder: Border.all(color: Colors.transparent, width: 0),
        tabBorder: Border.all(color: Colors.transparent, width: 0),
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 15)
        ],
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        gap: 10,
        color: Colors.grey[800],
        activeColor: Colors.purple,
        iconSize: 25,
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),

          //--------------------------------------------------------------------

          GButton(icon: Icons.movie_creation_outlined, text: 'Shorts'),

          //--------------------------------------------------------------------

          GButton(icon: Icons.add_circle_outline_rounded),

          //--------------------------------------------------------------------

          GButton(icon: Icons.search, text: 'Search'),

          //--------------------------------------------------------------------

          GButton(icon: Icons.heart_broken, text: 'Log out'),

          //--------------------------------------------------------------------
        ],
        onTabChange: widget.onPressed,
      ),
    );
  }
}
