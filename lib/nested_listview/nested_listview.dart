import 'dart:ui';
import 'package:flutter/material.dart';

class NestedListview extends StatefulWidget {
  @override
  _NestedListviewState createState() => _NestedListviewState();
}

class _NestedListviewState extends State<NestedListview>  {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFff5558),
      child: ListView.builder( // outer ListView
        itemCount: 4,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('Header $index'),
              ),
              ListView.builder( // inner ListView
                shrinkWrap: true, // 1st add
                physics: const NeverScrollableScrollPhysics(), // 2nd add
                itemCount: 10,
                itemBuilder: (_, index) => ListTile(title: Text('Item $index')),
              )
            ],
          );
        },
      ),
    );
  }
}