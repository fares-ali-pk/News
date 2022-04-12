

import 'package:flutter/material.dart';

class PageModel{
  String _title;
  String _description;
  String _image;
  IconData _icon;

  PageModel(this._title, this._description, this._image, this._icon);

  set title(String value) {
    _title = value;
  }

  set icon(IconData value) {
    _icon = value;
  }

  set image(String value) {
    _image = value;
  }

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  IconData get icon => _icon;

  String get image => _image;

  String get description => _description;


}