import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  PageIndicator({this.currentIndex, this.pageCount});

  _indicator(bool isActive){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey[700],
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 2.0
              )
            ]
          ),
        ),
      ),
    );
  }

  _buildPageIndicators(){
    List<Widget> indicatorList = [];
    for(int i = 0; i < this.pageCount; i++){
        indicatorList.add(_indicator(i == this.currentIndex));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPageIndicators()
    );
  }
}
