import 'package:flutter/material.dart';

var pageList = [
  OnboardingScreen(
      title: "Read",
      body: "Exciting Comics",
      imageUrl: 'assets/images/Strike-Guard-9-Cover.jpg',
      colorGradient: gradient[0]),
  OnboardingScreen(
      title: "Share",
      body: "Exciting Stuff",
      imageUrl: 'assets/images/Strike-Guard-9-Cover.jpg',
      colorGradient: gradient[1])
];

var gradient = [
  [Colors.amber, Colors.teal],
  [Colors.lightBlue, Colors.orangeAccent]
];

class OnboardingScreen {
  final String title;
  final String body;
  final String assetUrl;
  final List<Color> colorGradient;
  final String imageUrl;

  OnboardingScreen(
      {this.title,
      this.body,
      this.assetUrl,
      this.colorGradient,
      this.imageUrl});
}
