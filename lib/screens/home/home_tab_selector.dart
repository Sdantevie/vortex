import 'package:flutter/material.dart';


class HomeTabSelector extends StatefulWidget{
    final List<String> tabs;
    final Function(int) onItemSelected;
    HomeTabSelector({@required this.tabs, @required this.onItemSelected});

    @override
    _HomeTabSelectorState createState() => new _HomeTabSelectorState();
}

class _HomeTabSelectorState extends State<HomeTabSelector>{
    int _currentIndex = 0;
    bool _isSelected;

    List<Widget> _buildHomeTabs(){
        return widget.tabs.map((tab) {
            var index = widget.tabs.indexOf(tab);
            _isSelected = _currentIndex == index;
            return  Padding(
             padding: const EdgeInsets.only(right:20.0),
             child: GestureDetector(
                  onTap:(){
                      setState((){
                          _currentIndex = index;
                      });
                      widget.onItemSelected(index);
                  },
                  child: Text(tab, 
                        style: TextStyle(
                          color: _isSelected ? Color(0xFFFF691F) : Colors.white, 
                          fontSize: _isSelected ? 30.0 : 22.0,
                          fontFamily: 'OpenSans'
                        ))
              ),
           );
        }).toList();
    }

    @override
    Widget build(BuildContext context){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row( 
            children: _buildHomeTabs()
            )
        );
    }
}