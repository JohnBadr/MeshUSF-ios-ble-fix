import 'package:web/web.dart' as web;
import 'dart:js_interop';

@JS('eval')
external JSString _eval(JSString code);

class BrowserDetection {
  static bool get isChrome {
    final userAgent = web.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('chrome');
  }

  static bool get supportsWebBluetooth {
    try {
      final res = _eval('("bluetooth" in navigator)'.toJS);
      return res.toDart.toString() == 'true';
    } catch (_) {
      return false;
    }
  }
}