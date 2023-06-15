import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:workshopodc/presentation/screens/settings/settings_screen.dart';

import '../../../constants/app_colors.dart';
import '../news/news_screen.dart';
import 'home_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List nav =[
    HomeGrid(),
     NewsScreen(),
    const SettingsScreen()
  ];
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:nav[_selectedIndex],
      bottomNavigationBar: GNav(
          onTabChange:(index){
            _selectedIndex=index;
            setState(() {});
          } ,
          selectedIndex:_selectedIndex ,
          duration: const Duration(milliseconds: 400),
          tabBorderRadius: 15,
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: AppColors.primaryColor, // selected icon and text color
          iconSize: 25, // tab button icon size
          tabBackgroundColor: Colors.grey.withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.newspaper,
              text: 'News',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            )
          ]
      ),
    );
  }
}
