import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/faq/FaqPage.dart';
import 'package:seicu/src/page/general/ViewPage.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/page/intro/IntroPage.dart';
import 'package:seicu/src/page/seicu/Municipio/MunicipioCbba.dart';
import 'package:seicu/src/page/seicu/Municipio/MunicipioTorno.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/general/SenWidget.dart';
import 'package:seicu/src/widget/general/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final prefs = new Preferense();

Widget boomMenu(BuildContext context) {
  return BoomMenu(
    backgroundColor: AppTheme.themeDefault,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    child: Icon(Icons.add),
    scrollVisible: true,
    overlayColor: Colors.black,
    overlayOpacity: 0.7,
    children: [
      MenuItem(
          child: FaIcon(
            FontAwesomeIcons.home,
            size: 35,
            color: AppTheme.themeGrey,
          ),
          title: "Acerca del Municipio",
          titleColor: AppTheme.themeBlackBlack,
          subtitle: "Conoce sobre tu municpio encargado de tu Catastro.",
          subTitleColor: AppTheme.themeBlackBlack,
          backgroundColor: AppTheme.themeWhite,
          onTap: () {
            if (prefs.departament == 'Torno')
              navegation(context, MunicipioTornoPage());
            if (prefs.departament == 'Cochabamba')
              navegation(context, MunicipioCbbPage());
            if (prefs.departament == 'Torno')
              navegation(context, MunicipioCbbPage());
            if (prefs.departament == 'Torno')
              navegation(context, MunicipioCbbPage());
          }),
      MenuItem(
          child:
              FaIcon(FontAwesomeIcons.facebook, size: 35, color: Colors.blue),
          title: "Visitanos en Facebook",
          titleColor: AppTheme.themeBlackBlack,
          subtitle: "Visita la página de Catastro en Facebook",
          subTitleColor: AppTheme.themeBlackBlack,
          backgroundColor: AppTheme.themeWhite,
          onTap: () {
            if (prefs.departament == 'Torno')
              navegation(
                  context,
                  ViewPage(
                      title: 'PAGINA OFICIAL DE CATASTRO'.toString(),
                      url: facebookTorno));
            if (prefs.departament == 'Torno')
              navegation(
                  context,
                  ViewPage(
                      title: 'PAGINA OFICIAL DE CATASTRO'.toString(),
                      url: facebookTorno));
            if (prefs.departament == 'Cochabamba')
              navegation(
                  context,
                  ViewPage(
                      title: 'PAGINA OFICIAL DE CATASTRO'.toString(),
                      url: facebookCbb));
            if (prefs.departament == 'Torno')
              navegation(
                  context,
                  ViewPage(
                      title: 'PAGINA OFICIAL DE CATASTRO'.toString(),
                      url: facebookCbb));
          }),
      MenuItem(
          child: FaIcon(FontAwesomeIcons.mailBulk,
              size: 35, color: Colors.redAccent),
          title: "Contactate con el municipio",
          titleColor: AppTheme.themeBlackBlack,
          subtitle: "Si gustas comunicarte con nosotros contáctate",
          subTitleColor: AppTheme.themeBlackBlack,
          backgroundColor: AppTheme.themeWhite,
          onTap: () {
            if (prefs.departament == 'Torno')
              sendEmailAdvanced(
                  'pmgm@torno.com',
                  'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
                  'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
            if (prefs.departament == 'Cochabamba')
              sendEmailAdvanced(
                  'pmgm@cochabamba.bo',
                  'SRES. DEL MUNICIPIO DEL ${prefs.departament.toString().toUpperCase()}  DESEO COMUNICARME CON UDS.',
                  'De mi consideración: \n\n Tengan un buen día. Deseo comunciarme con ustedes para poder conocer sobre información de mi Catastro y mi propiedad. \n\n Saludos cordiales.');
          }),
      MenuItem(
        child: FaIcon(FontAwesomeIcons.shareAlt,
            size: 35, color: AppTheme.themeBlackGrey),
        title: "Compartir aplicación",
        titleColor: AppTheme.themeBlackBlack,
        subtitle: "Queremos que la familia crezca contigo.",
        subTitleColor: AppTheme.themeBlackBlack,
        backgroundColor: AppTheme.themeWhite,
        onTap: () => sharedText(
            'BIENVENIDO A SEICU',
            '*APLICACIÓN SEICU.*\n *Una aplicación para la familia de Catastro.*\n💬 Con  *Seicu podrás: * \n 🔺 Notificaciones en línea. \n 🔺 Enterarte de las promociones. \n 🔺Inscribirte como promotor de ventas. \n🔺Venta de pasajes. \n 🔺 Compra de pasajes. 🔺 Mucho mas... \n📲 *Descargar la App en el siguiente enlace:* https://play.google.com/store/apps/details?id=bo.seicu',
            'text/html'),
      ),
      MenuItem(
        child: FaIcon(
          FontAwesomeIcons.questionCircle,
          size: 35,
          color: AppTheme.themeGrey,
        ),
        title: "Preguntas frecuentes",
        titleColor: AppTheme.themeBlackBlack,
        subtitle: "Estamos para aclararte las consultas.",
        subTitleColor: AppTheme.themeBlackBlack,
        backgroundColor: AppTheme.themeWhite,
        onTap: () => navegation(context, FaqPage()),
      ),
      MenuItem(
        child: FaIcon(FontAwesomeIcons.commentAlt,
            size: 35, color: AppTheme.themeDefault),
        title: "Acerca de la App",
        titleColor: AppTheme.themeBlackBlack,
        subtitle: "Conoce sobre nuestra APP.",
        subTitleColor: AppTheme.themeBlackBlack,
        backgroundColor: AppTheme.themeWhite,
        onTap: () => navegation(context, IntroPage()),
      ),
      MenuItem(
        child: Icon(Icons.home, color: AppTheme.themeWhite, size: 45),
        title: "Inicio a la APP.",
        titleColor: Colors.white,
        subtitle: "Si desea ir la inicio de la Aplicación.",
        subTitleColor: AppTheme.themeWhite,
        backgroundColor: Colors.red,
        onTap: () => navegation(context, HomePage()),
      )
    ],
  );
}
