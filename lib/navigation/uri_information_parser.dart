// ignore: file_names
// ignore: file_names
import 'package:flutter/widgets.dart';

import 'uri_navigation_state.dart';

class UrlHandlerInformationParser extends RouteInformationParser<NavigationState> {
  // Url to navigation state
  @override
  Future<NavigationState> parseRouteInformation(RouteInformation routeInformation) async {
    return NavigationState(routeInformation.location!.substring(1));
  }

  // Navigation state to url
  @override
  RouteInformation restoreRouteInformation(NavigationState navigationState) {
    return RouteInformation(location: '/${navigationState.value}');
  }
}
