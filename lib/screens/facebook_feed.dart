import 'package:flutter/material.dart';
import 'package:news_application/shared_ui/navigation_drawer.dart';


class FaceBookFeed extends StatefulWidget {
  @override
  _FaceBookFeedState createState() => _FaceBookFeedState();
}

class _FaceBookFeedState extends State<FaceBookFeed> {

  List<int> _ids = [];

  @override
  void initState() {
    super.initState();
    _ids = [1,3,4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FaceBook Feeds"),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                _cardHeader(index),
                _cardBody(),
                _cardTail(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/hs01.jpg'),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Christina Meyers",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Fri, 12 May 2020 . 14:30",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if(_ids.contains(index)){
                    _ids.remove(index);
                  }else{
                    _ids.add(index);
                    _ids.sort();
                  }
                });
              },
              icon: Icon(Icons.favorite),
              color: ( _ids.contains(index))? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-12.0, 0),
              child: Text(
                "25",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only( right: 16.0 , left: 16.0),
          child: Text(
            "We also talk about the future of work as the robots",
            style: TextStyle(
              fontSize: 16,
              height: 1.25,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Container(
          child: Wrap(
            children: [
              _drawTextButton("#advance",(){}),
              _drawTextButton("#life",(){}),
              _drawTextButton("#sport",(){}),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: ExactAssetImage('assets/images/hs01.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _cardTail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "10",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            _drawTextButton("comments",(){}),
          ],
        ),
        Row(
          children: [
            _drawTextButton("SHARE",(){}),
            _drawTextButton("OPEN" , (){}),
          ],
        ),
      ],
    );
  }

  Widget _drawTextButton(String text , Function click) {
    return TextButton(
      onPressed: click(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
    );
  }
}