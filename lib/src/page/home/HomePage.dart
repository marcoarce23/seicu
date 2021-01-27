import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/faq/FaqPage.dart';
import 'package:seicu/src/page/general/ViewPage.dart';
import 'package:seicu/src/page/notification/NotificationPage.dart';
import 'package:seicu/src/page/seicu/BuscadorTramitePage.dart';
import 'package:seicu/src/page/seicu/BuzonPage.dart';
import 'package:seicu/src/page/seicu/ContactosPage.dart';
import 'package:seicu/src/page/seicu/TipoTramitesPage.dart';
import 'package:seicu/src/style/Style.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/drawer/FloatMenuWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = new Preferense();
  String _opcion = 'TORNO';
  List<String> _depto = [
    'TORNO',
    'Trinidad',
    'PANDO',
    'SACABA',
    'TARIJA',
    'ORURO',
    'Cochabamba',
    'POTOSI'
  ];

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
              child: Column(
                children: <Widget>[
                  sizedBox(0.0, 5),
                  showInformationBasic(
                    context,
                    'Bienvenido al Sistema.',
                    'Con SEICU revolucionaremos el catrastro.!!!',
                  ),
                  _municipio(),
                  _botonesRedondeados(),
                  copyRigthBlack(),
                  //   LineChart(),
                ],
              ),
            ),
          )
        ],
      ),
      //    bottomNavigationBar: BottonNavigation(),
      floatingActionButton: boomMenu(context),
    );
  }

  Widget _municipio() {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Seleccione el Municipio :', style: kSigsTitleStyle),
        SizedBox(width: 15.0),
        DropdownButton(
          value: _opcion,
          icon: FaIcon(FontAwesomeIcons.sort, color: AppTheme.themeDefault),
          items: _count(),
          onChanged: (opt) {
            setState(() {
              _opcion = opt;
              prefs.departament = opt;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _count() {
    List<DropdownMenuItem<String>> lista = new List();

    _depto.forEach((dpto) {
      lista.add(DropdownMenuItem(
        child: Text(dpto, style: kSigsTitleStyle),
        value: dpto,
      ));
    });
    return lista;
  }

  Widget _botonesRedondeados() {
    return Table(children: [
      TableRow(children: [
        _crearBotonRedondeado(
            Colors.blue,
            FaIcon(
              FontAwesomeIcons.houseUser,
              color: Colors.white,
              size: 40,
            ),
            'Trámites',
            BuscadorTramitesPage()),
        _crearBotonRedondeado(
            Colors.purpleAccent,
            FaIcon(
              FontAwesomeIcons.addressBook,
              color: Colors.white,
              size: 40,
            ),
            'Notificaciones',
            NotificationPage()),
      ]),
      TableRow(children: [
        _crearBotonRedondeado(
            Colors.blueGrey,
            FaIcon(
              FontAwesomeIcons.tasks,
              color: Colors.white,
              size: 40,
            ),
            'Tipo de Trámites',
            TipoTramitesPage()),
        _crearBotonRedondeado(
            Colors.green,
            FaIcon(
              FontAwesomeIcons.search,
              color: Colors.white,
              size: 40,
            ),
            'Contactenos',
            ContactosPage()
            //_contactos(context, _opcion)
            ),
      ]),
      TableRow(children: [
        _crearBotonRedondeado(
          Colors.blueAccent,
          FaIcon(
            FontAwesomeIcons.envelopeOpenText,
            color: Colors.white,
            size: 40,
          ),
          'Buzón de sugerencias',
          BuzonPage(),
        ),
        _crearBotonRedondeado(
            Colors.green,
            FaIcon(
              FontAwesomeIcons.infoCircle,
              color: Colors.white,
              size: 40,
            ),
            'Preguntas Frecuentes',
            FaqPage()),
      ]),
      TableRow(children: [
        _crearBotonRedondeado(
            Colors.pinkAccent,
            FaIcon(
              FontAwesomeIcons.mapPin,
              color: Colors.white,
              size: 40,
            ),
            'Uso de Suelos',
            ViewPage(
                title: 'MAPA DE USO DE SUELOS'.toString(),
                url:
                    'https://geovisorec.000webhostapp.com/usosuelo/index.html')),
        _crearBotonRedondeado(
            Colors.orange,
            FaIcon(
              FontAwesomeIcons.mapMarkedAlt,
              color: Colors.white,
              size: 40,
            ),
            'Edad de la construcción',
            ViewPage(
                title: 'MAPA DE EDAD DE LA CONSTRUCCIÓN'.toString(),
                url:
                    'https://geovisorec.000webhostapp.com/edadconstruccion/index.html')),
      ]),
    ]);
  }

  Widget _crearBotonRedondeado(
      Color color, FaIcon icono, String texto, Widget widget) {
    return InkWell(
      onTap: () {
        navegation(context, widget);
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 100.0,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white, //Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(10.0),

              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 1.0,
                    offset: Offset(1.0, 2.0),
                    spreadRadius: 1.5)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: icono,
                ),
                Text(texto, style: TextStyle(color: color)),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
