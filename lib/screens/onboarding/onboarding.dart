import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen_data.dart';
import 'page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [0.0, 1.0]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      PageView.builder(
                          itemCount: pageList.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentPage = index;
                              lastPage = currentPage == pageList.length - 1;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Positioned.fill(
                                  child: AnimatedBuilder(
                                    animation: _pageController,
                                    builder: (context, child) {
                                      var page = pageList[index];
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: 90.0,
                                            margin: EdgeInsets.only(left: 12.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Opacity(
                                                    opacity: .10,
                                                    child: GradientText(
                                                        page.title,
                                                        gradient: LinearGradient(
                                                            colors: page
                                                                .colorGradient),
                                                        style: TextStyle(
                                                            fontSize: 100.0))),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 25.0, left: 22.0),
                                                  child: GradientText(
                                                      page.title,
                                                      gradient: LinearGradient(
                                                          colors: page
                                                              .colorGradient),
                                                      style: TextStyle(
                                                          fontSize: 70.0)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 38.0, top: 0),
                                            child: Text(
                                              page.body,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          }),
                      Positioned(
                        left: 30.0,
                        bottom: 55.0,
                        child: Container(
                          width: 160.0,
                          child: PageIndicator(
                              currentIndex: currentPage,
                              pageCount: pageList.length),
                        ),
                      ),
                      Positioned(
                          right: 30.0,
                          bottom: 30.0,
                          child: lastPage
                              ? FloatingActionButton(
                                  backgroundColor: Colors.lightBlue,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _enterApp(context);
                                  },
                                )
                              : Container())
                    ],
                  ),
                ),
              ),
            )));
  }

  void _enterApp(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('visited', false);

    Navigator.of(context).pushNamed('/');
  }
}
