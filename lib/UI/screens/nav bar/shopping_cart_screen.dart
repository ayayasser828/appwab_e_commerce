import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import '../../../constant/get_lang.dart';
import '../../../constant/style.dart';
import '../../widgets/widgets.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: Text(
          tr('shopping'),
          style: homeAppBar,
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.698,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => cartWidget(context, 'assets/images/oud.jpg', 'Cambodi Oid','KD 160.00'),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 2),
          ),
          Container(
            width: width,
            height: height*0.15,
            decoration: const BoxDecoration(
              color: red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr('checkout'),style: selectStyle.copyWith(fontSize: 25,fontWeight: FontWeight.w400),),
                      Text('160.00' + tr('kd'),style: selectStyle.copyWith(fontSize: 25,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, deliveryDetails),
                  child: Container(
                    width: width*0.15,
                    height: height*0.07,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: GetLAng.lang == 'en_US' ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                      ) : const BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                      )
                    ),
                    child: const Icon(Icons.send,color: red,),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
