import 'package:flutter/material.dart';
import 'dart:async';

import 'package:icon_switcher/icon_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _iconName = 'Unknown';
  final _iconSwitcherPlugin = IconSwitcher();

  @override
  void initState() {
    super.initState();
    getIconName();
  }

  Future<void> getIconName() async {
    var iconName = await _iconSwitcherPlugin.getIconName();

    if (!mounted) return;

    setState(() {
      _iconName = iconName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Icon Switcher Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current icon name: $_iconName\n'),
              TextButton(
                onPressed: () async {
                    await _iconSwitcherPlugin.setAppIcon("AppIcon-Alternative");
                    await getIconName();
                  },
                child: const Text('Switch to alternative icon'),
              ),
              TextButton(
                onPressed: () async {
                  await _iconSwitcherPlugin.resetAppIcon();
                  await getIconName();
                },
                child: const Text('Switch to default icon'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
