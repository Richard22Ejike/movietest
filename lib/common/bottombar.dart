import 'package:badges/badges.dart';
import 'package:flutter/material.dart';


import '../contants/globalvaribles.dart';
import '../features/Home/Screens/home.dart';


class bottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarheight = 12;
  double bottomBarBorderWidth = 5;

  List<Widget>pages=[
    const home(),
    Center(child: Text('Navigation'),),
    Center(child: Text('Navigation'),),
    Center(child: Text('Navigation'),),
    Center(child: Text('Navigation'),),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Globalvariables.selectedNavBarColor,
        unselectedItemColor: Globalvariables.unselectedNavBarColor,
        backgroundColor: Globalvariables.backgroundColor,
        iconSize: 25,
        onTap: updatePage,
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              height: bottomBarheight,

              child: const Icon(
                Icons.home,
              ),
            ),
            label: '',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              height: bottomBarheight,

              child: const Icon(
                Icons.assistant_navigation,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              height: bottomBarheight,

              child: const Icon(
                Icons.search,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              height: bottomBarheight,

              child: const Icon(
                Icons.message_rounded,
              ),
            ),
            label: '',
          ),
          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              height: bottomBarheight,

              child: Badge(
                elevation: 0,
                badgeContent: Text('1'),
                badgeColor: Colors.grey,
                padding: EdgeInsets.all(6),
                child: const Icon(
                  Icons.notifications,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
