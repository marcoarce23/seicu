import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/data/entity/EntityMap/NotificationModel.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/card/CardVM.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class ContactosTornoPage extends StatefulWidget {
  static final String routeName = 'contactos';
  ContactosTornoPage({Key key}) : super(key: key);

  @override
  _ContactosTornoPageState createState() => _ContactosTornoPageState();
}

class _ContactosTornoPageState extends State<ContactosTornoPage> {
  //DEFINICION DE BLOC Y MODEL
  NotificacionModel entity = new NotificacionModel();
  //NotificationService entityGet = NotificationService();

  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();

  @override
  void initState() {
    prefs.lastPage = ContactosTornoPage.routeName;
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
                      'QUIERES COMUNICARTE CON LOS MUNICIPIOS ?',
                      'Te listamos las personas o instancias con las que puedes contactarte o el número donde puedes comunicarte.',
                    ),
                  ],
                ),
              ),
              dividerBlack(),
              sizedBox(0.0, 5.0),
               showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                   sizedBox(0.0, 6.0),
                   showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                   sizedBox(0.0, 6.0),
                   showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                   sizedBox(0.0, 6.0),
                   showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                   sizedBox(0.0, 6.0),
                   showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                  sizedBox(0.0, 6.0),
                  
                 
                 copyRigthBlack(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatButton(AppTheme.themeDefault, context,
          FaIcon(FontAwesomeIcons.home, size: 35), HomePage()),
    );
  }

  Widget futureBuilder(BuildContext context) {
    return FutureBuilder(
        //   future: entityGet.get(new NotificacionModel()),
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
          NotificacionModel entity = snapshot.data[index];

          return _showListTile(entity, context);
        },
      ),
    );
  }

  Widget _showListTile(NotificacionModel entity, BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            sizedBox(0, 7),
            CardVM(
              size: 80,
              imageAssets: 'assets/image/babycare1.jpg',
              listWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TITULO: ${entity.titulo}',
                      style: TextStyle(color: AppTheme.themeWhite),
                    ),
                    Text(
                      'DETALLE: ${entity.detalle}',
                      style: TextStyle(color: AppTheme.themeWhite),
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
