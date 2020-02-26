export 'package:flutter/material.dart';
export 'dart:async';
export 'dart:convert';
export 'package:lottie_flutter/lottie_flutter.dart';
export 'package:flutter/services.dart';
export 'package:flutter_app_registerpage/SecondScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MapScreen.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class Utility{
  static void animationLottie(BuildContext context, String name){



//    return  Scaffold(
//      appBar:  AppBar(
//        title: const Text("First screen"),
//      ),
//      body:  Center(
//        child:  Column(
//          mainAxisAlignment:  MainAxisAlignment.center,
//          children: <Widget>[
//            Lottie(
//              composition: _composition,
//              size: const Size(300.0, 300.0),
//              controller: _controller,
//            ),
//            Slider(
//              value: _controller.value,
//              onChanged: _composition != null
//                  ? (double val) => setState(() => _controller.value = val)
//                  : null,
//            ),
//            Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    child: Text("Navigate"),
//                    onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));},
//                  ),
//                  IconButton(
//                    icon: _controller.isAnimating
//                        ? const Icon(Icons.pause)
//                        : const Icon(Icons.play_arrow),
//                    onPressed: _controller.isCompleted || _composition == null
//                        ? null
//                        : () {
//                      setState(() {
//                        if (_controller.isAnimating) {
//                          _controller.stop();
//                        } else {
//                          if (_repeat) {
//                            _controller.repeat();
//                          } else {
//                            _controller.forward();
//                          }
//                        }
//                      });
//                    },
//                  ),
//                ]),
//          ],
//        ),
//      ),
//    );
  }

  static void showDialogBox(BuildContext context, String message,
      { String title = 'Alert'}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}