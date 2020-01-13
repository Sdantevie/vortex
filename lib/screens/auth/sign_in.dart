import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    InputDecoration _decoration = InputDecoration(
      filled: true,
      fillColor: Color(0xFF2A2E3D),
      contentPadding: EdgeInsets.all(8.0),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD71786), width: 1.0)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF691F), width: 1.0)),
    );

    TextStyle _labelStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'OpenSans',
        fontSize: ScreenUtil.getInstance().setSp(40));

    TextStyle _textFieldStyle =
        TextStyle(color: Colors.white, fontFamily: 'OpenSans');

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
          body: _buildScrollable(),
        )
      );
          
              // return Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Color(0xFF040313), Color(0xFF2A2E3D)],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         tileMode: TileMode.clamp,
              //         stops: [0.0, 1.0]),
              //   ),
              //   child: Scaffold(
              //       backgroundColor: Colors.transparent,
              //       resizeToAvoidBottomPadding: true,
              //       body: SingleChildScrollView(
              //         child: Padding(
              //           padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //               Image.asset(
              //                 "assets/images/vortex247.png",
              //                 width: ScreenUtil.getInstance().setWidth(100),
              //                 height: ScreenUtil.getInstance().setHeight(100),
              //               ),
              //               SizedBox(
              //                 height: ScreenUtil.getInstance().setHeight(165),
              //               ),
              //               Text("Login",
              //                   style: TextStyle(
              //                       fontSize: 30.0,
              //                       color: Colors.white,
              //                       fontFamily: 'OpenSans')),
              //               Container(
              //                 width: double.infinity,
              //                 margin: EdgeInsets.only(top: 10.0),
              //                 height: ScreenUtil.getInstance().setHeight(700),
              //                 decoration: BoxDecoration(
              //                     color: Colors.white.withOpacity(0.4),
              //                     border: Border.all(),
              //                     borderRadius: BorderRadius.circular(8.0)),
              //                 child: Padding(
              //                   padding:
              //                       EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: <Widget>[
              //                       SizedBox(
              //                         height: ScreenUtil.getInstance().setHeight(10),
              //                       ),
              //                       Text("Username or Email", style: _labelStyle),
              //                       TextField(
              //                           cursorColor: Colors.white,
              //                           style: _textFieldStyle,
              //                           decoration: _decoration),
              //                       SizedBox(
              //                         height: ScreenUtil.getInstance().setHeight(50),
              //                       ),
              //                       Text("Password", style: _labelStyle),
              //                       TextField(
              //                           cursorColor: Colors.white,
              //                           keyboardType: TextInputType.visiblePassword,
              //                           style: _textFieldStyle,
              //                           decoration: _decoration),
              //                       SizedBox(
              //                         height: ScreenUtil.getInstance().setHeight(60),
              //                       ),
              //                       FlatButton(
              //                         color: Color(0xFFFF691F),
              //                         splashColor: Color(0xFFD71786),
              //                         onPressed: () {},
              //                         child: Text(
              //                           "Login",
              //                           style: TextStyle(
              //                               color: Colors.white,
              //                               fontSize: 18.0,
              //                               fontFamily: 'OpenSans'),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       )),
             // );
            }
          
  _buildScrollable() {
    return CustomScrollView(slivers: <Widget>[
          SliverAppBar(
          elevation: 4.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          expandedHeight: 80.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Login',
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 44.0),
                  sliver: SliverList(delegate: SliverChildListDelegate([
             Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                        cursorColor: Color(0xFFFF691F),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'OpenSans'),
                        decoration: _generateDecoration('Username'))),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                        obscureText: true,
                        cursorColor: Color(0xFFFF691F),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'OpenSans'),
                        decoration: _generateDecoration('Password'))),
                Row(children: <Widget>[FlatButton(
                  color: Color(0xFFFF691F),
                  splashColor: Color(0xFFD71786),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'OpenSans'),
                  ),
                )],)
          ]),),
        )
      ],
    );
  }
   InputDecoration _generateDecoration(String label) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: -2.0, horizontal: 10.0),
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: 'OpenSans', color: Color(0xFFFF691F), fontSize: 17.0),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF691F))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF691F))));
  }
}
