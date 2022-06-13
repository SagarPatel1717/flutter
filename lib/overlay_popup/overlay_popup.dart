import 'package:flutter/material.dart';
import 'package:sf_test/config/show_overlay_master.dart';

class OverlayPopup extends StatefulWidget {
  const OverlayPopup();

  @override
  _Example3State createState() => _Example3State();
}

class _Example3State extends State<OverlayPopup> {
  GlobalKey _materialButtonGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: MaterialButton(
        key: _materialButtonGlobalKey,
        color: Colors.lightBlue.withOpacity(0.5),
        minWidth: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Text(
          'SF Drag now',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          ShowOverlayMasterClass(context, _materialButtonGlobalKey, 4);
        },
      ),
    );
  }
}
