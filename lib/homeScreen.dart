import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_registerpage/MapScreen.dart';
import 'dart:async';
import 'package:flutter_app_registerpage/WebViewMain.dart';
import 'package:flutter_app_registerpage/animation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app_registerpage/FirstScreen.dart';

class HomeScreen extends StatelessWidget {
  // WebViewController _controller;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController _myController;
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: new Container(
          margin: const EdgeInsets.all(0.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Align(
                //  alignment: Alignment.bottomCenter,
                child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstScreen()));
                      },
                      child: new Text(
                        "Navigation",
                      ),
                    ),
                    new OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LottieDemo()));
                      },
                      child: new Text(
                        "Webview",
                      ),
                    ),
                    new OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LottieDemo()));
                      },
                      child: new Text(
                        "Animation",
                      ),
                    ),
//                    new RaisedButton(
//                      color: Colors.white,
//                      onPressed: () {
//                        Navigator.of(context).push(MaterialPageRoute(
//                          builder: (BuildContext context) => InAppWebView(
//                            initialOptions: InAppWebViewWidgetOptions(
//                                inAppWebViewOptions: InAppWebViewOptions(
//                              debuggingEnabled: true,
//                              javaScriptEnabled: true,
//                              cacheEnabled: true,
//                              javaScriptCanOpenWindowsAutomatically: true,
//                            )),
//                            initialUrl: "http://192.168.1.116:8081/",
//                            onWebViewCreated:
//                                (InAppWebViewController controller) {
//                              webView = controller;
//                            },
//                            onLoadStart: (InAppWebViewController controller,
//                                String url) {
//                              print("message: ${url}");
//                            },
//                            onLoadStop: (InAppWebViewController controller,
//                                String url) {
//                              print("message: ${url}");
//                            },
//                            onConsoleMessage:
//                                (InAppWebViewController controller,
//                                    ConsoleMessage consoleMessage) {
//                              print(
//                                  "console message: ${consoleMessage.message}");
//                            },
//                          ),
//                        ));
//                      },
//                      child: new Text(
//                        "In app Webpage",
//                      ),
//                    ),
                    new RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => WebView(
                            debuggingEnabled: true,
                            initialUrl: "http://192.168.1.116:8080/",
                            javascriptMode: JavascriptMode.unrestricted,
                            javascriptChannels: Set.from([
                              JavascriptChannel(
                                  name: 'Print',
                                  onMessageReceived:
                                      (JavascriptMessage message) {
                                    //This is where you receive message from
                                    //javascript code and handle in Flutter/Dart
                                    //like here, the message is just being printed
                                    //in Run/LogCat window of android studio
                                    print(message.message);
                                  })
                            ]),
//                                  onWebViewCreated:
//                                      (WebViewController webViewController) {
//                                    _controller.complete(webViewController);
//                                  },
                            onWebViewCreated: (controller) {
                              _myController = controller;
                            },
                            navigationDelegate: (NavigationRequest request) {
                              print('allowing navigation to $request');
                              return NavigationDecision.navigate;
                            },
                            onPageStarted: (String url) {
                              print('Page started loading: $url');
                            },
//                            onPageFinished: (String url) {
//                              _myController.evaluateJavascript(
//                                  "Print.postMessage('Hello')");
//
//                              //  _myController.evaluateJavascript("document.getElementsByClassName('footer-container')[0].style.display='none';");
//
//                              print('Page finished loading: $url');
//                            },
                            gestureNavigationEnabled: true,
                          ),
//                builder: (BuildContext context) => MyWebView(
//                  title: "Webview",
//                  selectedUrl: "http://ec2-13-233-132-138.ap-south-1.compute.amazonaws.com:8080/",
//                )
                        ));
                      },
                      child: new Text(
                        "Open Webpage",
                      ),
                    ),
                    new OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()));
                      },
                      child: new Text(
                        "Open Map",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
//        child: FlatButton(
//          child: Text("Open Webpage"),
//          onPressed: () {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (BuildContext context) => WebView(
//                      debuggingEnabled: true,
//                      initialUrl: "http://192.168.1.109:8080/",
//                      javascriptMode: JavascriptMode.unrestricted,
//                      onWebViewCreated: (WebViewController webViewController) {
//                        _controller.complete(webViewController);
//                      },
//                      navigationDelegate: (NavigationRequest request) {
////                  if (request.url.startsWith('https://www.youtube.com/')) {
////                    print('blocking navigation to $request}');
////                    return NavigationDecision.prevent;
////                  }
//                        print('allowing navigation to $request');
//                        return NavigationDecision.navigate;
//                      },
////                onPageStarted: (String url) {
////                  print('Page started loading: $url');
////                },
////                onPageFinished: (String url) {
////                  print('Page finished loading: $url');
////                },
//                      gestureNavigationEnabled: true,
//                    )
//
////                builder: (BuildContext context) => MyWebView(
////                  title: "Webview",
////                  selectedUrl: "http://ec2-13-233-132-138.ap-south-1.compute.amazonaws.com:8080/",
////                )
//                ));
//          },
//        ),
      ),
    );
  }
}
