import 'package:flutter/material.dart';

class DragabbleScrollableSheetDemo extends StatefulWidget {
  @override
  _DragabbleScrollableSheetDemoState createState() =>
      _DragabbleScrollableSheetDemoState();
}

class _DragabbleScrollableSheetDemoState
    extends State<DragabbleScrollableSheetDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            height: 100,
            color: Colors.lightBlueAccent,
          ),
          Container(
            height: 200,
            color: Colors.pinkAccent,
          ),
          Container(
            height: 100,
            color: Colors.yellow,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.05,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
