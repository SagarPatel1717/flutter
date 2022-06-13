// import 'package:flutter/material.dart';
// import 'package:callkeep/callkeep.dart';
// import 'package:uuid/uuid.dart';
//
// final FlutterCallkeep _callKeep = FlutterCallkeep();
//
// class CallKeep extends StatefulWidget {
//   @override
//   _CallKeepState createState() => _CallKeepState();
// }
//
// class _CallKeepState extends State<CallKeep> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       color: Colors.blue,
//       child: Center(
//         child: GestureDetector(
//           onTap: () {
//             displayIncomingCall('+919033933809', context);
//           },
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.yellow,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<void> displayIncomingCall(String number, BuildContext context) async {
//   const uuid = Uuid();
//   final callUUID = uuid.v4();
//
//   print('Display incoming call now');
//   final hasPhoneAccount = await _callKeep.hasPhoneAccount();
//   if (!hasPhoneAccount) {
//     await _callKeep.hasDefaultPhoneAccount(context, <String, dynamic>{
//       'alertTitle': 'Permissions required',
//       'alertDescription':
//       'This application needs to access your phone accounts',
//       'cancelButton': 'Cancel',
//       'okButton': 'ok',
//       'foregroundService': {
//         'channelId': 'com.company.my',
//         'channelName': 'Foreground service for my app',
//         'notificationTitle': 'My app is running on background',
//         'notificationIcon': 'Path to the resource icon of the notification',
//       },
//     });
//   }
//   final callSetup = <String, dynamic>{
//     'ios': {
//       'appName': 'CallKeepDemo',
//     },
//     'android': {
//       'alertTitle': 'Permissions required',
//       'alertDescription':
//       'This application needs to access your phone accounts',
//       'cancelButton': 'Cancel',
//       'okButton': 'ok',
//       'additionalPermissions': <String>[],
//       // Required to get audio in background when using Android 11
//       'foregroundService': {
//         'channelId': 'com.company.my',
//         'channelName': 'Foreground service for my app',
//         'notificationTitle': 'My app is running on background',
//         'notificationIcon': 'mipmap/ic_notification_launcher',
//       },
//     },
//   };
//
//   await _callKeep.setup(context, callSetup);
//
//   print('[displayIncomingCall] $callUUID number: $number');
//   await _callKeep.displayIncomingCall(callUUID, number,
//       localizedCallerName: 'hello', handleType: 'number', hasVideo: false);
// }