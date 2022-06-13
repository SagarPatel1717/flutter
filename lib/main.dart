import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sf_test/biomatric_auth/biomatric_auth.dart';
import 'package:sf_test/isolets/performance_page.dart';
import 'package:sf_test/render_object_widget/progress_bar.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'DragabbleScrollableSheetDemo/dragabble_scrollable_sheet_demo.dart';
import 'analog_clock/analog_clock_example.dart';
import 'animated_list.dart';
import 'clock_loader_view/clock_loader.dart';
import 'clock_loader_view/simple_square.dart';
import 'clock_loader_view/simple_square_with_angle.dart';
import 'clock_view/circle_12_path.dart';
import 'clock_view/clock_animated_align.dart';
import 'clock_view/clock_complex_path_with_animation.dart';
import 'clock_loader_view/clock_loader_old.dart';
import 'clock_view/clock_multiple_animations.dart';
import 'clock_view/clock_view.dart';
import 'clock_view/clock_simple_path.dart';
import 'clock_loader_view/simple_square_old.dart';
import 'clock_view/test.dart';
import 'graph_ql/graph_ql.dart';
import 'grid_view/grid_view.dart';
import 'icon_animation/testIcon.dart';
import 'icon_animation/testIcon_new.dart';
import 'custom_painter_examples/custom_painter_examples.dart';
import 'inherited_widget/inherited_widget.dart';
import 'nested_listview/nested_listview.dart';
import 'overlay_popup/overlay_popup.dart';
import 'popup_menu.dart';
import 'slivers/sliver_app_bar.dart';
import 'slivers/sliver_appbar_with_bottam_sheet.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            // color: Colors.cyan,
            alignment: Alignment.center,
            color: Color(0xFFff5558),
            // child: ElevatedButton(onPressed: () {
            //   print('clicked >>>> >>>> >>>> >>>> >>>> >>>> ');
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return BioMatricAuth();
            //   }));
            // }, child: Text('Go to biomatric world')),

            child: RootWidget(),

            // child: SignInWithAppleButton(
            //   onPressed: () async {
            //     final credential = await SignInWithApple.getAppleIDCredential(
            //       scopes: [
            //         AppleIDAuthorizationScopes.email,
            //         AppleIDAuthorizationScopes.fullName,
            //       ],
            //     );
            //
            //     print(credential);
            //     print(credential.authorizationCode);
            //
            //     print(credential.userIdentifier);
            //     print(credential.givenName);
            //     print(credential.familyName);
            //     print(credential.email);
            //     print(credential.identityToken);
            //
            //     // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
            //     // after they have been validated with Apple (see `Integration` section for more information on how to do this)
            //   },
            // ),
            // child: SimpleSquare(
            //   clockLoaderModel: ClockLoaderModel(
            //       shapeOfParticles: ShapeOfParticlesEnum.circle,
            //       mainHandleColor: Colors.white,
            //       particlesColor: Colors.white),
            // ),
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: GirdDemo(),
//     );
//   }
// }
