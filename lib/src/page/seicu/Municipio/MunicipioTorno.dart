import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/general/ViewPage.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/style/Style.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/CallWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/general/SenWidget.dart';
import 'package:shimmer/shimmer.dart';

class MunicipioTornoPage extends StatefulWidget {
  MunicipioTornoPage({Key key}) : super(key: key);

  @override
  _MunicipioTornoPageState createState() => _MunicipioTornoPageState();
}

class _MunicipioTornoPageState extends State<MunicipioTornoPage> {
  final estiloTitulo = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: AppTheme.themeWhite);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: AppTheme.themeWhite);
  final prefs = new Preferense();

  @override
  Widget build(BuildContext context) {

   return Scaffold(
        appBar: appBar('MUNICIPIO DE COCHABAMBA'),
        drawer: DrawerMenu(),
        floatingActionButton: floatButton(AppTheme.themeDefault, context,
            FaIcon(FontAwesomeIcons.home, size: 35), HomePage()),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _crearImagen(context),
                sizedBox(0, 10),
                _crearTitulo(),
                sizedBox(0, 7),
                _crearAcciones(context),
                dividerBlack(),
                _crearTexto(),
                sizedBox(0, 10),
                _crearTexto1(),
                sizedBox(0, 10),
                _crearTexto2(),
                // sizedBox(0, 10),
                // _crearTexto3(),
                // sizedBox(0, 10),
                // _crearTexto4(),
                copyRigthBlack()
              ],
            ),
          ),
        ));
  }

  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'scroll'),
        child: Image.network(
          IMAGE_SCREEN3,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: AppTheme.themeDefault,
                    highlightColor: Colors.yellow,
                    child: Text(
                        'ACERCA DEL MUNICIPIO ${prefs.departament.toString().toUpperCase()}',
                        style: estiloTitulo,
                        textAlign: TextAlign.center),
                  ),

                  // Text('Terrasur, haciendo tus sueños realidad',
                  //     style: estiloTitulo),
                  sizedBox(0, 7.0),
                  //Text('Fecha: XXXXX', style: estiloSubTitulo ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _crearAcciones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () => navegation(
                context,
                ViewPage(
                    title: 'SEICU DIGITAL'.toString(), url: facebookTorno)),
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        sizedBox(10, 0),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.red,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () => navegation(
                context,
                ViewPage(
                    title: 'INSTAGRAM DEL MUNICIPIO'.toString(),
                    url: instagram)),
            child: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        sizedBox(10, 0),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.green,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              callWhatsAppText(whatsApp,
                  '*Sistema SEICU:* \n Mensaje. Me gustaría ponerme en contacto. Gracias. \nEnviado desde la aplicación \n*SEICU DIGITAL*.');
            },
            child: Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        sizedBox(10, 0),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.grey,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              sendEmailAdvanced(
                  email,
                  "SEICU DIGITAL. Deseo comunicarme con usted.",
                  "Al Municipio del SEICU:\n Deseo más información sobre mi catastro.\n Saludos cordiales. Gracias");
            },
            child: Icon(
              FontAwesomeIcons.solidEnvelope,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          '■  El Programa de Mejora de la Gestión Municipal (PMGM) es una iniciativa del Estado Plurinacional, para contribuir a mejorar la Gestión Catastral urbana en los municipios beneficiarios de El Alto, Cochabamba, Santa Cruz de la Sierra, Sucre, Oruro.',
          style: kSubtitleStyle,
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _crearTexto1() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          '■  ¡Viacha, trabajamos por tu desarrollo!. Hoy estamos en la zona de Palermo y 1ro de Mayo del Distrito 7 de la ciudad de Viacha realizando el Levantamiento Catastral con información actualizada y confiable para una mejor planificación urbana y territorial.',
          style: kSubtitleStyle,
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _crearTexto2() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          '■  Fortaleciendo las capacidades del Gobierno Autónomo Municipal de El Torno, se realizaron pruebas funcionales del Sistema de Gestión Catastral con los técnicos de la Dirección de Catastro en sus respectivas estaciones de trabajo.',
          style: kSubtitleStyle,
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
