import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: const Text(
          'AppWab',
          style: homeAppBar,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height*0.02,),
          items('About us', context, '', Icons.info_outline_rounded),
          SizedBox(height: height*0.02,),
          Container(
            width: width,
            height: height * 0.0002,
            color: lightBlack,
          ),
          SizedBox(height: height*0.02,),
          items('Switch Language', context, '', Icons.blur_circular_outlined),
          SizedBox(height: height*0.02,),
          Container(
            width: width,
            height: height * 0.0003,
            color: lightBlack,
          ),
          SizedBox(height: height*0.02,),
          items('Terms & Conditions', context, '', Icons.info_outline_rounded),
          SizedBox(height: height*0.02,),
          Container(
            width: width,
            height: height * 0.0003,
            color: lightBlack,
          ),
          SizedBox(height: height*0.02,),
          items('Privacy policy', context, '', Icons.info_outline_rounded),
          SizedBox(height: height*0.2,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: width*0.05,),
              const Icon(Icons.featured_video,color: lightBlack,),
              SizedBox(width: width*0.03,),
              const Text(
                'Contact us',
                style: profileItem,
              ),
            ],
          ),
          SizedBox(height: height*0.02,),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'Social media',
              style: profileItem,
            ),
          ),
          SizedBox(height: height*0.02,),
          const Padding(
            padding: EdgeInsets.only(left: 38.0),
            child: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),
          )
        ],
      ),
    );
  }
  Widget items(String title,BuildContext context,String page,IconData icon){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 5),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, page),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon,color: lightBlack,),
                SizedBox(width: width*0.03,),
                Text(
                  title,
                  style: profileItem,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,color: lightBlack,)
          ],
        ),
      ),
    );
  }
}
