// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader
      .clearSavedSettings(); // Clears any saved settings for demonstration purposes
  runApp(const AppUpgrader());
}

class AppUpgrader extends StatelessWidget {
  const AppUpgrader({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final upgrader = Upgrader(
      storeController: UpgraderStoreController(
        onAndroid: () => UpgraderPlayStore(),
        oniOS: () =>
            UpgraderAppcastStore(appcastURL: "https://example.com/appcast.xml"),
      ),
    );

    return MaterialApp(
      title: 'Upgrader Example',
      home: UpgradeAlert(
        child: Scaffold(
            body: UpgradeAlert(
          dialogStyle: UpgradeDialogStyle.cupertino,
          child: Center(child: Text('Checking...')),
        )),
      ),
    );
  }
}
