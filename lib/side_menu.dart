// import 'package:flutter/material.dart';
// import 'package:liquid_ui/liquid_ui.dart';
// import 'package:shrink_sidemenu/shrink_sidemenu.dart';
//
// class SideMenu extends StatefulWidget {
//   @override
//   _SideMenuState createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return SideMenu(
//       key: _endSideMenuKey,
//       inverse: true, // end side menu
//       background: Colors.green[700],
//       type: SideMenuType.slide,
//       menu: buildMenu(),
//       child: Scaffold(
//         appBar: AppBar(
//           // centerTitle: true,
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   final _state = _endSideMenuKey.currentState;
//                   if (_state.isOpened)
//                     _state.closeSideMenu();
//                   else
//                     _state.openSideMenu();
//                 })
//           ],
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '$_counter',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildMenu() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(vertical: 50.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 22.0,
//                 ),
//                 SizedBox(height: 16.0),
//                 LText(
//                   "\l.lead{Hello},\n\l.lead.bold{Johnie}",
//                   baseStyle: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading: Icon(Icons.home, size: 20.0, color: Colors.white),
//             title: Text("Home"),
//             textColor: Colors.white,
//             dense: true,
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading: Icon(Icons.verified_user, size: 20.0, color: Colors.white),
//             title: Text("Profile"),
//             textColor: Colors.white,
//             dense: true,
//
//             // padding: EdgeInsets.zero,
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading:
//             Icon(Icons.monetization_on, size: 20.0, color: Colors.white),
//             title: Text("Wallet"),
//             textColor: Colors.white,
//             dense: true,
//
//             // padding: EdgeInsets.zero,
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading: Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
//             title: Text("Cart"),
//             textColor: Colors.white,
//             dense: true,
//
//             // padding: EdgeInsets.zero,
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading: Icon(Icons.star_border, size: 20.0, color: Colors.white),
//             title: Text("Favorites"),
//             textColor: Colors.white,
//             dense: true,
//
//             // padding: EdgeInsets.zero,
//           ),
//           LListItem(
//             backgroundColor: Colors.transparent,
//             onTap: () {},
//             leading: Icon(Icons.settings, size: 20.0, color: Colors.white),
//             title: Text("Settings"),
//             textColor: Colors.white,
//             dense: true,
//
//             // padding: EdgeInsets.zero,
//           ),
//         ],
//       ),
//     );
//   }
// }
