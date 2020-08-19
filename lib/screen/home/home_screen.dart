import 'package:flutter/material.dart';

class HomeScrene extends StatefulWidget {
  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(

            child: OutlineButton(
              padding:EdgeInsets.only( top:2,left: 10, right: 10),

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
                  border: UnderlineInputBorder(borderRadius: BorderRadius.circular(2)),
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    fontFamily: 'Lato',
                    letterSpacing: 1.0,
                    fontSize: 15,
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.fromLTRB(45.0, 15.0, 30.0, 15.0),
                ),
              ),
              onPressed: () {
              },
              borderSide: BorderSide(
                color: Colors.black26,
                style: BorderStyle.solid,
                width: 0.8, //width of the border
              ),
            ),

          ),
        ],
      ),
    );
  }
}
