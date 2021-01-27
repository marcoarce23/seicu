import 'dart:ui';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/style/Style.dart';
import 'package:seicu/src/widget/drawer/FloatMenuWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:flutter/material.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';

class MenuPage extends StatefulWidget {
  static final String routeName = 'menu';
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // RolList entity = new RolList();

  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    prefs.lastPage = MenuPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: appBar('SEICU DIGITAL'),
      drawer: DrawerMenu(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              color: Color.fromRGBO(242, 242, 242, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  sizedBox(30.0, 10),
                  Text('MENU DEL SISTEMA',
                      style: kTitleStyleBlack, textAlign: TextAlign.left),
                  sizedBox(0.0, 3),
                  copyRigthBlack(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: boomMenu(context),
    );
  }

  // Widget _futureBuilder(BuildContext context) {
  //   print('link: ${entity.apiUrl}');
  //   return FutureBuilder(
  //       future: repo.getData(entity),
  //       builder: (context, AsyncSnapshot snapshot) {
  //         switch (snapshot.connectionState) {
  //           case ConnectionState.waiting:
  //             return loading();
  //             break;
  //           default:
  //             return listView(context, snapshot);
  //         }
  //       });
  // }

  // Widget listView(BuildContext context, AsyncSnapshot snapshot) {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     scrollDirection: Axis.vertical,
  //     physics: ClampingScrollPhysics(),
  //     itemCount: snapshot.data.length,
  //     itemBuilder: (context, index) {
  //       MenuList entity = snapshot.data[index];

  //       return _showListTile(entity, context);
  //     },
  //   );
  // }

  // Widget _showListTile(MenuList entity, BuildContext context) {
  //   print('EEEE: ${entity.idMenu}');
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         sizedBox(0, 7.0),
  //         showInformationMenu(
  //           context,
  //           entity.idMenu,
  //           entity.nombreMenu,
  //         ),
  //       ],
  //     ),
  //   );
  //   //Text(entity.nombreEquipo);
  // }
}
