import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home/home_screen.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({required this.id, required this.icon, this.destination = const NoFound()});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void changeNavIndex({required int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/list.svg",
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/camera.svg",
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/chef_nav.svg",
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
    ),
  ];
}

class NoFound extends StatelessWidget {
  const NoFound({super.key,});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Text(
          "NO FOUND",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}