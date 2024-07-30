import 'package:local_auth/local_auth.dart';

class FingerPrintService {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> checkBioMetricSensor() async {
    return await _localAuthentication.canCheckBiometrics;
  }

  Future<bool> authenticate() async {
    try {
      if (await checkBioMetricSensor()) {
        return await _localAuthentication.authenticate(
          localizedReason: 'Please authenticate to proceed',
        );
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}