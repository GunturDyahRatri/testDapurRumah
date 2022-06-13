import 'package:flutter/material.dart';
import 'package:testdapurrumahsejahtera/page/chart/chartpage.dart';
// import 'package:testdapurrumahsejahtera/page/chart/chartpage.dart';
import 'package:testdapurrumahsejahtera/page/product/productpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPages = 0;

  List<Widget> pages = [
    ProductPaeg(),
    ChartPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedPages = index;
      // bootstrap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Chart',
          ),
        ],
        currentIndex: selectedPages,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _body() {
    return Container(
      child: pages[selectedPages],
    );
  }
}
