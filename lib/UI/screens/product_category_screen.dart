import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';
import '../widgets/widgets.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: const Text(
          'Category',
          style: homeAppBar,
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,color: lightBlack,))
        ],
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: ListView(
        children: [
          SizedBox(
              width: width * 0.75,
              height: height,
              child: StaggeredGridView.countBuilder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return homeWidget(context, 'assets/images/oud.jpg', 'Cambodi Oid',
                      ' اسطورة اخشاب العود الكمبودى المعتق من ادغال كمبوديا','KD 160.00');
                },
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
              ))
        ],
      ),
    );
  }
}
