import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:appwab_e_commerce/constant/style.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

Widget homeWidget(BuildContext context,String image,String title,String desc,String price){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () => Navigator.pushNamed(context, productDetails),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width * 0.5,
                height: height * 0.15,
                decoration: BoxDecoration(
                  color: backGround,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(price,style: priceStyle,),
            SizedBox(
              height: height * 0.01,
            ),
            Text(title,style: titleStyle,),
            SizedBox(
              height: height * 0.005,
            ),
            Text(desc,style: navGrey,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,),
            SizedBox(
              height: height * 0.005,
            ),
            Container(
              height: height*0.05,
              decoration: const BoxDecoration(
                color: red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_shopping_cart,color: white,),
                  SizedBox(width: width*0.01,),
                  const Text('Select',style: selectStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}