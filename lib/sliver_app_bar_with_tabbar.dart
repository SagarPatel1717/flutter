import 'package:flutter/material.dart';

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("SilverAppBar title"),
            // pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            // **Is it intended ?** flexibleSpace.title overlaps with tabs title.
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text("FlexibleSpace title"),
            // ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
                Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Center(child: Text("Tab one")),
                Center(child: Text("Tab two")),
                Center(child: Text("Tab three")),
                Center(child: Text("Tab three")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
