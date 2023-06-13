import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'icon_switcher_platform_interface.dart';

/// An implementation of [IconSwitcherPlatform] that uses method channels.
class MethodChannelIconSwitcher extends IconSwitcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('icon_switcher');

  @override
  Future<bool> setAppIcon(String iconName) async {
    return await methodChannel.invokeMethod<bool>('setAppIcon', {"iconName": iconName}) ?? false;
  }

  @override
  Future<bool> resetAppIcon() async {
    return await methodChannel.invokeMethod<bool>('resetAppIcon') ?? false;
  }

  @override
  Future<String> getIconName() async {
    return await methodChannel.invokeMethod<String>('getIconName') ?? "default";
  }
}