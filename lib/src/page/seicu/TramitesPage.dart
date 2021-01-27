import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/data/entity/EntityFromJson/TramitesModel.dart';
import 'package:seicu/src/page/seicu/BuscadorTramitePage.dart';
import 'package:seicu/src/repository/Repository.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/card/CardVM.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class TramitesPage extends StatefulWidget {
  static final String routeName = 'notificationPage';
  final String idHR;

  const TramitesPage({Key key, @required this.idHR}) : super(key: key);

  @override
  _TramitesPageState createState() => _TramitesPageState();
}

class _TramitesPageState extends State<TramitesPage> {
  TramitesList entityGet = new TramitesList();
  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();
  final controllerHR = TextEditingController();

  @override
  void initState() {
    // prefs.lastPage = TramitesList.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar('OFICINA VIRTUAL.'),
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
                    sizedBox(0, 7),
                    showInformationBasic(
                      context,
                      'ESTADO DE TU TRÁMITE - MUNICIPIO ${prefs.departament.toString().toUpperCase()}',
                      'Ingresa tu hoja de Ruta y sabras sobre el estado de tu trámite.',
                    ),
                  ],
                ),
              ),
              sizedBox(0, 7),
              dividerBlack(),
              futureBuilder(
                context,
              ),
              copyRigthBlack(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatButton(AppTheme.themeDefault, context,
          FaIcon(FontAwesomeIcons.arrowLeft, size: 35), BuscadorTramitesPage()),
    );
  }

  _apiUrl() {
    print('APLI URL: ${prefs.departament.toString().toUpperCase()}');
    if (prefs.departament.toString().toUpperCase() == 'LA PAZ')
      return tramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'TORNO')
      return tramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      return tramiteTorno;
    if (prefs.departament.toString().toUpperCase() == 'SCZ')
      return tramiteTorno;
  }

  Widget futureBuilder(BuildContext context) {
    print('URL APIXXXX: ${widget.idHR}');

    entityGet.apiUrl = _apiUrl() + widget.idHR;

    print('URL API: ${entityGet.apiUrl}');
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
          TramitesList entity = snapshot.data[index];

          return _showListTile(entity, context);
        },
      ),
    );
  }

  Widget _showListTile(TramitesList entity, BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            CardVM(
              size: 180,
              imageAssets:'assets/image/babycare1.jpg',
              listWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    showInformationBasicSin(
                      context,
                      'INFORMACIÓN GENERAL',
                      'NUR - HOJA DE RUTA: ${entity.nur}',
                    ),
                    sizedBox(0, 10),
                    Text(
                      'REFERENCIA: ${entity.referencia}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'NOMBRE DESTINATARIO: ${entity.nombreDestinatario}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'CARGO DESTINATARIO: ${entity.cargoDestinatario}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'ESTADO: ${entity.estado}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'DIAS: ${entity.dias} del trámite',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                  ],
                ),
              ],
            ),
            CardVM(
              size: 300,
              imageAssets: 'assets/image/babycare1.jpg',
              listWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    showInformationBasicSin(
                      context,
                      'INFORMACIÓN DETALLADA',
                      'Verifica tu estado del trámite',
                    ),
                    sizedBox(0, 10),
                    Text(
                      'NOMBRE EMISOR: ${entity.nombreEmisor}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'CARGO EMISOR: ${entity.cargoEmisor}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'FECHA EMISION: ${entity.fechaEmision}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    sizedBox(0, 15),
                    Text(
                      'NOMBRE RECEPTOR: ${entity.nombreReceptor}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'CARGO RECEPTOR: ${entity.cargoReceptor}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'FECHA RECEPCIÓN: ${entity.fechaRecepcion}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    sizedBox(0, 15),
                    Text(
                      'PROVEIDO: ${entity.proveido}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'REFERENCIA: ${entity.referencia}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'DE LA OFICINA: ${entity.deOficina}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'A LA OFICINA: ${entity.aOficina}',
                      style: TextStyle(color: AppTheme.themeWhite),
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
