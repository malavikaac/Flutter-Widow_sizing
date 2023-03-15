import 'package:flutter/material.dart';
import 'dart:async';

import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future _getWindowSize() async {
    var size = await DesktopWindow.getWindowSize();
    setState(() {
      _windowSize = '${size.width} x ${size.height}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('desktop_window example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_windowSize\n'),
              TextButton(
                child: Text("getWindowSize"),
                onPressed: _getWindowSize,
              ),
              TextButton(
                child: Text("setMinWindowSize(300,400)"),
                onPressed: () async {
                  await DesktopWindow.setMinWindowSize(Size(300, 400));
                },
              ),
              TextButton(
                child: Text("setMaxWindowSize(300,400)"),
                onPressed: () async {
                  await DesktopWindow.setMaxWindowSize(Size(300, 400));
                },
              ),
              Wrap(
                children: [
             TextButton(
                    child: Text("Smaller"),
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width - 50, size.height - 50));
                      await _getWindowSize();
                    },
                  ),
                  TextButton(
                    child: Text("Larger"),
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width +50, size.height + 50));
                      await _getWindowSize();
                    },
                  ),
                ],
              ),
              // Wrap(
              //   children: [
              //     TextButton(
              //       child: Text("toggleFullScreen"),
              //       onPressed: () async {
              //         await DesktopWindow.resetMaxWindowSize();
              //         await DesktopWindow.toggleFullScreen();
              //       },
              //     ),
              //     Builder(builder: (ctx) {
              //       return TextButton(
              //         child: Text("getFullScreen"),
              //         onPressed: () async {
              //           final isFullScreen =
              //               await DesktopWindow.getFullScreen();
              //           // Scaffold.of(ctx).showSnackBar(SnackBar(
              //           //     content: Text('getFullScreen = $isFullScreen'),
              //           //     duration: Duration(seconds: 1)));
              //         },
              //       );
              //     }),
                 TextButton(
                    child: Text("setFullScreen(false)"),
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(true);
                    },
                  ),
                  TextButton(
                    child: Text("setFullScreen(false)"),
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(false);
                    },
                  ),
                ],
              ),
            
          ),
        ),
      );
  }
}