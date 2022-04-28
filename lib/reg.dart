import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child:width<500? Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/unvired_logo.png'),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(60, 30, 0, 20),
                    child: TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.blue),
                          hintText: 'Email',
                          border: InputBorder.none),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 20),
                    child: TextField(
                      cursorColor: Colors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.face_outlined, color: Colors.blue),
                          hintText: 'Username',
                          border: InputBorder.none),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 30),
                    child: TextField(
                      cursorColor: Colors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.blue),
                          hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.blue),
                      onPressed: () {},
                      child: Container(
                        height: 56,
                        width: 260,
                        alignment: Alignment.center,
                        child: Text("Sign Up", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ):Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/unvired_logo.png'),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(120, 30, 0, 30),
                    child: TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.blue),
                          hintText: 'Email',hintStyle: TextStyle(fontSize: 26),
                          border: InputBorder.none),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(120, 0, 0, 30),
                    child: TextField(
                      cursorColor: Colors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.face_outlined, color: Colors.blue),
                          hintText: 'Username',hintStyle: TextStyle(fontSize: 26),
                          border: InputBorder.none),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(120, 0, 0, 60),
                    child: TextField(
                      cursorColor: Colors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.blue),
                          hintText: 'Password',hintStyle: TextStyle(fontSize: 26),
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.blue),
                      onPressed: () {},
                      child: Container(
                        height: 56,
                        width: 560,
                        alignment: Alignment.center,
                        child: Text("Sign Up", style: TextStyle(fontSize: 26)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
