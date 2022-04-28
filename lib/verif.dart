import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class verif extends StatefulWidget {
  final String? phoneNumber;

  const verif({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _verifState createState() =>
      _verifState();
}

class _verifState extends State<verif> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }


  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: width<500?GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/unvired_logo.png"),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "Enter the code sent to you number",
                        style:
                        TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveColor: Colors.blue,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            selectedColor: Colors.greenAccent,
                            activeColor: Colors.green
                        ),
                        cursorColor: Colors.blue,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },

                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child: const Text(
                        "RESEND",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                        if (currentText.length != 6 || currentText != "123456") {
                          errorController!.add(ErrorAnimationType
                              .shake);
                          setState(() => hasError = true);
                        } else {
                          setState(
                                () {
                              hasError = false;
                              snackBar("OTP Verified!!");
                            },
                          );
                        }
                      },
                      child: Center(
                          child: Text(
                            "VERIFY".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: TextButton(
                          child: const Text("Clear"),
                          onPressed: () {
                            textEditingController.clear();
                          },
                        )),
                    Flexible(
                        child: TextButton(
                          child: const Text("Set Text"),
                          onPressed: () {
                            setState(() {
                              textEditingController.text = "123456";
                            });
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        ):GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/unvired_logo.png"),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "Enter the code sent to you number",
                        style:
                        TextStyle(color: Colors.black54, fontSize: 20)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(160,30,160,10),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveColor: Colors.blue,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            selectedColor: Colors.greenAccent,
                            activeColor: Colors.green
                        ),
                        cursorColor: Colors.blue,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },

                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child: const Text(
                        "RESEND",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(130,90,130,30),
                  child: Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          if (currentText.length != 6 || currentText != "123456") {
                            errorController!.add(ErrorAnimationType
                                .shake);
                            setState(() => hasError = true);
                          } else {
                            setState(
                                  () {
                                hasError = false;
                                snackBar("OTP Verified!!");
                              },
                            );
                          }
                        },
                        child: Center(
                            child: Text(
                              "VERIFY".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: TextButton(
                          child: const Text("Clear",style:  TextStyle(
                              color: Colors.blue,
                              fontSize: 20)),
                          onPressed: () {
                            textEditingController.clear();
                          },
                        )),
                    Flexible(
                        child: TextButton(
                          child: const Text("Set Text",style:  TextStyle(
                              color: Colors.blue,
                              fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              textEditingController.text = "123456";
                            });
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// class verif extends StatefulWidget {
//   final String? phoneNumber;
//
//   const verif({
//     Key? key,
//     this.phoneNumber,
//   }) : super(key: key);
//
//   @override
//   _verifState createState() =>
//   _verifState();
// }
//
// class _verifState extends State<verif> {
//   TextEditingController textEditingController = TextEditingController();
//
//   StreamController<ErrorAnimationType>? errorController;
//
//   bool hasError = false;
//   String currentText = "";
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     errorController = StreamController<ErrorAnimationType>();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     errorController!.close();
//
//     super.dispose();
//   }
//
//
//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message!),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GestureDetector(
//         onTap: () {},
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: ListView(
//             children: <Widget>[
//               const SizedBox(height: 30),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 3,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.asset("assets/images/unvired_logo.png"),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                   'Phone Number Verification',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//                   textAlign: TextAlign.center,
//                 ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
//                 child: RichText(
//                   text: const TextSpan(
//                       text: "Enter the code sent to you number",
//                       style:
//                       TextStyle(color: Colors.black54, fontSize: 15)),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Form(
//                 key: formKey,
//                 child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 30),
//                     child: PinCodeTextField(
//                       appContext: context,
//                       pastedTextStyle: TextStyle(
//                         color: Colors.green.shade600,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       length: 6,
//                       obscureText: true,
//                       obscuringCharacter: '*',
//                       blinkWhenObscuring: true,
//                       animationType: AnimationType.fade,
//                       validator: (v) {
//                         if (v!.length < 3) {
//                           return "I'm from validator";
//                         } else {
//                           return null;
//                         }
//                       },
//                       pinTheme: PinTheme(
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.circular(5),
//                           fieldHeight: 50,
//                           fieldWidth: 40,
//                           activeFillColor: Colors.white,
//                           inactiveColor: Colors.blue,
//                           inactiveFillColor: Colors.white,
//                           selectedFillColor: Colors.white,
//                           selectedColor: Colors.greenAccent,
//                           activeColor: Colors.green
//                       ),
//                       cursorColor: Colors.blue,
//                       animationDuration: const Duration(milliseconds: 300),
//                       enableActiveFill: true,
//                       errorAnimationController: errorController,
//                       controller: textEditingController,
//                       keyboardType: TextInputType.number,
//                       boxShadows: const [
//                         BoxShadow(
//                           offset: Offset(0, 1),
//                           color: Colors.black12,
//                           blurRadius: 10,
//                         )
//                       ],
//                       onCompleted: (v) {
//                         debugPrint("Completed");
//                       },
//
//                       onChanged: (value) {
//                         debugPrint(value);
//                         setState(() {
//                           currentText = value;
//                         });
//                       },
//                       beforeTextPaste: (text) {
//                         debugPrint("Allowing to paste $text");
//                         return true;
//                       },
//                     )),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: Text(
//                   hasError ? "*Please fill up all the cells properly" : "",
//                   style: const TextStyle(
//                     color: Colors.red,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Didn't receive the code? ",
//                     style: TextStyle(color: Colors.black54, fontSize: 15),
//                   ),
//                   TextButton(
//                     onPressed: () => snackBar("OTP resend!!"),
//                     child: const Text(
//                       "RESEND",
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 14,
//               ),
//               Container(
//                 margin:
//                 const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
//                 child: ButtonTheme(
//                   height: 50,
//                   child: TextButton(
//                     onPressed: () {
//                       formKey.currentState!.validate();
//                       if (currentText.length != 6 || currentText != "123456") {
//                         errorController!.add(ErrorAnimationType
//                             .shake);
//                         setState(() => hasError = true);
//                       } else {
//                         setState(
//                               () {
//                             hasError = false;
//                             snackBar("OTP Verified!!");
//                           },
//                         );
//                       }
//                     },
//                     child: Center(
//                         child: Text(
//                           "VERIFY".toUpperCase(),
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.blue.shade300,
//                     borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Flexible(
//                       child: TextButton(
//                         child: const Text("Clear"),
//                         onPressed: () {
//                           textEditingController.clear();
//                         },
//                       )),
//                   Flexible(
//                       child: TextButton(
//                         child: const Text("Set Text"),
//                         onPressed: () {
//                           setState(() {
//                             textEditingController.text = "123456";
//                           });
//                         },
//                       )),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }