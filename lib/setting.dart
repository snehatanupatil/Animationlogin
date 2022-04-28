import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin code'),
      ),
      body: width<500?SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Set up PIN',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            const Text('You can use this PIN to unlock the app.'),
            const SizedBox(height: 20),
            Expanded(
              child: PinCodeWidget(
                filledIndicatorColor:  Colors.blueGrey,
                emptyIndicatorColor: Colors.grey,
                deleteIconColor: CupertinoColors.systemGrey,
                deleteButtonColor: Colors.white,
                onPressColorAnimation: Colors.grey,
                clearOnFilled: true,
                buttonColor: Colors.white,
                borderSide: BorderSide(color: Colors.grey),
                onFullPin: (_, __) {},
                initialPinLength: 6,
                onChangedPin: (_) {},
              ),
            ),
          ],
        ),
      ):SafeArea(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,60,0,0),
          child: Text(
            'Set up PIN',
            style:TextStyle(fontSize: 30,fontWeight: FontWeight.normal)
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,30),
          child: const Text('You can use this PIN to unlock the app.',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
        ),
        // SingleChildScrollView(
        //   child:
          Expanded(
            child: PinCodeWidget(
              filledIndicatorColor:  Colors.blueGrey,
              emptyIndicatorColor: Colors.grey,
              deleteIconColor: CupertinoColors.systemGrey,
              deleteButtonColor: Colors.white,
              onPressColorAnimation: Colors.grey,
              clearOnFilled: true,
              buttonColor: Colors.white,
              borderSide: BorderSide(color: Colors.grey),
              onFullPin: (_, __) {},
              initialPinLength: 6,
              onChangedPin: (_) {},
            ),
          ),
       // ),
      ],
    ),
    ),
    );
  }
}
