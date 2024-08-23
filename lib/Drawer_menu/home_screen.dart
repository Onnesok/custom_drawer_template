import 'package:custom_drawer/url%20launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:custom_drawer/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Future<void>? _launched;
    Uri linkedin_url = Uri.parse("https://www.linkedin.com/in/ratul-hasan-45911b245/");
    Uri github_url = Uri.parse('https://www.github.com/onnesok');
    Uri youtube_url = Uri.parse('https://www.youtube.com/@Onnesok');


    return Scaffold(
      backgroundColor: AppTheme.white,

      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: AppTheme.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                child: Text("Follow me on....", style: AppTheme.subtitle,),
              ),
              SizedBox(height: 5,),

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
                        abouturl(linkedin_url);
                        Fluttertoast.showToast(msg: "Opening....");
                      },
                      child: Image.asset("assets/images/linkedin.png", scale: 14,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
