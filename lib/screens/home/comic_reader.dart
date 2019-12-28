import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ComicReader extends StatefulWidget {
  final String path;
  ComicReader({Key key, @required this.path}) : super(key: key);

  @override
  _ComicReaderState createState() => _ComicReaderState();
}

class _ComicReaderState extends State<ComicReader> {
  PDFViewController _pdfViewController;
  int _totalPages = 0;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [0.0, 1.0]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color(0xFF2A2E3D),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                PDFView(
                  filePath: widget.path,
                  onViewCreated: (PDFViewController vc) {
                    _pdfViewController = vc;
                  },
                  onRender: (_pages) {
                    setState(() {
                      _totalPages = _pages;
                    });
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 16.0,
                  right: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'btn1',
                        backgroundColor: Color(0xFF2A2E3D),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFFFF691F),
                        ),
                        onPressed: () {
                          _currentPage -= 1;
                          _pdfViewController.setPage(_currentPage);
                        },
                      ),
                      FloatingActionButton(
                        heroTag: 'btn2',
                        backgroundColor: Color(0xFF2A2E3D),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFF691F),
                        ),
                        onPressed: () {
                          _currentPage += 1;
                          _pdfViewController.setPage(_currentPage);
                        },
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
