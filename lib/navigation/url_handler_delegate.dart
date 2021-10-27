import 'dart:html';

import 'package:bmec_flutter_web_demo/navigation/uri_navigation_state.dart';
import 'package:bmec_flutter_web_demo/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



final GlobalKey<NavigatorState> _urlHandlerRouterDelegateNavigatorKey =
    GlobalKey<NavigatorState>();

class UrlHandlerRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  String urlData='';


  @override
  Widget build(BuildContext context) {

    return Navigator(
      pages: [
        MaterialPage(child: MyHomePage(urlData: urlData, getValue: getValue)),
      ],
      onPopPage: (_, __) {
        return false;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      _urlHandlerRouterDelegateNavigatorKey;

  @override
  Future<void> setNewRoutePath(NavigationState navigationState) {
    if (navigationState.value == null) {
      notifyListeners();
      return null!;
    }

    urlData = navigationState.value;

    if (urlData != navigationState.value) notifyListeners();
    return null!;
  }

  @override
  NavigationState get currentConfiguration => NavigationState(urlData);

  void getValue() {
    urlData='?userkey=52525552&siteKey=9929493296';
    notifyListeners();
  }
}
