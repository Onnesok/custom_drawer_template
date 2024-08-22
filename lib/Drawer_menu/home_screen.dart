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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.notWhite,
                  shadowColor: AppTheme.blueaccent,
                ),
                  onPressed: () {
                  Fluttertoast.showToast(msg: "Nothing to see here.....");
                  Fluttertoast.showToast(msg: "This is a drawer app template...");
                  Fluttertoast.showToast(msg: "Other functions are not focused...");
                  },
                  child: Icon(
                    Icons.power_settings_new_outlined,
                    size: MediaQuery.of(context).size.width * 0.35,
                  ),
              ),
            ),

            SizedBox(height: 30,),

            Text(
                "Nothing button",
              style: AppTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}


