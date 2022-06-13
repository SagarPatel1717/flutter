import 'package:flutter/material.dart';

import 'inherited_extension.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;
  void addCounter() {
    // setState(() {
      count++;
    // });
  }

  void removeCounter() {
    setState(() {
      if(count>0){
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountState(
      count: count,
      addCounter: addCounter,
      removeCounter: removeCounter,
      child: InheritedWidgetDemo(),
    );
  }
}


class InheritedWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CountState.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title: Text(
          'Counter Inherited Widget Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child:Text('Items add & remove: ${counterState?.count}',
              style: TextStyle(fontSize: 20),
            ),
          ),


          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: new FloatingActionButton(
                    onPressed: counterState?.removeCounter,
                    child: new Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: new FloatingActionButton(
                    onPressed: counterState?.addCounter,
                    child: new Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}