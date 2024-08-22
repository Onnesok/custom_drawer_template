import 'package:custom_drawer/url%20launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:custom_drawer/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;
    bool _isLoading = false;
    Uri facebook_url = Uri.parse("https://www.facebook.com/Onnesok.94");
    Uri github_url = Uri.parse('https://www.github.com/onnesok');
    Uri youtube_url = Uri.parse('https://www.youtube.com/@Onnesok');


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: AppTheme.white,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppTheme.white,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Lottie.asset(
                  'assets/lottie/cat2.json',
                  repeat: true,
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.notWhite,
                    shadowColor: AppTheme.blueaccent,
                    elevation: 10,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Nothing to see here.....");
                    Fluttertoast.showToast(msg: "This is a drawer app template...");
                    Fluttertoast.showToast(msg: "Other functions are not focused...");
                  },
                  child: Icon(
                    Icons.power_settings_new_outlined,
                    size: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Text(
                "Nothing button",
                style: AppTheme.display1,
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "This is a template app for custom app drawer...This template is made by Ratul Hasan.... To know more about this template go to this repo: https://github.com/Onnesok/custom_drawer_template",
                  style: AppTheme.body1,
                  textAlign: TextAlign.justify,
                ),
              ),
              
              SizedBox(height: 20,),
              
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        abouturl(github_url);
                        Fluttertoast.showToast(msg: "Opening....");
                      },
                      child: Image.asset("assets/images/github.png", scale: 14,),
                    ),

                    SizedBox(width: 10,),

                    GestureDetector(
                      onTap: () {
                        abouturl(youtube_url);
                        Fluttertoast.showToast(msg: "Opening....");
                      },
                      child: Image.asset("assets/images/youtube.png", scale: 14,),
                    ),

                    SizedBox(width: 10,),

                    GestureDetector(
                      onTap: () {
                        abouturl(facebook_url);
                        Fluttertoast.showToast(msg: "Opening....");
                      },
                      child: Image.asset("assets/images/facebook.png", scale: 14,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
