import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../themes/app_theme.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  late TextEditingController _feedback_controller;


  @override
  void initState() {
    super.initState();
    _feedback_controller = TextEditingController();
  }

  @override
  void dispose() {
    _feedback_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.white,

      appBar: AppBar(
        title: Text("Feedback"),
        centerTitle: true,
        backgroundColor: AppTheme.white,
      ),

      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,

          child: Column(
            children: <Widget>[

              Container(
                //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 16, right: 16),
                child: Image.asset(
                  'assets/images/feedback.png',
                  height: 250,
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 8),
                child: const Text(
                  'Your Feedback',
                  style: AppTheme.headline,
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Give your best time for this moment.',
                  textAlign: TextAlign.center,
                  style: AppTheme.body1,
                ),
              ),

              _buildComposer(),

              const SizedBox(height: 50,),

              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  onPressed: () {
                    print(_feedback_controller.text);
                    Fluttertoast.showToast(msg: "Feedback not integrated for dev version");
                    _feedback_controller.clear();
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
                        Icons.bubble_chart_outlined,
                        color: AppTheme.white,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Send Feedback',
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
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),

      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 8,
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),

          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 200,
            ),
            color: AppTheme.white,

            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _feedback_controller,
                maxLines: null,
                onChanged: (String txt) {},
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontSize: 16,
                  color: AppTheme.darkGrey,
                ),

                cursorColor: Colors.blue,

                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
