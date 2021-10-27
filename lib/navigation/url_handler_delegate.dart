import 'dart:html';

import 'package:bmec_flutter_web_demo/navigation/uri_navigation_state.dart';
import 'package:bmec_flutter_web_demo/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> _urlHandlerRouterDelegateNavigatorKey = GlobalKey<NavigatorState>();

class UrlHandlerRouterDelegate extends RouterDelegate<NavigationState> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  String urlData = '';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: MyHomePage(urlData: urlData, getValue: getValue)),
      ],
      onPopPage: (_, __) {
        // We don't handle routing logic here, so we just return false

        return false;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _urlHandlerRouterDelegateNavigatorKey;

  @override
  Future<void> setNewRoutePath(NavigationState navigationState) {
    // If a value which is not a number has been entered,
    // navigationState.value is null so we just notifyListeners
    // without changing the app state to change the value of the url
    // to its previous value
    if (navigationState.value == null) {
      notifyListeners();
      return null!;
    }

    urlData = navigationState.value;

    if (urlData != navigationState.value) notifyListeners();
    return null!;
  }

  // App state to Navigation state, triggered by notifyListeners()

  @override
  NavigationState get currentConfiguration => NavigationState(urlData);

  void getValue() {
    /// set the key value
    urlData = '?userkey=52525552&siteKey=9929493296';
    notifyListeners();
  }
}
