import 'package:flutter/material.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/home/HomePage.dart';

import 'package:seicu/src/widget/general/SenWidget.dart';

class BuzonPage extends StatefulWidget {
  static final String routeName = 'buzonPage';
  BuzonPage({Key key}) : super(key: key);

  @override
  _BuzonPageState createState() => _BuzonPageState();
}

class _BuzonPageState extends State<BuzonPage> {
  //DEFINICION DE BLOC Y MODEL

  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();

  @override
  void initState() {
    prefs.lastPage = BuzonPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (prefs.departament.toString().toUpperCase() == 'LA PAZ')
      sendEmailAdvanced(
          'pmgm@torno.com',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');

    if (prefs.departament.toString().toUpperCase() == 'TORNO')
      sendEmailAdvanced(
          'pmgm@torno.com',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
    if (prefs.departament.toString().toUpperCase() == 'CBB')
      sendEmailAdvanced(
          'pmgm@cochabamba.bo',
          'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
          'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');

    return Scaffold(
      body: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
