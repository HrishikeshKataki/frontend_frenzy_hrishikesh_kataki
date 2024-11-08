import 'package:flutter/material.dart';
import 'package:frontend_frenzy/pages/landing_page.dart';
import 'package:frontend_frenzy/pages/search_screen.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  BottomNavBar({super.key});

  List<Widget> _buildScreens() {
    return [

      const Home(),
      Container(),
      const Search(),
      Container(),
      Container(),
      
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: white,
        inactiveColorPrimary: bg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.checklist_outlined),
        title: "Orders",
        activeColorPrimary: white,
        inactiveColorPrimary: bg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: white,
        inactiveColorPrimary: bg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: "Account",
        activeColorPrimary: white,
        inactiveColorPrimary: bg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: white,
        inactiveColorPrimary: bg,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarItems(),
            backgroundColor: primary,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            navBarStyle: NavBarStyle.style1,
          ),
        ),
      ),
    );
  }
}
