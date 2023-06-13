
import 'icon_switcher_platform_interface.dart';

class IconSwitcher {
  Future<bool> setAppIcon(String iconName) async {
    return IconSwitcherPlatform.instance.setAppIcon(iconName);
  }

  Future<bool> resetAppIcon() async {
    return IconSwitcherPlatform.instance.resetAppIcon();
  }

  Future<String> getIconName() async {
    return IconSwitcherPlatform.instance.getIconName();
  }
}
