import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'navigation/url_handler_delegate.dart';
import 'navigation/uri_information_parser.dart';

void main() {
  runApp(const UrlHandler());
}


class UrlHandler extends StatelessWidget {
  const UrlHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: UrlHandlerRouterDelegate(),
      routeInformationParser: UrlHandlerInformationParser(),
    );
  }
}

