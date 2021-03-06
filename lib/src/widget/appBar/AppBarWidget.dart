import 'package:flutter/material.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/style/Style.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: AppTheme.themeDefault,
    //toolbarOpacity: 0.7,
    iconTheme: IconThemeData(color: AppTheme.themeWhite, size: 16),
    elevation: 2.0,
    title: Text(title, style: kTitleAppBar),
    actions: <Widget>[
      avatarCircle(IMAGE_DEFAULT, 35.0),
      //  FaIcon(
      //     FontAwesomeIcons.edit,
      //     color: AppTheme.themePurple,
      //     size: 23,
      //   ),
    ],
  );
}
