import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travo/features/view/currency_screen.dart';
import 'package:travo/features/view/dashboard/dashboard.dart' show Dashboard;
import 'package:travo/features/view/favourite_screen.dart';
import 'package:travo/features/view/profile_screen.dart';
import 'package:travo/features/view/setting_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();

  final List<Widget> _screens = [
    Dashboard(),
    FavouriteScreen(),
    CurrencyExchangeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_page],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none, // Allow overflow
        children: [
          // CurvedNavigationBar
          CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: _page == 0 ? Color(0xFFFF5722) : Colors.grey[600],
              ),
              Icon(
                Icons.bookmark,
                size: 30,
                color: _page == 1 ? Color(0xFFFF5722) : Colors.grey[600],
              ),
              Icon(
                Icons.currency_exchange,
                size: 30,
                color: _page == 2 ? Color(0xFFFF5722) : Colors.grey[600],
              ),
              Icon(
                Icons.favorite,
                size: 30,
                color: _page == 3 ? Color(0xFFFF5722) : Colors.grey[600],
              ),
              Icon(
                Icons.person,
                size: 30,
                color: _page == 4 ? Color(0xFFFF5722) : Colors.grey[600],
              ),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
          // Larger background circle
          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            left:
                (MediaQuery.of(context).size.width / 5) * _page +
                (MediaQuery.of(context).size.width / 10) -
                35, // Center the circle
            bottom: 30, // Adjust this value to position the circle correctly
            child: Container(
              width: 70, // Adjust the width to make the circle larger
              height: 70, // Adjust the height to make the circle larger
              decoration: BoxDecoration(
                color: Color(0xFFFF5722).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
