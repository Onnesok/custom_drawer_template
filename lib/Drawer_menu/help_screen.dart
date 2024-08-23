import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../themes/app_theme.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,

      appBar: AppBar(
        title: Text("Help center"),
        centerTitle: true,
        backgroundColor: AppTheme.white,
      ),
      
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset(
                'assets/images/help.png',
              height: 250,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: const Text(
              'How can we help you?',
              style: AppTheme.headline,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'If you are facing any problems feel free to get in touch with us. We are available for your support... This is the support or help page for the app... Feel free to contact us...',
              textAlign: TextAlign.justify,
              style: AppTheme.body1,
            ),
          ),

          const Spacer(),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            margin: EdgeInsets.only(bottom: 60),
            child: ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Chat not integrated for dev version");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15,),
                backgroundColor: AppTheme.blueaccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                shadowColor: AppTheme.blueaccent.withOpacity(0.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Chat with us',
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
  }
}
