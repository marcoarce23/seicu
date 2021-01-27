import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class FaqPage extends StatefulWidget {
  FaqPage({Key key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('SEICU DIGITAL'),
      drawer: DrawerMenu(),
      body: Stack(
        children: <Widget>[
          _form(context),
        ],
      ),
      floatingActionButton: floatButton(AppTheme.themeDefault, context,
          FaIcon(FontAwesomeIcons.home, size: 35), HomePage()),
      // floatingActionButton: boomMenu(context),
    );
  }

  Widget _form(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          sizedBox(0.0, 5.0),
          Container(
            width: size.width * 0.96,
            margin: EdgeInsets.symmetric(vertical: 0.0),
            decoration: containerImage(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[],
            ),
          ),
          Container(
            width: size.width * 0.96,
            margin: EdgeInsets.symmetric(vertical: 0.0),
            child: _fields(context),
          ),
          copyRigthBlack(),
        ],
      ),
    );
  }

  Widget _fields(BuildContext context) {
    return Column(
      children: <Widget>[
        sizedBox(0.0, 0.0),
        listAcordion(),
        listAcordion2(),
        listAcordion3(),
        listAcordion4(),
      ],
    );
  }

  Widget listAcordion() {
    return accordion(
        '¿Cómo conocer sobre tu propiedad?',
        'Puedes visitar las oficinas del Municipio, pero te recomendamos previamente consultar la información desde nuestra aplicación móvil donde encontrarás información de lso contactos, las RRSS del MUnicipio, envio de correo, Seguimiento en línea de tu trámite, buzón de sugerencias y muchos más. En caso de no ser útil la información podrás visitarnos en nuestras oficinas.',
        AppTheme.themeDefault,
        AppTheme.themeDefault);
  }

  Widget listAcordion2() {
    return accordion(
        '¿Cómo contactarte con el Municipio?',
        'Desde la aplicación móvil se cuenta con varias opciones para comunicarse por RRSS, correos electrónicos y otras direcciones importantes para poder revibir una atención directa.',
        AppTheme.themeDefault,
        AppTheme.themeDefault);
  }

  Widget listAcordion3() {
    return accordion(
        '¿Que hacer para conocer tu trámite en el Municipio?',
        'Desde la aplicación móvil se cuenta con varias opciones para comunicarse por RRSS, correos electrónicos y otras direcciones importantes para poder revibir una atención directa.',
        AppTheme.themeDefault,
        AppTheme.themeDefault);
  }

  Widget listAcordion4() {
    return accordion(
        'Qué requisitos se requieren para realizar un trámite de catastro?',
        'La información de los trámites y requisitos que se requeiren para poder realizar un procesos o trámties de Catastro te acosnejamos ingresar a la opción TIPOS DE TRÁMITES en la aplicación móvil.',
        AppTheme.themeDefault,
        AppTheme.themeDefault);
  }
}
