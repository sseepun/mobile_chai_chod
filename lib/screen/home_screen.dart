import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class HomeScrene extends StatefulWidget {
  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: new Form(
             child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  searchTextFiled(),

                  SizedBox(height: 10),
                  scrollImage(),

                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  searchTextFiled() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: OutlineButton(
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(2)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(2)),
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(2)),
            hintText: 'Search here...',
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              letterSpacing: 1.0,
              fontSize: 15,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 15.0),
          ),
        ),
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black26,
          width: 0.8, //width of the border
        ),
      ),
    );
  }

  scrollImage(){
    return Container(
      child: Image.asset(Utils.getAssetsImg('car'),
        width: 370,
        height: 210,
        fit: BoxFit.fill,
      ),
    );
  }

  textFiled(){

  }
}
