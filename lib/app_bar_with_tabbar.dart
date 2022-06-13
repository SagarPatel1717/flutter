import 'package:flutter/material.dart';

class AppBarWithTabBarScreen extends StatefulWidget {
  @override
  _AppBarWithTabBarState createState() => _AppBarWithTabBarState();
}

class _AppBarWithTabBarState extends State<AppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  List<Widget> tabList = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          tabs: tabList,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Center(child: Text("Tab one")),
          Center(child: Text("Tab two")),
          Center(child: Text("Tab three")),
          Center(child: Text("Tab four")),
        ],
      ),
    );
  }
}
