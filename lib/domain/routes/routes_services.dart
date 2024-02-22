import 'package:flash/domain/extensions/string_extensions.dart';
import 'package:flash/presentation/screens/default_screen.dart';
import 'package:flutter/material.dart';

const String defaultScreen = '';

class RouteService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routingData = settings.name!.getRoutingData;
    switch (routingData.route) {
      case defaultScreen:
        return _getPageRoute(const DefaultScreen(), settings);
      default:
        return _getPageRoute(const DefaultScreen(), settings);
    }
  }

  static PageRoute _getPageRoute(Widget child, RouteSettings settings) {
    return _FadeRoute(child: child, routeName: settings.name!);
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          transitionDuration: const Duration(milliseconds: 0),
          settings: RouteSettings(name: routeName),
          reverseTransitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            // opacity: animation,
            child: child,
          ),
        );
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String>? queryParams}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateRemoveUntil(String routeName,
      {Map<String, String>? queryParams}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }

    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
