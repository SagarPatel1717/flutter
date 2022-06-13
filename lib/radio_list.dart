import 'package:flutter/material.dart';

List<String> radioList = ['javatpoint', 'w3schools', 'tutorialandexample'];

class MyRadioListPage extends StatefulWidget {

  @override
  _MyRadioListPageState createState() => _MyRadioListPageState();
}

class _MyRadioListPageState extends State<MyRadioListPage> {
  var _radioList = radioList.first;
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          for (var radioListElement in radioList)
            ListTile(
              title: Text(radioListElement),
              leading: Radio(
                activeColor: Colors.amber,
                value: radioListElement,
                groupValue: _radioList,
                onChanged: (value) {
                  setState(() {
                    _radioList = value as String;
                  });
                },
              ),
            ),

          // ListTile(
          //   title: const Text('www.javatpoint.com'),
          //   leading: Radio(
          //     value: BestTutorSite.javatpoint,
          //     groupValue: _site,
          //     onChanged: (BestTutorSite value) {
          //       setState(() {
          //         _site = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('www.w3school.com'),
          //   leading: Radio(
          //     value: BestTutorSite.w3schools,
          //     groupValue: _site,
          //     onChanged: (BestTutorSite value) {
          //       setState(() {
          //         _site = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('www.tutorialandexample.com'),
          //   leading: Radio(
          //     value: BestTutorSite.tutorialandexample,
          //     groupValue: _site,
          //     onChanged: (BestTutorSite value) {
          //       setState(() {
          //         _site = value;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
