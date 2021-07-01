import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/ui/categories/categories_ui.dart';
import 'package:food_market/ui/home/home_ui.dart';
import 'package:food_market/ui/profile/profile.dart';

import '../../helpers/constants.dart';

class TabBarUI extends StatefulWidget {
  static String routeName = '/tab_bar_ui';
  const TabBarUI({Key? key}) : super(key: key);

  @override
  State<TabBarUI> createState() => TabBarUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class TabBarUIState extends State<TabBarUI> {
  int selectedIndex = 0;

  static List<Widget> listUI = [];

  @override
  void initState() {
    listUI.add(HomeUI());
    listUI.add(CategoriesUI());
    listUI.add(ProfileUI());
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      body: Center(
        child: listUI.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Shop Icon.svg',
                color: selectedIndex == 0 ? kPrimaryColor : inActiveIconColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Heart Icon.svg',
                color: selectedIndex == 1 ? kPrimaryColor : inActiveIconColor),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/User Icon.svg',
              color: selectedIndex == 2 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
