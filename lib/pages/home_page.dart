import 'package:flutter/material.dart';
import '../models/tab.dart';
import '../models/tab_navigator.dart';
import '../pages/bottom_navigation.dart';
class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  final _navigatorKeys = {
    TabItems.POSTS: GlobalKey<NavigatorState>(),
    TabItems.ALBUM: GlobalKey<NavigatorState>(),
    TabItems.TODOS: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItems.POSTS;
  void _selectTab(TabItems tabItem){
    setState(() => _currentTab = tabItem);
  }

  Widget build(BuildContext context){

    return WillPopScope(
        onWillPop:() async{
          if(_currentTab!=TabItems.POSTS){
            if(_currentTab!=TabItems.TODOS){
              _selectTab(TabItems.ALBUM);
            }else{
              _selectTab(TabItems.POSTS);
            }
            return false;
          }else{
            return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children:<Widget>[
              _buildOffStageNavigator(TabItems.POSTS),
              _buildOffStageNavigator(TabItems.ALBUM),
              _buildOffStageNavigator(TabItems.TODOS),
            ]),
          bottomNavigationBar: MyBottomNavigator(
            currentTab: _currentTab,
            onSelectTab:_selectTab,
          ),
        ),
    );
  }

  Widget _buildOffStageNavigator(TabItems tabItem){
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem
      )
    );
  }
}