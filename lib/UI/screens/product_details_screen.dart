import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussiness logic/general/general_cubit.dart';
import '../../constant/colors.dart';
import '../../constant/style.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> items = ['تولة1 ', '2 تولة'];
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: homeAppBar,
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: width*0.9,
                    height: height*0.6,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(child: Image.asset('assets/images/oud.jpg',width: width*0.6,height: height*0.3,)),
                          Text('Cambodi Oid',style: titleStyle.copyWith(fontSize: 25),),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(' اسطورة اخشاب العود الكمبودى المعتق من ادغال كمبوديا',style: navGrey.copyWith(fontSize: 18)),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          const Text('start from',style: navGrey),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('50.000 KD',style: titleStyle.copyWith(fontSize: 25),),
                              const Icon(Icons.share)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text('Attributes',style: titleStyle.copyWith(fontSize: 25),),
                SizedBox(
                  height: height * 0.01,
                ),
                Center(
                  child: Container(
                    width: width*0.9,
                    height: height*0.13,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width * 0.33,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: lightBlack)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.close,
                              color: lightBlack,
                              size: 30,
                            ),
                            Container(
                              width: width * 0.33,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: DropdownButton(
                                  hint:const Text('عدد التولات'),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text('Notes',style: titleStyle.copyWith(fontSize: 25),),
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
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: _buildFAB(context),
    );
  }
  Widget _buildFAB(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width*0.9,
      height: height*0.07,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: red),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_shopping_cart,color: white,),
          SizedBox(width: width*0.02,),
          const Text('Add to cart',style: selectStyle,)
        ],
      ),
    );
  }
}
