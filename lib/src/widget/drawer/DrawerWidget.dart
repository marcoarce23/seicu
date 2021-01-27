import 'package:seicu/src/page/general/ViewPage.dart';
import 'package:seicu/src/page/login/LogOnPage.dart';
import 'package:seicu/src/page/seicu/Municipio/MunicipioCbba.dart';
import 'package:seicu/src/page/seicu/Municipio/MunicipioTorno.dart';
import 'package:seicu/src/widget/general/SenWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/page/faq/FaqPage.dart';
import 'package:seicu/src/page/intro/IntroPage.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/general/SharedWidget.dart';

class CustomListTile extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: AppTheme.themeWhite,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  icon,
                  Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ]),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final prefs = new Preferense();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: boxDecorationMenu(context, IMAGE_DEFAULT),
          child: Container(
              child: Column(
            children: <Widget>[
              Material(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: avatarCircle(IMAGE_LOGO, 58),
                  )),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Bienvenido !!!',
                        style: TextStyle(
                            color: AppTheme.themeWhite, fontSize: 18.0),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    AutoSizeText(
                      'Oficina Virtual de Catastro.',
                      style:
                          TextStyle(color: AppTheme.themeWhite, fontSize: 16.0),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        CustomListTile(
            FaIcon(FontAwesomeIcons.home,
                size: 25, color: AppTheme.themeDefault),
            '    Acerca del Municipio.', () {
          if (prefs.departament == 'Torno')
            navegation(context, MunicipioTornoPage());
          if (prefs.departament == 'Cochabamba')
            navegation(context, MunicipioCbbPage());
          if (prefs.departament == 'Torno')
            navegation(context, MunicipioCbbPage());
          if (prefs.departament == 'Torno')
            navegation(context, MunicipioCbbPage());
        }),
        CustomListTile(
            FaIcon(FontAwesomeIcons.facebook, size: 25, color: Colors.blue),
            '   Estamos en Facebook',
            () => navegation(
                context,
                ViewPage(
                    title: 'PAGINA OFICIAL DEL MUNICIPIO'.toString(),
                    url: facebookTorno))),
        CustomListTile(
            FaIcon(FontAwesomeIcons.mailBulk, size: 25, color: Colors.red),
            '   Buzón de Sugerencias', () {
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
      if (prefs.departament.toString().toUpperCase() == 'CBB')
            sendEmailAdvanced(
                'pmgm@cochabamba.bo',
                'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
                'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
  
        }),
        CustomListTile(
            FaIcon(FontAwesomeIcons.shareAlt,
                size: 25, color: AppTheme.themeBlackGrey),
            '    Comparte la aplicación',
            () => sharedText(
                'BIENVENIDO A AMASZVENTAS',
                '*APLICACIÓN AMASVENTAS.*\n *Una aplicación para al familia AmasZonas.*\n💬 Con  *AmaszVentas podrás: * \n 🔺 Notificaciones en línea. \n 🔺 Enterarte de las promociones. \n 🔺Inscribirte como promotor de ventas. \n🔺Venta de pasajes. \n 🔺 Compra de pasajes. 🔺 Mucho mas... \n📲 *Descargar la App en el siguiente enlace:* https://play.google.com/store/apps/details?id=bo.amaszonas',
                'text/html')),
        CustomListTile(
            FaIcon(
              FontAwesomeIcons.questionCircle,
              size: 25,
              color: AppTheme.themeGrey,
            ),
            '     Preguntas frecuentes',
            () => navegation(context, FaqPage())),
        CustomListTile(
            FaIcon(FontAwesomeIcons.commentAlt,
                size: 25, color: AppTheme.themeDefault),
            '    Acerca de la APP.',
            () => navegation(context, IntroPage())),
        CustomListTile(
            FaIcon(
              FontAwesomeIcons.home,
              size: 25,
            ),
            '    Cerrar Sesión',
            () => navegation(context, LogOnPage())),
      ],
    ));
  }
}
