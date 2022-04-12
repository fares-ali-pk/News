import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> _colorsList = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.blue,
    Colors.pink,
  ];

  Random random = Random();

  Color _getRandomColor() {
    return _colorsList[random.nextInt(_colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                _autherRow(),
                _newItemRow(),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _autherRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.0),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/hs01.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Michael Adams',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "15 min .",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Life Style",
                        style: TextStyle(color: _getRandomColor()),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newItemRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right:16),
          width: 124,
          height: 124,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/hs01.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Tech Tent: Old phones and safe social",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.25,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
