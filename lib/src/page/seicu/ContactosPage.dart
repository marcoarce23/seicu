import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/data/entity/EntityFromJson/ContactosModel.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/repository/Repository.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/card/CardVM.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class ContactosPage extends StatefulWidget {
  static final String routeName = 'contactos';
  ContactosPage({Key key}) : super(key: key);

  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  //DEFINICION DE BLOC Y MODEL
  ContactosList entityGet = new ContactosList();
  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();

  @override
  void initState() {
    prefs.lastPage = ContactosPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar('CONTACTOS DEL MUNICIPIO.'),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          decoration: new BoxDecoration(),
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
                      'QUIERES COMUNICARTE CON EL MUNICIPIO - ${prefs.departament.toString().toUpperCase()} ?',
                      'Te listamos las personas con las que puedes contactarte o el número donde puedes comunicarte.',
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
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'TORNO')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'SCZ')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'ALTO')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'SACABA')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'BENI')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'PANDO')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'POTOSI')
      return contactoTorno;
    if (prefs.departament.toString().toUpperCase() == 'TARIJA')
      return contactoTorno;
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
          ContactosList entity = snapshot.data[index];

          return _showListTile(entity, context);
        },
      ),
    );
  }

  Widget _showListTile(ContactosList entity, BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            CardVM(
              size: 150,
              imageAssets: 'assets/image/babycare1.jpg',
              listWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.user,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'CONTACTO: ${entity.contacto}',
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
                            'DESCRIPCIÓN: ${entity.descripcion}',
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
                          FontAwesomeIcons.mailBulk,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'CORREO: ${entity.correo}',
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
                          FontAwesomeIcons.tabletAlt,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'TELEFONO: ${entity.telefono}',
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
                          FontAwesomeIcons.bookmark,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                        sizedBox(10, 0),
                        Expanded(
                          child: AutoSizeText(
                            'DIRECCIÓN: ${entity.ubicacion}',
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
