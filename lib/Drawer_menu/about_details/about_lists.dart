import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Profile {
  final String name;
  final String? description;
  final String? imagePath;
  final Uri? profileUrl;

  Profile({
    required this.name,
    this.description,
    this.imagePath,
    this.profileUrl,
  });
}


final List<Profile> profiles = [
  Profile(
    name: 'Ratul Hasan',
    description:
    'Hello amazing Robu people.\nI am Introducing to you the Robotics Club(ROBU) App, a brainchild born out of a shared passion for technology, innovation, and a burning desire to make our club experience even more extraordinary.',
    imagePath: 'assets/images/logo.png',
    profileUrl: Uri.parse('https://www.github.com/onnesok'),
  ),
];
