import 'dart:async';
import 'dart:ui';
import 'package:custom_drawer/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Drawer_menu/about_details/about_lists.dart';
import '../url launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<void>? _launched;
  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {
    final PageController _projectPageController =
        PageController(viewportFraction: 0.4);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        title: Text("About", style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: profiles.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        width: 0.5,
                        color: AppTheme.grey.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          //offset: Offset(0, 4),
                          //blurRadius: 24,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (profile.imagePath != null)
                          ClipOval(
                            child: Image.asset(
                              profile.imagePath!,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Text(
                              'About Developer',
                              textAlign: TextAlign.center,
                              style: AppTheme.headline,
                            ),
                            Text(
                              profile.name,
                              textAlign: TextAlign.center,
                              style: AppTheme.title,
                            ),
                          ],
                        ),
                        if (profile.description != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            child: Text(
                              profile.description!,
                              style: AppTheme.body1,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        Text(
                          '(${profile.name})',
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        const SizedBox(height: 20),
                        if (profile.profileUrl != null)
                          _isLoading
                              ? CircularProgressIndicator()
                              : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    //padding: const EdgeInsets.symmetric(vertical: 15,),
                                    backgroundColor: AppTheme.blueaccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 10,
                                    shadowColor: AppTheme.blueaccent.withOpacity(0.5),
                                  ),
                                    onPressed: () {
                                      setState(() {
                                        _isLoading = true;
                                        _launched =
                                            abouturl(profile.profileUrl!);
                                      });
                                      Fluttertoast.showToast(msg: "Opening...");

                                      _launched!.whenComplete(() {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/github.png",
                                          scale: 20,
                                        ),
                                        SizedBox(width: 10),

                                        Text(
                                          'Visit Github',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
