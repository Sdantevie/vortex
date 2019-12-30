import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:vortex/models/comic.dart';

class ComicReader extends StatefulWidget {
  final ComicReaderArgs args;
  ComicReader({Key key, @required this.args}) : super(key: key);

  @override
  _ComicReaderState createState() => _ComicReaderState();
}

class _ComicReaderState extends State<ComicReader> {
  Orientation _lastScreenOrientation;
  PDFViewController _pdfViewController;
  int _totalPages;
  int _currentPage;
  bool showNavTools;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastScreenOrientation = MediaQuery.of(context).orientation;
    });
    _totalPages = 0;
    _currentPage = 0;
    showNavTools = true;
  }

  @override
  Widget build(BuildContext context) {
    if (_lastScreenOrientation != null &&
        _lastScreenOrientation != MediaQuery.of(context).orientation) {
      // Completely render the page.
      Future.delayed(Duration(microseconds: 100), _repushViewer);
    }

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
            appBar: showNavTools
                ? AppBar(
                    title: Text(
                      widget.args.comic.title,
                      style: TextStyle(
                          color: Color(0xFFD71786), fontFamily: 'OpenSans'),
                    ),
                    backgroundColor: Color(0xFF2A2E3D),
                    actions: <Widget>[ReaderBottomSheetIcon()],
                  )
                : PreferredSize(
                    child: Container(), preferredSize: Size(0.0, 0.0)),
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // GestureDetector(
                //   child:
                PDFView(
                    filePath: widget.args.path,
                    onViewCreated: (PDFViewController vc) {
                      _pdfViewController = vc;
                    },
                    onRender: (_pages) {
                      setState(() {
                        _totalPages = _pages;
                      });
                      _pdfViewController.setPage(widget.args.currentPage);
                      print(widget.args.currentPage);
                    },
                    onPageChanged: (int currentPage, int totalPage) {
                      setState(() {
                        _currentPage = currentPage;
                      });
                    }),
                //   onTap: () {
                //     setState(() {
                //       var formerNavTools = showNavTools;
                //       showNavTools = !formerNavTools;
                //     });
                //   },
                // ),
                showNavTools
                    ? Positioned(
                        bottom: 10,
                        left: 16.0,
                        right: 16.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn1',
                              backgroundColor: Color(0xFF2A2E3D),
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                              onPressed: () {
                                _currentPage -= 1;
                                _pdfViewController.setPage(_currentPage);
                              },
                            ),
                            Text(
                              (_currentPage + 1).toString() +
                                  '/' +
                                  _totalPages.toString(),
                              style: TextStyle(
                                  fontFamily: 'OpenSans', fontSize: 16.0),
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              backgroundColor: Color(0xFF2A2E3D),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _currentPage += 1;
                                _pdfViewController.setPage(_currentPage);
                              },
                            ),
                          ],
                        ),
                      )
                    : Container()
              ],
            )));
  }

  _repushViewer() {
    widget.args.currentPage = _currentPage;
    Navigator.of(context)
        .pushReplacementNamed('/comic_reader', arguments: widget.args);
  }
}

class ReaderBottomSheetIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => _buildBottomSheet());
      },
    );
  }

  _buildBottomSheet() {
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }
}

class ComicReaderArgs {
  final String path;
  final Comic comic;
  int currentPage;

  ComicReaderArgs(
      {@required this.path, @required this.comic, this.currentPage = 0});
}
