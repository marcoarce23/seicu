import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/data/entity/EntityFromJson/TramitesModel.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/repository/Repository.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/card/CardVM.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class TipoTramitesPage extends StatefulWidget {
  static final String routeName = 'contactos';
  TipoTramitesPage({Key key}) : super(key: key);

  @override
  _TipoTramitesPageState createState() => _TipoTramitesPageState();
}

class _TipoTramitesPageState extends State<TipoTramitesPage> {
  //DEFINICION DE BLOC Y MODEL
  TiposTramitesList entityGet = new TiposTramitesList();

  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();

  @override
  void initState() {
    prefs.lastPage = TipoTramitesPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // entityService = Provider.of<NotificationService>(context);
    return Scaffold(
      appBar: appBar('TIPOS DE TRÁMITES.'),
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
                    sizedBox(0, 10),
                    showInformationBasic(
                      context,
                      'CONOCE LOS TIPOS DE TRÁMITES DEL MUNICIPIO - ${prefs.departament.toString().toUpperCase()}?',
                      'Puedes ver en detalle de lso requisitos y costo de lso tipos de trámties de Catastro.',
                    ),
                  ],
                ),
              ),
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
      return tipoTramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'TORNO')
      return tipoTramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      return tipoTramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'SCZ')
      return tipoTramiteTorno;
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
          TiposTramitesList entity = snapshot.data[index];

          return _showListTile(entity, context);
        },
      ),
    );
  }

  Widget _showListTile(TiposTramitesList entity, BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            CardVM(
              size: 130,
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
                            'DETALLE: ${entity.descripcion}',
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
                          FontAwesomeIcons.paperclip,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'DETALLE: ${entity.observacion}',
                            style: TextStyle(color: AppTheme.themeWhite),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   'FECHA: ${entity.fechacreacion.substring(0, 10)}',
                    //   style: TextStyle(color: AppTheme.themeWhite),
                    // ),
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
