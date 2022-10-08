import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_routes.dart';
import 'package:local_auth/local_auth.dart';


class BiometricHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> authenticate(context,appRoute) async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: '1aidentiti',
        options:
            const AuthenticationOptions(biometricOnly: true, stickyAuth: true,useErrorDialogs: true));

    Navigator.of(context)
        .pushNamed(AppRoutes.dashboard);
    return didAuthenticate;
  }
}
