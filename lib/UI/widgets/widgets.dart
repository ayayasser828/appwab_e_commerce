import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:appwab_e_commerce/constant/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constant/colors.dart';
import '../../constant/get_lang.dart';

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

void dialogCart(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          width: 400,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.shoppingBasket,size: 40,),
              const SizedBox(height: 10,),
              Text('Product has been added to cart',style: titleStyle.copyWith(fontSize: 20),)
            ],
          ),
        ),
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        actions: [
          Column(
            children: [
              FlatButton(
                  onPressed: () => Navigator.pushNamed(context, cart),
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red,
                    ),
                    child: const Center(
                        child: Text('Go To The Cart',
                            style: TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.bold))),
                  )),
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: red)
                    ),
                    child: const Center(
                        child: Text('Continue Shopping',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  )),
            ],
          )
        ],
      ));
}

Widget cartWidget(BuildContext context,String image,String title,String price){
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.3,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(title,style: titleStyle,),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(price,style: priceStyle,),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    const Text('عدد النولات : 1 تولة',style: navGrey,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,),
                    SizedBox(
                      height: height * 0.005,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: height*0.15,
              width: width*0.1,
              decoration: BoxDecoration(
                color: red,
                borderRadius: GetLAng.lang == 'en_US' ? const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                ) : const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.add,color: white,),
                  Text('1',style: selectStyle,),
                  Icon(Icons.close_outlined,color: white,),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class CustomTabBar extends StatefulWidget {
  late TabController tabController;
  late int activeTabIndex;

  CustomTabBar(
      {Key? key, required this.tabController, required this.activeTabIndex})
      : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: height * 0.06,
        width: width*0.7,
        child: TabBar(
            controller: widget.tabController,
            unselectedLabelColor: white,
            isScrollable: false,
            padding: const EdgeInsets.all(2.0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: red),
            tabs: [
              Tab(
                child: Text(
                  tr('delivery'),
                  style: TextStyle(
                    color: widget.activeTabIndex == 0
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 18
                  ),
                ),
              ),
              Tab(
                child: Text(
                  tr('pickup'),
                  style: TextStyle(
                    color: widget.activeTabIndex == 1
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 18
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    Key? key,
    this.controller,
    required this.type, required this.hint, this.icon, this.validation, this.onSave, this.min, this.color,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType type;
  final String hint;
  final Icon? icon;
  final Color? color;
  final String? Function(String?)? validation;
  final String? Function(String?)? onSave;
  final int? min;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      autofocus: false,
      cursorColor: white,
      validator: validation,
      minLines: min,
      maxLines: null,
      onSaved: onSave,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: white)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide(color: color ?? white)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide(color: color ?? white)),
          prefixIcon: icon
      ),
    );
  }
}