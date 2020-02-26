//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'dart:convert';
//import 'package:lottie_flutter/lottie_flutter.dart';
//import 'package:flutter/services.dart';

import 'package:flutter_app_registerpage/Utility.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _LottieDemoState createState() =>  _LottieDemoState();
}

class _LottieDemoState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {

  LottieComposition _composition;
  AnimationController _controller;
  bool _repeat;

  @override
  void initState() {
    super.initState();

    _repeat = true;
    _controller =  AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    );
    loadAsset("assets/1368-happy-gift.json").then((LottieComposition composition) {
      setState(() {
        _composition = composition;
        _controller.reset();
      });
    });
    _controller.addListener(() => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text("First screen"),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Lottie(
              composition: _composition,
              size: const Size(300.0, 300.0),
              controller: _controller,
            ),
            Slider(
              value: _controller.value,
              onChanged: _composition != null
                  ? (double val) => setState(() => _controller.value = val)
                  : null,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Navigate"),
                    onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));},
                  ),
                  IconButton(
                    icon: _controller.isAnimating
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: _controller.isCompleted || _composition == null
                        ? null
                        : () {
                      setState(() {
                        if (_controller.isAnimating) {
                          _controller.stop();
                        } else {
                          if (_repeat) {
                            _controller.repeat();
                          } else {
                            _controller.forward();
                          }
                        }
                      });
                    },
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

Future<LottieComposition> loadAsset(String assetName) async {
  return await rootBundle
      .loadString(assetName)
      .then<Map<String, dynamic>>((String data) => json.decode(data))
      .then((Map<String, dynamic> map) =>  LottieComposition.fromMap(map));
}