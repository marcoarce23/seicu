import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/data/entity/EntityFromJson/NotificacionModel.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/repository/Repository.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/card/CardVM.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class NotificationPage extends StatefulWidget {
  static final String routeName = 'notificationPage';
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  //DEFINICION DE BLOC Y MODEL
  NotificacionList entityGet = new NotificacionList();
  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();

  @override
  void initState() {
    prefs.lastPage = NotificationPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar('NOTIFICACIONES 24/7.'),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
         
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              backgroundBasic(context),
              Container(
                width: size.width * 0.95,
                margin: EdgeInsets.symmetric(vertical: 0.0),
                // decoration: boxDecoration(),
                child: Column(
                  children: <Widget>[
                    sizedBox(0, 5),
                    showInformationBasic(
                      context,
                      'TE MANTENEMOS INFORMADO - ${prefs.departament.toString().toUpperCase()}',
                      'Las noticias más importantes y de primera mano con las notificaciones - CATASTRO 24/7.',
                    ),
                  ],
                ),
              ),
              sizedBox(0, 7),
              dividerBlack(),
              futureBuilder(context),
              copyRigthBlack(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatButton(AppTheme.themeDefault, context,
          FaIcon(FontAwesomeIcons.home, size: 35), HomePage()),
    );
  }

  _apiUrl() {
     if (prefs.departament.toString().toUpperCase() == 'LA PAZ')
      return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'TORNO') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'CBB') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'SCZ') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'ALTO') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'SACABA')
      return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'BENI') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'PANDO') return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'POTOSI')
      return notiTorno;
    if (prefs.departament.toString().toUpperCase() == 'TARIJA')
      return notiTorno;
  }

  Widget futureBuilder(BuildContext context) {
    entityGet.apiUrl = _apiUrl();

  
    return FutureBuilder(
        future: new Repository().getData(entityGet),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            default:
              return listView(context, snapshot);
          }
        });
  }

  Widget listView(BuildContext context, AsyncSnapshot snapshot) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          NotificacionList entity = snapshot.data[index];

          return _showListTile(entity, context);
        },
      ),
    );
  }

  Widget _showListTile(NotificacionList entity, BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
             CardVM(
              size: 120,
              imageAssets: 'assets/image/babycare1.jpg',
              listWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.newspaper,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'NOTICIA: ${entity.titulo}',
                            style: TextStyle(color: AppTheme.themeWhite),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    sizedBox(0, 6),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.edit,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'DETALLE: ${entity.detalle}',
                            style: TextStyle(color: AppTheme.themeWhite),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    sizedBox(0, 6),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.calendarAlt,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'FECHA: ${entity.fechacreacion.substring(0, 10)}',
                            style: TextStyle(color: AppTheme.themeWhite),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
