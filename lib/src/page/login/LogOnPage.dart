import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:seicu/src/crosscutting/Preference.dart';
import 'package:seicu/src/page/intro/IntroPage.dart';
import 'package:seicu/src/page/login/LoginClipperPage.dart';
import 'package:seicu/src/theme/Theme.dart';
import 'package:seicu/src/widget/general/GeneralWidget.dart';
import 'package:seicu/src/crosscutting/Const.dart';

class LogOnPage extends StatefulWidget {
  @override
  _LogOnPageState createState() => _LogOnPageState();
}

class _LogOnPageState extends State<LogOnPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = new Preferense();

  @override
  void initState() {
    super.initState();
    // prefs.lastPage = LoginPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              //   Container(),
              Image.network(
                IMAGE_LOGON,
                fit: BoxFit.fitHeight,
                height: size.height,
                width: size.width,
              ),
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: LoginCustomClipper(),
                  child: _buttonsSignUp(size, context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buttonsSignUp(Size size, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      height: size.height * 0.5,
      width: size.width,
      color: AppTheme.themeDefault,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: AppTheme.themeWhite,
            highlightColor: Colors.lightBlueAccent,
            child: AutoSizeText(
              'Bienvenido a la Oficina Virtual',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: AppTheme.themeWhite,
            highlightColor: Colors.lightBlueAccent,
            child: AutoSizeText(
              'SEICU DIGITAL',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _gmailButton(),
          sizedBox(0.0, 8.0),
          copyRigth(),
        ],
      ),
    );
  }

  Widget _gmailButton() {
    return OutlineButton(
      splashColor: Colors.black,
      onPressed: _submit,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.houseUser,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Ingresar a Catastro',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _submit() {
    Navigator.push(
        context,
        PageTransition(
          curve: Curves.bounceOut,
          type: PageTransitionType.rotate,
          alignment: Alignment.topCenter,
          child: IntroPage(),
        ));
  }
}
