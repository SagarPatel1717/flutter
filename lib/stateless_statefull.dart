// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shrink_sidemenu/shrink_sidemenu.dart';
//
// final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
// int selectedTabIndex = 0;
// StreamController<bool>? strUpdateUserProfile;
//
// class DrawerItem {
//   String title;
//   Icon icon;
//
//   DrawerItem(this.title, this.icon);
// }
//
// class SideMenuScreen extends StatefulWidget {
//   // final int pageIndex;
//   //
//   // SideMenuScreen({@required this.pageIndex, Key key}) : super(key: key);
//
//   @override
//   _SideMenuState createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenuScreen> {
//   int _selectedDrawerIndex = 0;
//
//   List<DrawerItem> _drawerItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.green,
//           image: DecorationImage(
//             image: AssetImage('assets/images/img_bg.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             SideMenu(
//               background: Colors.transparent,
//               key: sideMenuKey,
//               menu: buildMenu(),
//               type: SideMenuType.shrinkNSlide,
//               radius: BorderRadius.all(Radius.zero),
//               child: Scaffold(
//                 key: GlobalKey(),
//                 body: Center(
//                   child: Container(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget _centerScreen() {
//   //   print(_selectedDrawerIndex);
//   //   print("SideMenu select :: ${_drawerItems[_selectedDrawerIndex].title}");
//   //
//   //   if (_selectedDrawerIndex != 0) {
//   //     selectedTabIndex = 0;
//   //   }
//   //
//   //   switch (_selectedDrawerIndex) {
//   //     case 0:
//   //       // return TabBarScreen(
//   //       //   pageIndex: selectedTabIndex,
//   //       //   notificationCountBloc:
//   //       //       NotificationCountBloc(appRepository: AppRepository()),
//   //       // );
//   //       break;
//   //
//   //     case 1:
//   //       // return SellBooksPage(
//   //       //   isFromSideMenu: true,
//   //       //   sellBooksListBloc: SellBooksListBloc(appRepository: AppRepository()),
//   //       // );
//   //       break;
//   //
//   //     case 2:
//   //       // return WatchListPage(
//   //       //   isFromSideMenu: true,
//   //       // );
//   //       break;
//   //
//   //     case 3:
//   //     // return PastTransactionPage();
//   //
//   //     case 4:
//   //     // return RatingPage(
//   //     //   userProfileDetailBloc:
//   //     //       UserProfileDetailBloc(appRepository: AppRepository()),
//   //     // );
//   //
//   //     case 5:
//   //     // return AddCardPage(
//   //     //   isFromSeller: true,
//   //     //   isUpdateCard: true,
//   //     //   upDateListCallBack: () {},
//   //     // );
//   //
//   //     case 6:
//   //     // return ReviewsPage(
//   //     //   reviewListBloc: ReviewListBloc(appRepository: AppRepository()),
//   //     // );
//   //
//   //     case 7:
//   //     // _launchURL(baseWebHowItWorksURL);
//   //     // return TabBarScreen(
//   //     //   pageIndex: 0,
//   //     //   notificationCountBloc:
//   //     //       NotificationCountBloc(appRepository: AppRepository()),
//   //     // );
//   //
//   //     case 8:
//   //     // _launchURL(baseWebCMSURL);
//   //     // return TabBarScreen(
//   //     //   pageIndex: 0,
//   //     //   notificationCountBloc:
//   //     //       NotificationCountBloc(appRepository: AppRepository()),
//   //     // );
//   //
//   //     case 9:
//   //     // _launchURL(baseWebPrivacyPolicyURL);
//   //     // return TabBarScreen(
//   //     //   pageIndex: 0,
//   //     //   notificationCountBloc:
//   //     //       NotificationCountBloc(appRepository: AppRepository()),
//   //     // );
//   //
//   //     default:
//   //       return Container();
//   //       // return TabBarScreen(
//   //       //   pageIndex: selectedTabIndex,
//   //       //   notificationCountBloc:
//   //       //       NotificationCountBloc(appRepository: AppRepository()),
//   //       // );
//   //       break;
//   //   }
//   // }
//
//   // Widget _logOutButton() {
//   //   return GestureDetector(
//   //     onTap: () async {
//   //       showAlertDialog(context);
//   //     },
//   //     child: Align(
//   //       alignment: Alignment.bottomCenter,
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.end,
//   //         children: [
//   //           Image(
//   //             height: 54,
//   //             width: 54,
//   //             image: AssetImage(AssetImages.logout),
//   //           ),
//   //           SizedBox(
//   //             height: 10,
//   //           ),
//   //           Container(
//   //             padding: const EdgeInsets.only(bottom: 32.0),
//   //             child: Text(
//   //               kLogout,
//   //               style: TextStyle(
//   //                 fontFamily: 'Montserrat',
//   //                 fontWeight: FontWeight.w400,
//   //                 fontSize: 18.0,
//   //                 color: AppColors.white,
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget buildMenu() {
//     _drawerItems = [
//       DrawerItem(
//           'kHome', Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuSellList',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuWatchList',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuHistory',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuRatings',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuCardDetails',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuReviews',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuHowItWorks',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuTermsConditions',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//       DrawerItem('kSideMenuPrivacyPolicy',
//           Icon(Icons.verified_user, size: 20.0, color: Colors.white)),
//     ];
//
//     var _drawerOptions = <Widget>[];
//
//     for (var i = 0; i < _drawerItems.length; i++) {
//       var d = _drawerItems[i];
//       _drawerOptions.add(
//         ListTile(
//           dense: true,
//           // leading: d.icon,
//           title: Row(
//             children: [
//               Visibility(
//                 visible: i == _selectedDrawerIndex,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 5.0),
//                   child: Container(
//                     width: 5,
//                     height: 5,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               Text(d.title,
//                   style: i != _selectedDrawerIndex
//                       ? TextStyle(
//                           color: Colors.blue,
//                           fontFamily: 'Nexa',
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold)
//                       : TextStyle(
//                           color: Colors.yellow,
//                           fontFamily: 'Nexa',
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold)),
//             ],
//           ),
//           selected: i == _selectedDrawerIndex,
//           onTap: () => _onSelectDrawerItem(i),
//         ),
//       );
//     }
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // _userImgContainer(),
//         Expanded(
//           child: ListView.builder(
//             itemCount: _drawerOptions.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 child: _drawerOptions[index],
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           height: 25.0,
//         ),
//         // Column(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: [
//         //     _logOutButton(),
//         //   ],
//         // ),
//       ],
//     );
//   }
//
//   _onSelectDrawerItem(int index) {
//     setState(() => _selectedDrawerIndex = index);
//
//     final _state = sideMenuKey.currentState;
//     print("State of SideMenu Key :: ${sideMenuKey.currentState}");
//     print("State of SideMenu :: $_state");
//     if (_state!.isOpened)
//       _state.closeSideMenu();
//     else
//       _state.openSideMenu();
//   }
// }
