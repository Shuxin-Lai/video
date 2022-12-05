import 'package:flutter/material.dart';
import 'package:video/pages/cart_page.dart';
import 'package:video/pages/category_page.dart';
import 'package:video/pages/home_page.dart';
import 'package:video/pages/member_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = const [
    BottomNavigationBarItem(
        label: "Home",
        icon: Icon(
          Icons.home,
        )),
    BottomNavigationBarItem(
        label: "Category",
        icon: Icon(
          Icons.category,
        )),
    BottomNavigationBarItem(
        label: "Cart",
        icon: Icon(
          Icons.car_rental,
        )),
    BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(
          Icons.business_center,
        ))
  ];

  List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    CarPage(),
    MemberPage(),
  ];

  var currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("App bar")),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomTabs,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = pages[index];
            });
          },
        ),
        body: currentPage);
  }
}
