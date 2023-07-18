import 'dart:io';

class Functions {
  static Future<bool> getNetworkStatus({Duration? duration}) async {
    await Future.delayed(duration ?? const Duration(milliseconds: 300));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
