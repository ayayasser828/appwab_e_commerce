import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussiness logic/general/general_cubit.dart';
import '../../constant/colors.dart';
import '../../constant/get_lang.dart';
import '../../constant/strings.dart';
import '../../constant/style.dart';
import '../widgets/widgets.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> with TickerProviderStateMixin{
  late TabController controller;
  int activeTabIndex = 0;
  List<String> items = ['تولة1 ', '2 تولة'];
  @override
  void initState() {
    controller = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {
        activeTabIndex = controller.index;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: Text(
          tr('delivery_d'),
          style: homeAppBar,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.07),
          child: CustomTabBar(
            tabController: controller,
            activeTabIndex: activeTabIndex,
          ),
          // SwitchBetweenHomeAndSalon(isHome: home, isSalon: salon),
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          delivery(context),
          pickup()
        ],
      ),
    );
  }
  Widget delivery(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height*0.628,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,borderRadius: BorderRadius.circular(10)
                  ),
                  child: MyTextFormFieldWidget(
                      type: TextInputType.name,
                      hint: tr('name'),
                      icon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(height: height*0.01,),
                Container(
                  decoration: BoxDecoration(
                    color: white,borderRadius: BorderRadius.circular(10)
                  ),
                  child: MyTextFormFieldWidget(
                      type: TextInputType.name,
                      hint: tr('number'),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  height: height*0.71,
                  decoration: BoxDecoration(
                      color: white,borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(tr('country'),style: titleStyle.copyWith(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: lightBlack)
                        ),
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: DropdownButton(
                              hint: Text(tr('country')),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: lightBlack,
                                size: 30,
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: titleStyle,
                                    ));
                              }).toList(),
                              onChanged: (String? v) {
                                BlocProvider.of<GeneralCubit>(context)
                                    .dropDown(v!);
                              },
                              elevation: 0,
                              underline: const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(tr('city'),style: titleStyle.copyWith(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: lightBlack)
                        ),
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: DropdownButton(
                              hint: Text(tr('city')),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: lightBlack,
                                size: 30,
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: titleStyle,
                                    ));
                              }).toList(),
                              onChanged: (String? v) {
                                BlocProvider.of<GeneralCubit>(context)
                                    .dropDown(v!);
                              },
                              elevation: 0,
                              underline: const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(tr('address'),style: titleStyle.copyWith(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: lightBlack)
                        ),
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: DropdownButton(
                              hint: Text(tr('area')),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: lightBlack,
                                size: 30,
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: titleStyle,
                                    ));
                              }).toList(),
                              onChanged: (String? v) {
                                BlocProvider.of<GeneralCubit>(context)
                                    .dropDown(v!);
                              },
                              elevation: 0,
                              underline: const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                                type: TextInputType.name,
                                color: lightBlack,
                                hint: tr('block'),
                                ),
                          ),
                          SizedBox(width: width*0.02,),
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                                type: TextInputType.name,
                                color: lightBlack,
                                hint: tr('block'),
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                              type: TextInputType.name,
                              color: lightBlack,
                              hint: tr('block'),
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                              type: TextInputType.name,
                              color: lightBlack,
                              hint: tr('block'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                              type: TextInputType.name,
                              color: lightBlack,
                              hint: tr('block'),
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Container(
                            width: width*0.39,
                            height: height*0.06,
                            decoration: BoxDecoration(
                                color: white,borderRadius: BorderRadius.circular(10)
                            ),
                            child: MyTextFormFieldWidget(
                              type: TextInputType.name,
                              color: lightBlack,
                              hint: tr('block'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Center(
                        child: Container(
                          height: height * 0.08,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              border: Border.all(color: lightBlack)),
                          child: TextFormField(
                            minLines:
                            6, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: tr('note'),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
              ],
            ),
          ),
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
    );
  }

  Widget pickup(){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height*0.628,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: white,borderRadius: BorderRadius.circular(10)
                  ),
                  child: MyTextFormFieldWidget(
                      type: TextInputType.name,
                      hint: tr('name'),
                      icon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(height: height*0.01,),
                Container(
                  decoration: BoxDecoration(
                      color: white,borderRadius: BorderRadius.circular(10)
                  ),
                  child: MyTextFormFieldWidget(
                      type: TextInputType.name,
                      hint: tr('number'),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      )),
                ),
              ],
            ),
          ),
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
    );
  }
}
