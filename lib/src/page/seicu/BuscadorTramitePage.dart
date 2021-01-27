import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/page/seicu/TramitesPage.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/appBar/AppBarWidget.dart';
import 'package:seicu/src/widget/drawer/DrawerWidget.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';

class BuscadorTramitesPage extends StatefulWidget {
  static final String routeName = 'buscadorPage';
  BuscadorTramitesPage({
    Key key,
  }) : super(key: key);

  @override
  _BuscadorTramitesPageState createState() => _BuscadorTramitesPageState();
}

class _BuscadorTramitesPageState extends State<BuscadorTramitesPage> {
  // DEFINICIOND E VARIABLES
  final prefs = new Preferense();
  final controllerHR = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar('BUSCA TU TRÁMITE'),
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
              _text(
                  controllerHR,
                  '',
                  '(*) Ingrese su hoja de ruta',
                  40,
                  1,
                  'Ingrese su hoja de ruta',
                  true,
                  FaIcon(FontAwesomeIcons.edit, color: AppTheme.themeDefault),
                  AppTheme.themeDefault,
                  AppTheme.themeDefault,
                  Colors.red),
              _button(context, 'Buscar Hoja de ruta', 18.0, 20.0),
              //      dividerBlack(),
              // AutoSizeText(
              //   'NOTA IMPORTANTE PARA EL CORRECTO USO DE LA OFICINA VIRTUAL',
              //   style: TextStyle(
              //       color: AppTheme.themeDefault,
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold),
              //   softWrap: true,
              //   maxLines: 2,
              //   overflow: TextOverflow.clip,
              //   textAlign: TextAlign.center,
              // ),
              // sizedBox(0, 7),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [

              //       AutoSizeText(
              //         '1. Ingresa el código de la hoja de ruta completamente.',
              //         style: TextStyle(
              //           color: AppTheme.themeDefault,
              //           fontSize: 16,
              //         ),
              //         softWrap: true,
              //         overflow: TextOverflow.clip,
              //         textAlign: TextAlign.start,
              //       ),
              //       AutoSizeText(
              //         '2. Ingresa a la opción "Buscar Hoja de Ruta"',
              //         style: TextStyle(
              //           color: AppTheme.themeDefault,
              //           fontSize: 16,
              //         ),
              //         softWrap: true,
              //         overflow: TextOverflow.clip,
              //         textAlign: TextAlign.start,
              //       ),
              //       AutoSizeText(
              //         '3. Si el código es válido se visualizará el detalle del trámite.',
              //         style: TextStyle(
              //           color: AppTheme.themeDefault,
              //           fontSize: 16,
              //         ),
              //         softWrap: true,
              //         overflow: TextOverflow.clip,
              //         textAlign: TextAlign.start,
              //       ),
              //     ],
              //   ),
              // ),
              copyRigthBlack(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatButton(AppTheme.themeDefault, context,
          FaIcon(FontAwesomeIcons.home, size: 35), HomePage()),
    );
  }

  Widget _text(
      TextEditingController controllerHR,
      String initialValue,
      String labelText,
      int maxLength,
      int maxLines,
      String hintText,
      bool isValidate,
      FaIcon icon,
      Color hoverColor,
      Color fillColor,
      Color focusColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      child: TextFormField(
        initialValue: initialValue,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: true,
        maxLength: maxLength,
        autocorrect: true,
        autovalidate: false,
        maxLines: maxLines,
        cursorColor: AppTheme.themeDefault,
        toolbarOptions:
            ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
        keyboardType: TextInputType.text,
        // controller: controller,
        decoration: inputDecoration(
            hintText, labelText, icon, hoverColor, fillColor, focusColor),
        onChanged: (value) {
          setState(() {
            controllerHR.text = value;
          });
        },
        onSaved: (value) => controllerHR.text = value,
      ),
    );
  }

  Widget _button(
      BuildContext context, String text, double fontSize, double edgeInsets) {
    return GFButton(
      padding: EdgeInsets.symmetric(horizontal: edgeInsets),
      text: text,
      textStyle: TextStyle(fontSize: fontSize),
      textColor: AppTheme.themeWhite,
      color: AppTheme.themeDefault,
      icon: FaIcon(FontAwesomeIcons.search, color: AppTheme.themeWhite),
      shape: GFButtonShape.pills,
      onPressed: _submitInvitado,
    );
  }

  _submitInvitado() {
    print('ENTROOO: ${controllerHR.text.trim()}');
    navegation(context, TramitesPage(idHR: controllerHR.text.trim()));
  }
}
