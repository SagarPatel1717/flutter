import 'package:flutter/material.dart';

class GirdDemo extends StatefulWidget {
  const GirdDemo({Key? key}) : super(key: key);

  @override
  State<GirdDemo> createState() => _GirdDemoState();
}

class _GirdDemoState extends State<GirdDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              // Expanded(
              //   child: Image.network(
              //     "https://www.roadaffair.com/wp-content/uploads/2017/10/kabukicho-tokyo-japan-shutterstock_637989430-1024x683.jpg",
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.grey.shade800,
                    Colors.black,
                  ], radius: 0.85, focal: Alignment.center),
                ),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                  ),
                  children: <Widget>[
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}