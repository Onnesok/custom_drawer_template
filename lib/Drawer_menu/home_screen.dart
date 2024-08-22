import 'package:custom_drawer/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.notWhite,
              shadowColor: AppTheme.blueaccent,
            ),
              onPressed: () {
              Fluttertoast.showToast(msg: "Nothing");
              },
              child: Icon(
                Icons.power_settings_new_outlined,
                size: MediaQuery.of(context).size.width * 0.35,
              ),
          ),
        ),
      ),
    );
  }
}


