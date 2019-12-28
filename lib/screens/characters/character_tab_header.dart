import 'package:flutter/material.dart';
import '../../search.dart';

class CharacterHeader extends StatelessWidget {
  final TabController tabController;

  CharacterHeader({this.tabController});

  @override
  Widget build(BuildContext context) {
    List<String> _tabs = ['Good Guys', 'In-Betweens', 'Villain'];
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            minHeight: 64.0,
            maxHeight: 64.0,
            child: Container(
              color: Color(0xFF2A2E3D),
              child: Center(
                  child: TabBar(
                      controller: this.tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.blueGrey,
                      indicatorColor: Color(0xFFD71786),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 4.0,
                      isScrollable: true,
                      tabs: _tabs
                          .map(
                            (tab) => Tab(
                              child: Text(
                                tab,
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 18.0),
                              ),
                            ),
                          )
                          .toList())),
            )));
  }
}
