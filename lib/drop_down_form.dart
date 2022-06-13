// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//       body: Center(
//         child: MyDropDownForm(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
// // ignore: deprecated_member_use
// var userList = <User>[];
// User? selectedUser;
//
// class MyDropDownForm extends StatefulWidget {
//   createState() {
//     userList.add(new User(name: 'ABC', age: '25'));
//     userList.add(new User(name: 'SDF', age: '24'));
//     userList.add(new User(name: 'FGDG', age: '23'));
//     userList.add(new User(name: 'PQR', age: '28'));
//     userList.add(new User(name: 'XFGDF', age: '29'));
//     userList.add(new User(name: 'WWW', age: '26'));
//     userList.add(new User(name: 'HHH', age: '30'));
//     userList.add(new User(name: 'RFD', age: '35'));
//     selectedUser = userList[0];
//
//     return StateKeeper();
//   }
// }
//
// class StateKeeper extends State<MyDropDownForm> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Colors.white,
//           child: Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   new DropdownButton<User>(
//                     hint: new Text(
//                       "حرف",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     value: selectedUser,
//                     style: new TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'iransans',
//                     ),
//                     // onChanged: (User pt) {
//                     //   setState(() {
//                     //     selectedUser = pt;
//                     //     print("Selected user " + selectedUser.name);
//                     //   });
//                     // },
//                     items: userList.map((User p) {
//                       return new DropdownMenuItem<User>(
//                         value: p,
//                         child: new Text(
//                           p.name,
//                           textAlign: TextAlign.center,
//                           style: new TextStyle(color: Colors.black),
//                         ),
//                       );
//                     }).toList(),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class User {
//   String name;
//   String age;
//
//   User({
//     required this.name,
//     required this.age,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => new User(
//         name: json["name"],
//         age: json["age"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "age": age,
//       };
// }
