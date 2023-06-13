import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'icon_switcher_method_channel.dart';

abstract class IconSwitcherPlatform extends PlatformInterface {
  /// Constructs a IconSwitcherPlatform.
  IconSwitcherPlatform() : super(token: _token);

  static final Object _token = Object();

  static IconSwitcherPlatform _instance = MethodChannelIconSwitcher();

  /// The default instance of [IconSwitcherPlatform] to use.
  ///
  /// Defaults to [MethodChannelIconSwitcher].
  static IconSwitcherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IconSwitcherPlatform] when
  /// they register themselves.
  static set instance(IconSwitcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> setAppIcon(String iconName) {
    throw UnimplementedError('setAppIcon(iconName:) has not been implemented.');
  }

  Future<bool> resetAppIcon() {
    throw UnimplementedError('resetAppIcon() has not been implemented.');
  }

  Future<String> getIconName() {
    throw UnimplementedError('getIconName() has not been implemented.');
  }
}