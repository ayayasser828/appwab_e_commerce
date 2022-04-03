import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: homeAppBar,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'All',
                  style: homeAppBar,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                height: height * 0.0003,
                color: lightBlack,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: height * 0.7,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.pushNamed(context, pCategory),
                              child: const Text(
                            'Category',
                            style: homeAppBar,
                          )),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 3),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
