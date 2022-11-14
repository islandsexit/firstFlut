import 'package:flutter/material.dart';
import '../models/tab.dart';
import '../pages/pony_little_page.dart';

class TabNavigator extends StatelessWidget{

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItems tabItem;

  TabNavigator({required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings){
        Widget currentPage;
        if(tabItem == TabItems.POSTS){
          currentPage = PonyListPage();
        }else if(tabItem == TabItems.POSTS){
          currentPage = PonyListPage();
        }else{
          currentPage = PonyListPage();
        }
        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }

}