import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/crosscutting/Const.dart';
import 'package:seicu/src/page/home/HomePage.dart';
import 'package:seicu/src/style/Style.dart';

import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/widget/gfWidget/GfWidget.dart';

class IntroPage extends StatefulWidget {
  static final String routeName = 'IntroPage';
  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final prefs = new Preferense();
  final int _numPages = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    prefs.lastPage = IntroPage.routeName;
    super.initState();
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.themeDefault : AppTheme.themeBlackGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //    backgroundBasic(context),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => navegation(
                      context,
                      HomePage(),
                    ),
                    child: Text(
                      'Iniciar',
                      style: TextStyle(
                        color: AppTheme.themeDefault,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: NetworkImage(IMAGE_SCREEN1),
                                height: 180.0,
                                fit: BoxFit.fill,
                              ),
                            ),

                            Shimmer.fromColors(
                              baseColor: AppTheme.themeDefault,
                              highlightColor: Colors.yellow,
                              child: AutoSizeText(
                                'QUÉ ES EL PMGM ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            sizedBox(0, 15.0),
                            //    Expanded(
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    sizedBox(0, 11.0),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child:
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    //  ),
                                    sizedBox(10, 11.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'El Programa de Mejora de la Gestión Municipal (PMGM) es una iniciativa para contribuir a mejorar la Gestión Catastral urbana en los municipios',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBox(0, 10.0),
                                Row(
                                  children: <Widget>[
                                    sizedBox(0, 15.0),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child: FaIcon(
                                    //       FontAwesomeIcons.playstation,
                                    //       color: AppTheme.themeDefault,
                                    //       size: 35.0),
                                    // ),
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    sizedBox(10, 15.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'Los municipios son beneficiarios de El Alto, Cochabamba, Santa Cruz de la Sierra, Sucre, Oruro.',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBox(10, 11.0),
                                Row(
                                  children: <Widget>[
                                    sizedBox(10, 11.0),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child: FaIcon(
                                    //       FontAwesomeIcons.playstation,
                                    //       color: AppTheme.themeDefault,
                                    //       size: 35.0),
                                    // ),
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    sizedBox(10, 10.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'El PMGM entre sus actividades principales esta el levantamiento de Información Catastral ',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: NetworkImage(IMAGE_SCREEN2),
                                height: 180.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            sizedBox(10, 10.0),
                            Shimmer.fromColors(
                              baseColor: AppTheme.themeDefault,
                              highlightColor: Colors.yellow,
                              child: AutoSizeText(
                                'Qué Beneficios trae a los municipios.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            sizedBox(0, 10.0),

                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    sizedBox(0, 10.0),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child: FaIcon(
                                    //       FontAwesomeIcons.playstation,
                                    //       color: AppTheme.themeDefault,
                                    //       size: 35.0),
                                    // ),
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    sizedBox(10, 10.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'Contar un catastro actualizado, moderno que brinde todas las funcionalidades a los municipios apra geenrar información importante.',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBox(0, 10.0),
                                Row(
                                  children: <Widget>[
                                    sizedBox(0, 10),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child: FaIcon(
                                    //       FontAwesomeIcons.playstation,
                                    //       color: AppTheme.themeDefault,
                                    //       size: 35.0),
                                    // ),
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    sizedBox(10, 10.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'Brindar una plataforma efectiva 24/7 para que los beneficiarios de las propiedades puedan contar con información real y confiable.',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBox(0, 11.0),
                                Row(
                                  children: <Widget>[
                                    sizedBox(0, 10.0),
                                    // Shimmer.fromColors(
                                    //   baseColor: AppTheme.themeDefault,
                                    //   highlightColor: AppTheme.themePurple,
                                    //   child: FaIcon(
                                    //       FontAwesomeIcons.playstation,
                                    //       color: AppTheme.themeDefault,
                                    //       size: 35.0),
                                    // ),
                                    avatarCircle(IMAGE_DEFAULT, 25.0),
                                    sizedBox(10, 10.0),
                                    Expanded(
                                      child: AutoSizeText(
                                        'Generar una plataforma única, estándar y un manejo correcto del uso del catastro a través del SEICU.',
                                        style: kSubtitleStyleBlack,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: NetworkImage(IMAGE_SCREEN3),
                                height: 180.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            sizedBox(0, 5.0),
                            Shimmer.fromColors(
                              baseColor: AppTheme.themeDefault,
                              highlightColor: Colors.yellow,
                              child: AutoSizeText(
                                'Qué brindamos en la APP del SEICU.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            sizedBox(0, 12.0),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      sizedBox(0, 10.0),
                                      // Shimmer.fromColors(
                                      //   baseColor: AppTheme.themeDefault,
                                      //   highlightColor: AppTheme.themePurple,
                                      //   child: FaIcon(
                                      //       FontAwesomeIcons.playstation,
                                      //       color: AppTheme.themeDefault,
                                      //       size: 35.0),
                                      // ),
                                      avatarCircle(IMAGE_DEFAULT, 25.0),
                                      sizedBox(10.0, 0),
                                      Expanded(
                                        child: AutoSizeText(
                                          'Información y seguimeinto de trámties de la solicitud de Catastro para los funcoanrios y beneficiarios de la propiedad.',
                                          style: kSubtitleStyleBlack,
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox(10, 12.0),
                                  Row(
                                    children: <Widget>[
                                      sizedBox(0, 10.0),
                                      // Shimmer.fromColors(
                                      //   baseColor: AppTheme.themeDefault,
                                      //   highlightColor: AppTheme.themePurple,
                                      //   child: FaIcon(
                                      //       FontAwesomeIcons.playstation,
                                      //       color: AppTheme.themeDefault,
                                      //       size: 35.0),
                                      // ),
                                      avatarCircle(IMAGE_DEFAULT, 25.0),
                                      sizedBox(10, 10.0),
                                      Expanded(
                                        child: AutoSizeText(
                                          'Información actualizada sobre los tipos de trámites, notificaciones que permitan al beneficiario conocer sobre el estado de la propiedad o noticias del municipio',
                                          style: kSubtitleStyleBlack,
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox(0, 12.0),
                                  Row(
                                    children: <Widget>[
                                      sizedBox(10, 10.0),
                                      // Shimmer.fromColors(
                                      //   baseColor: AppTheme.themeDefault,
                                      //   highlightColor: AppTheme.themePurple,
                                      //   child: FaIcon(
                                      //       FontAwesomeIcons.playstation,
                                      //       color: AppTheme.themeDefault,
                                      //       size: 35.0),
                                      // ),
                                      avatarCircle(IMAGE_LOGO, 25.0),
                                      sizedBox(0, 10.0),
                                      Expanded(
                                        child: AutoSizeText(
                                          'Información sobre los muncicipios y los medios de contacto para que la6s personas peudan realziar alguna consulta a una persona asignada en cada muncipio sobre el Catastro.',
                                          style: kSubtitleStyleBlack,
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Siguiente',
                                  style: TextStyle(
                                    color: AppTheme.themeDefault,
                                    fontSize: 22.0,
                                  ),
                                ),
                                sizedBox(0, 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppTheme.themeDefault,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 50.0,
              width: double.infinity,
              color: AppTheme.themeDefault,
              child: GestureDetector(
                onTap: () => navegation(
                  context,
                  HomePage(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Comenzar',
                          style: TextStyle(
                            color: AppTheme.themeWhite,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBox(10.0, 0),
                        FaIcon(
                          FontAwesomeIcons.houseUser,
                          color: AppTheme.themeWhite,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
