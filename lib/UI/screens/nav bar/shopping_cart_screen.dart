import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import '../../../constant/style.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: homeAppBar,
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: lightBlack,),onPressed: ()=> Navigator.pop(context),),
        elevation: 0,
        backgroundColor: backGround,
      ),
      body: Center(
        child: Text('Shopping Cart is empty',style: titleStyle.copyWith(fontSize: 25),),
      ),
    );
  }
}
