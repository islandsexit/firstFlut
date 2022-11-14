import 'package:flutter/material.dart';
import '../models/tab.dart';

const Map<TabItems, MyTab> tabs = {
  TabItems.POSTS : MyTab(name: "Posts", color: Colors.red, icon: Icons.layers),
  TabItems.ALBUM : MyTab(name: "Albums", color: Colors.blue, icon: Icons.image),
  TabItems.TODOS : MyTab(name: "Todos", color: Colors.green, icon: Icons.edit)
};

class MyBottomNavigator extends StatelessWidget{
  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectTab;

  MyBottomNavigator({required this.currentTab, required this.onSelectTab});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      selectedItemColor: _colorTabMatching(currentTab),
      selectedFontSize: 13,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: [
        _buildItem(TabItems.POSTS),
        _buildItem(TabItems.ALBUM),
        _buildItem(TabItems.TODOS),
      ],
      onTap: (index) => onSelectTab(
        TabItems.values[index]
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItems item){
    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
        color:_colorTabMatching(item)
      ),
      label: tabs[item]?.name
    );
  }

  IconData _iconTabMatching(TabItems item) => tabs[item]!.icon;

  Color _colorTabMatching(TabItems item){
    return currentTab == item ? tabs[item]!.color :Colors.grey;
  }
}