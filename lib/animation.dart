import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() => runApp(LottieDemo());

class LottieDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

WebViewController webViewctrl;

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example'),
            actions: <Widget>[
              //MenuList(_controller.future),
            ],
          ),
          body: Builder(builder: (BuildContext context) {
            return WebView(
              initialUrl: 'http://192.168.1.116:8080/',
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
              //  _controller.complete(webViewController);
                webViewctrl = webViewController;

              },
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'Print',
                    onMessageReceived:
                        (JavascriptMessage message) {
                      _scanBarcode(context);
                      //This is where you receive message from
                      //javascript code and handle in Flutter/Dart
                      //like here, the message is just being printed
                      //in Run/LogCat window of android studio
                      print(message.message);
                    })
              ]) ,
//              <JavascriptChannel>[
//                _scanBarcode(context),
//              ].toSet(),
              onPageFinished: (String url) {
                //TODO : events after page loading finished
              },
            );
          }),
//          floatingActionButton: FloatingActionButton(
//            onPressed: () {
//              webViewctrl.evaluateJavascript('Android');
//            },
//            child: Icon(Icons.navigation),
//            backgroundColor: Colors.green,
//          )
      ),
    );
  }
}

JavascriptChannel _scanBarcode(BuildContext context) {
  return JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
        /*String result = scanBarcode(context);
        ******I got result of scanned barcode in result variable*******/
      });
}

//import 'package:flutter/material.dart';
//
////import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
//class LottieDemo extends StatefulWidget {
//  @override
//  RunJSInWebViewState createState() {
//    return new RunJSInWebViewState();
//  }
//}
//
//class RunJSInWebViewState extends State<LottieDemo> {
//  InAppWebViewController webView;
//
//  // String url = "http://192.168.1.116:8081/";
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: const Text('InAppWebView Example'),
//          ),
//          body: Container(
//            child: InAppWebView(
//              initialOptions: InAppWebViewWidgetOptions(
//                  inAppWebViewOptions: InAppWebViewOptions(
//                debuggingEnabled: true,
//                javaScriptEnabled: true,
//                cacheEnabled: true,
//                javaScriptCanOpenWindowsAutomatically: true,
//              )),
//              initialUrl: "http://192.168.1.116:8081/",
//              onWebViewCreated: (InAppWebViewController controller) {
//                webView = controller;
//              },
//              onLoadStart: (InAppWebViewController controller, String url) {
//                print("console message: ${url}");
//              },
//              onLoadStop: (InAppWebViewController controller, String url) {
//                print("console message: ${url}");
//              },
//              onConsoleMessage: (InAppWebViewController controller,
//                  ConsoleMessage consoleMessage) {
//                print("console message: ${consoleMessage.message}");
//              },
//            ),
//          )
//
////        body: Container(
////          child: InAppWebView(
////          initialUrl: "http://192.168.1.116:8081/",
////          initialHeaders: {},
////          initialOptions: InAppWebViewWidgetOptions(
////
////          ),
////          onWebViewCreated: (InAppWebViewController controller) {
////            webView = controller;
////          },
////          onLoadStart: (InAppWebViewController controller, String url) {
////            setState(() {
////              this.url = url;
////            });
////          },
////          onLoadStop: (InAppWebViewController controller, String url) async {
////            setState(() {
////              this.url = url;
////            });
////          },
////          onProgressChanged: (InAppWebViewController controller, int progress) {
////            setState(() {
////              this.progress = progress / 100;
////            });
////          },
////        ),),
//          ),
//    );
//  }
//}

//  @override
//  Widget build(BuildContext context) {
//    return WebviewScaffold(
//      url: 'http://192.168.1.116:8081/',
//      hidden: true,
//      appBar: AppBar(title: Text("Webview")),
//    );
//  }
//}






//********** Demo animation******
//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'dart:convert';
//import 'package:lottie_flutter/lottie_flutter.dart';
//import 'package:flutter/services.dart';
//
//class LottieDemo extends StatefulWidget {
//  const LottieDemo({Key key}) : super(key: key);
//
//  @override
//  _LottieDemoState createState() =>  _LottieDemoState();
//}
//
//class _LottieDemoState extends State<LottieDemo>
//    with SingleTickerProviderStateMixin {
//
//  LottieComposition _composition;
//  AnimationController _controller;
//  bool _repeat;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _repeat = true;
//    _controller =  AnimationController(
//      duration: const Duration(milliseconds: 1),
//      vsync: this,
//    );
//    loadAsset("assets/1368-happy-gift.json").then((LottieComposition composition) {
//      setState(() {
//        _composition = composition;
//        _controller.reset();
//      });
//    });
//    _controller.addListener(() => setState(() {}));
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return  Scaffold(
//      appBar:  AppBar(
//        title: const Text('Flutter Lottie Animation'),
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
//
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
////                  IconButton(
////                    icon: const Icon(Icons.stop),
////                    onPressed: _controller.isAnimating && _composition != null
////                        ? () {
////                      _controller.reset();
////                    }
////                        : null,
////                  ),
//                ]),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//Future<LottieComposition> loadAsset(String assetName) async {
//  return await rootBundle
//      .loadString(assetName)
//      .then<Map<String, dynamic>>((String data) => json.decode(data))
//      .then((Map<String, dynamic> map) =>  LottieComposition.fromMap(map));
//}
