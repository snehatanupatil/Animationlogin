import 'dart:math' as math;
import 'package:animationlogin/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
    late double width;
    late double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: width < 500 ? Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/unvired_logo.png'),
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 10, 0, 20),
                  child: TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail, color: Colors.blue),
                        hintText: 'Username',
                        border: InputBorder.none),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(180, 0, 10, 30),
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasword()),
                        );
                      },
                      child: const Text("Forgot Password",
                          style: TextStyle(color: Colors.blue)),
                    ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                              SplashScreenPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            //final tween = Tween(begin: begin, end: end);
                            //final offsetAnimation = animation.drive(tween);
                            return ScaleTransition(
                              scale: Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.fastOutSlowIn,
                                ),
                              ),
                              child: child,
                            );
                            // return SlideTransition(
                            //     position: offsetAnimation, child: child);
                            // return FadeTransition(
                            //   opacity: animation,
                            //   child: child,
                            // );
                          },
                        ),
                        //_createRoute()
                      );
                    },
                    child: Container(
                      height: 56,
                      width: 256,
                      alignment: Alignment.center,
                      child:
                      const Text("Login", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ):Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/unvired_logo.png'),
                const Padding(
                  padding: EdgeInsets.fromLTRB(120, 20, 0, 20),
                  child: TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail, color: Colors.blue),
                        hintText: 'Username',hintStyle: TextStyle(fontSize: 26),
                        border: InputBorder.none),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(120, 20, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(430, 20, 10, 60),
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasword()),
                        );
                      },
                      child: const Text("Forgot Password",
                          style: TextStyle(color: Colors.blue,fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
                  child: Container(width: 560,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                SplashScreenPage(),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              //final tween = Tween(begin: begin, end: end);
                              //final offsetAnimation = animation.drive(tween);
                              return ScaleTransition(
                                scale: Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                ),
                                child: child,
                              );
                              // return SlideTransition(
                              //     position: offsetAnimation, child: child);
                              // return FadeTransition(
                              //   opacity: animation,
                              //   child: child,
                              // );
                            },
                          ),
                          //_createRoute()
                        );
                      },
                      child: Container(
                        height: 56,
                        width: 256,
                        alignment: Alignment.center,
                        child:
                        const Text("Login", style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Change Password "),
      content: const TextField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
            icon: Icon(Icons.mail, color: Colors.blue),
            hintText: 'Email',
            border: InputBorder.none),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Send'),
        )
      ],
    );
  }
}

// import 'dart:math' as math;
// import 'package:animationlogin/splash.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'home.dart';
//
// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     Key? key,
//     required this.isLogin,
//     required this.animationDuration,
//     required this.size,
//     required this.defaultLoginSize,
//   }) : super(key: key);
//
//   final bool isLogin;
//   final Duration animationDuration;
//   final Size size;
//   final double defaultLoginSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: isLogin ? 1.0 : 0.0,
//       duration: animationDuration * 4,
//       child: Align(
//         alignment: Alignment.center,
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/unvired_logo.png'),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(60, 10, 0, 20),
//                   child: TextField(
//                     cursorColor: Colors.blue,
//                     decoration: InputDecoration(
//                         icon: Icon(Icons.mail, color: Colors.blue),
//                         hintText: 'Username',
//                         border: InputBorder.none),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
//                   child: TextField(
//                     cursorColor: Colors.blue,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         icon: Icon(Icons.lock, color: Colors.blue),
//                         hintText: 'Password',
//                         border: InputBorder.none),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(180, 0, 10, 30),
//                   child: Container(
//                     child: FlatButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ForgotPasword()),
//                         );
//                       },
//                       child: const Text("Forgot Password",
//                           style: TextStyle(color: Colors.blue)),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         primary: Colors.blue),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           pageBuilder:
//                               (context, animation, secondaryAnimation) =>
//                                   SplashScreenPage(),
//                           transitionsBuilder:
//                               (context, animation, secondaryAnimation, child) {
//                             const begin = Offset(1.0, 0.0);
//                             const end = Offset.zero;
//                             //final tween = Tween(begin: begin, end: end);
//                             //final offsetAnimation = animation.drive(tween);
//                             return ScaleTransition(
//                               scale: Tween<double>(
//                                 begin: 0.0,
//                                 end: 1.0,
//                               ).animate(
//                                 CurvedAnimation(
//                                   parent: animation,
//                                   curve: Curves.fastOutSlowIn,
//                                 ),
//                               ),
//                               child: child,
//                             );
//                             // return SlideTransition(
//                             //     position: offsetAnimation, child: child);
//                             // return FadeTransition(
//                             //   opacity: animation,
//                             //   child: child,
//                             // );
//                           },
//                         ),
//                         //_createRoute()
//                       );
//                     },
//                     child: Container(
//                       height: 56,
//                       width: 256,
//                       alignment: Alignment.center,
//                       child:
//                           const Text("Login", style: TextStyle(fontSize: 20)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ForgotPasword extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Change Password "),
//       content: const TextField(
//         cursorColor: Colors.blue,
//         decoration: InputDecoration(
//             icon: Icon(Icons.mail, color: Colors.blue),
//             hintText: 'Email',
//             border: InputBorder.none),
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.pop(context, 'Cancel'),
//           child: const Text('Send'),
//         )
//       ],
//     );
//   }
// }
