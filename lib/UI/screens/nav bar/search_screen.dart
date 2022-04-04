import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: Text(
          tr('search'),
          style: homeAppBar,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              searchBar(context),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                  width: width*0.9,
                  height: height,
                  child: StaggeredGridView.countBuilder(
                    itemCount: 8,
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
          )
        ],
      ),
    );
  }
  Widget searchBar(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.07,
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/search1.svg',color: lightBlack,
            ),
            SizedBox(
              height: height * 0.06,
              width: width * 0.5,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: tr('s_word'),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
