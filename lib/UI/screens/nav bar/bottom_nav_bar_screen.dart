
import 'package:appwab_e_commerce/UI/screens/nav%20bar/category_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/home_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/search_screen.dart';
import 'package:appwab_e_commerce/UI/screens/nav%20bar/settings_screen.dart';
import 'package:appwab_e_commerce/constant/colors.dart';
import 'package:appwab_e_commerce/constant/strings.dart';
import 'package:appwab_e_commerce/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void onTap(index){
    setState(() {
      _index = index;
    });
  }


  final List<Widget> _widgetList = [
    const HomeScreen(),
    const SearchScreen(),
    const CategoryScreen(),
    const SettingsScreen(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetList[_index],
      bottomNavigationBar: _buildBottomBar(context,_index),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }




  Widget _buildBottomBar(BuildContext context,int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: SizedBox(
        height: height*0.1,
        child: Row(
          children: <Widget>[
            SizedBox(width: width*0.05,),
            Column(
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.home,size: 25.0,color: index == 0? red:lightBlack,), onPressed: ()=> onTap(0),),
                Text('Home',style: index == 0? navRed:navGrey,)
              ],
            ),
            SizedBox(width: width*0.09,),
            Column(
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.search,size: 25.0,color: index == 1? red:lightBlack,), onPressed: ()=>onTap(1),),
                Text('Search',style: index == 1? navRed:navGrey,)
              ],
            ),
            SizedBox(width: width*0.25,),
            Column(
              children: [
                IconButton(icon: Icon(Icons.category,size: 25.0,color: index == 2? red:lightBlack,), onPressed: ()=> onTap(2),),
                Text('Category',style: index == 2? navRed:navGrey,)
              ],
            ),
            SizedBox(width: width*0.07,),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.settings,
                    size: 25.0,
                    color: index == 3? red:lightBlack,),
                  onPressed: ()=>  {
                    onTap(3),
                  },
                ),
                Text('Settings',style: index == 3? navRed:navGrey,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: red,
      child: const FaIcon(FontAwesomeIcons.plus),
      onPressed: () {
        Navigator.pushNamed(context, cart);
      },
    );
  }
}