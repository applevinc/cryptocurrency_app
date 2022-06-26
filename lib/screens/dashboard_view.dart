import 'package:cryptocurrency_app/core/assets/icons.dart';
import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:cryptocurrency_app/screens/home_screen.dart';
import 'package:cryptocurrency_app/screens/profile_screen.dart';
import 'package:cryptocurrency_app/screens/trading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    TradingScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              color: AppColors.gray,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.home,
              color: AppColors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.chart,
              color: AppColors.gray,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.chart,
              color: AppColors.blue,
            ),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profile,
              color: AppColors.gray,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.profile,
              color: AppColors.blue,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
