import 'package:flutter/material.dart';

import '../../models/character.dart';


class CharacterTabSelector extends StatefulWidget{
    final Function(CharacterRole) onItemSelected;
    CharacterTabSelector({@required this.onItemSelected});

    @override
    _CharacterTabSelectorState createState() => new _CharacterTabSelectorState();
}

class _CharacterTabSelectorState extends State<CharacterTabSelector>{
    CharacterRole _currentRole = CharacterRole.GOOD_GUY;
    bool _isSelected;

    List<Widget> _buildCharacterTabs(){
        return CharacterRole.values.map((role) {
          _isSelected = _currentRole == role;
           return  Padding(
             padding: const EdgeInsets.only(right:20.0),
             child: GestureDetector(
                  onTap:(){
                      setState((){
                          _currentRole = role;
                      });
                      widget.onItemSelected(role);
                  },
                  child: Text(roleNames[role], 
                        style: TextStyle(
                          color: _isSelected ? Color(0xFFFF691F) : Colors.white, 
                          fontSize: _isSelected ? 30.0 : 22.0,
                          fontFamily: 'OpenSans'
                        ))
              )
           );
        }).toList();
    }

    @override
    Widget build(BuildContext context){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row( 
            children: _buildCharacterTabs()
            )
        );
    }
}

const Map<CharacterRole, String> roleNames = {
  CharacterRole.GOOD_GUY: 'The Good Guys',
  CharacterRole.IN_BETWEEN: 'The In-betweens',
  CharacterRole.VILLAIN: 'The Villains'
};