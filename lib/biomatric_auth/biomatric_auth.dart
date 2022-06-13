import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BioMatricAuth extends StatefulWidget {
  @override
  _BioMatricAuthState createState() => _BioMatricAuthState();
}

class _BioMatricAuthState extends State<BioMatricAuth> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      checkBioMatricSupportedInDevice();
    }, child: Text('check availability'));
  }
}


extension _ on _BioMatricAuthState {

  Future<bool> checkBioMatricSupportedInDevice() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = await auth.isDeviceSupported();

    print('canAuthenticateWithBiometrics: $canAuthenticateWithBiometrics >>>> >>>> >>>> >>>> >>>> >>>> >>>> >>>> ');
    print('canAuthenticate: $canAuthenticate >>>> >>>> >>>> >>>> >>>> >>>> >>>> >>>> ');


    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    return false;
  }
}