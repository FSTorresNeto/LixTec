import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const primaryColor = Color(0xFF323751);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LixTec',
      theme: ThemeData(
        brightness: Brightness.dark,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => Home(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _initialUrl = 'link aqui';
  InAppWebViewController? _webViewController;
  String? _downloadTaskId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(_initialUrl)),
            onWebViewCreated: (controller) async {
              _webViewController = controller;
            },
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useOnDownloadStart: true,
                supportZoom: false,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final canGoBack = await _webViewController?.canGoBack() ?? false;
    if (canGoBack) {
      await _webViewController?.goBack();
      return false;
    }
    final willPop = await showDialog(
      context: context,
      builder: (context) {
        final buttonStyle = Theme.of(context).textTheme.button?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : primaryColor,
            );
        return AlertDialog(
          title: Text('Sair do app'),
          content: Text('Deseja mesmo sair do app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('NÃO', style: buttonStyle),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('SIM', style: buttonStyle),
            )
          ],
        );
      },
    );
    return willPop ?? false;
  }
}
