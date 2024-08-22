import 'package:custom_drawer/Drawer_menu/about_screen.dart';
import 'package:custom_drawer/Drawer_menu/feedback_screen.dart';
import 'package:custom_drawer/Drawer_menu/help_screen.dart';
import 'package:custom_drawer/Drawer_menu/home_screen.dart';
import 'package:custom_drawer/Drawer_menu/invite_friend_screen.dart';
import 'package:flutter/material.dart';
import '../custom_drawer/drawer_user_controller.dart';
import '../custom_drawer/home_drawer.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView = const HomeScreen();
  DrawerIndex drawerIndex = DrawerIndex.home;

  @override
  Widget build(BuildContext context) {
    return DrawerUserController(
      screenIndex: drawerIndex,
      drawerWidth: MediaQuery.of(context).size.width * 0.75,
      onDrawerCall: (DrawerIndex drawerIndexdata) {
        changeIndex(drawerIndexdata);
        //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
      },
      screenView: screenView,
      //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        if (mounted) {
          setState(() {
            screenView = const HomeScreen();
          });
        }
      } else if (drawerIndex == DrawerIndex.help) {
        if (mounted) {
          setState(() {
            screenView = const HelpScreen();
          });
        }
      } else if (drawerIndex == DrawerIndex.feedback) {
        if (mounted) {
          setState(() {
            screenView = const FeedbackScreen();
          });
        }
      } else if (drawerIndex == DrawerIndex.invite) {
        if (mounted) {
          setState(() {
            screenView = const InviteFriend();
          });
        }
      } else if (drawerIndex == DrawerIndex.about) {
        if (mounted) {
          setState(() {
            screenView = const AboutScreen();
          });
        }
      }
    }
  }
}
