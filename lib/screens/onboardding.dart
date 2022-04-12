import 'package:flutter/material.dart';
import 'package:news_application/screens/pages/log_in.dart';
//import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_application/models/pagemodel.dart';

class OnBoardding extends StatefulWidget {
  @override
  _OnBoarddingState createState() => _OnBoarddingState();
}

class _OnBoarddingState extends State<OnBoardding> {
  late List<Widget> _widgets;
  late List<PageModel> pages;
  int _currentIndex = 0;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = [];

    pages.add(
      PageModel(
        'Welcome',
        '1- Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/ob01.jpg',
        Icons.all_inclusive,
      ),
    );

    pages.add(
      PageModel(
        'In',
        '2- Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/ob02.jpg',
        Icons.chat_bubble_outline,
      ),
    );

    pages.add(
      PageModel(
        'My',
        '3- Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/ob03.jpg',
        Icons.airplay,
      ),
    );

    pages.add(
      PageModel(
        'App News',
        '4- Making friends is easy as waving your hand back and forth in easy step',
        'assets/images/ob04.jpg',
        Icons.voice_chat,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _addPages();


    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -100),
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.white,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pages[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 40,
                                top: 16,
                              ),
                              child: Text(
                                pages[index].description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _pageViewNotifier.value = index;
              });
            },
          ),
          Transform.translate(
            offset: Offset(0, 124),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _drawPageIndicator(_currentIndex),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          _updateSeen();
                          return LogIn();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _drawPageIndicator(int index) {
    _widgets = [];

    for (int i = 0; i < pages.length; i++) {
      if (index == i) {
        _widgets.add(_drawCircle(Colors.red, 12));
      } else
        _widgets.add(_drawCircle(Colors.grey, 8));
    }
    return _widgets;
  }

  Widget _drawCircle(Color color, double width) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }


  /*
  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.pink,
        ),
      ),
    );
  }
*/

  Future<void> _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
