import 'package:flutter/material.dart';

//Draggable  allows us to drag a widget across screen.
// DragTarget provides destination for Draggable
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool condition = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable & Drag Targets'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Draggable(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple,
              ),
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              axis: Axis.vertical,
              onDragStarted: () {},
              onDragCompleted: () {},
              onDragEnd: (draggabledetils) {},
              onDraggableCanceled: (velocity, offset) {},
              onDragUpdate: (dragupdatedetails) {},
              maxSimultaneousDrags: 1,
              data: "Demo",
            ),
            SizedBox(
              height: 20,
            ),
            DragTarget(
              builder: (context, acceptedData, rejectedData) {
                return condition
                    ? Container(width: 100, height: 100, color: Colors.orange)
                    : Container(width: 100, height: 100, color: Colors.black);
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                condition = true;
              },
            )
          ],
        ),
      ),
    );
  }
}
