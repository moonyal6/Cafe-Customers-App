import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {
  final Widget page;

  FadeInRoute({required this.page, required String routeName})
      : super(
          settings: RouteSettings(name: routeName),            // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 500),
        );


  static push(BuildContext context, route, page){
    Navigator.push( // or pushReplacement, if you need that
      context,
      FadeInRoute(
        routeName: route,
        page: page,
      ),
    );
  }
}