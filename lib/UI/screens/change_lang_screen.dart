import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/get_lang.dart';
import '../../constant/style.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: Text(
          tr('change_lang'),
          style: homeAppBar,
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                if (context.locale.languageCode == 'ar') {
                  GetLAng.lang = 'en_US';
                  context.setLocale(const Locale('en', 'US'));
                } else {
                  GetLAng.lang = 'ar_EG';
                  context.setLocale(const Locale('ar', 'EG'));
                }
                Navigator.of(context).pop();
              },
              child: Text(
                  context.locale.languageCode == 'ar'
                      ? 'ENGLISH'
                      : "عربي",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
