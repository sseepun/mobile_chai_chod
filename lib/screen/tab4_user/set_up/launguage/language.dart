import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/material.dart';
class Model{
  String name;
  String image;
  bool isSelected;

  Model(this.name, this.image, this.isSelected);
}
class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<Model> list = List();
  String _isSelected = 'USA';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      list.add(Model("USA", "assets/usa.png", true));
      list.add(Model("Thailand", "assets/thai.png", false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Set Language',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // _isSelected = ;
                    });
                  },
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 70,
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                list[index].image,
                                height: 50,
                                width: 70,
                              ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(list[index].name),
                                 list[index].isSelected ? Container(
                                     child: CircleAvatar(
                                       child: Icon(Icons.check,size: 20,),
                                     )) : Container(),
                               ],
                             )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
      /*Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: Card(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/usa.png',
                          height: 50,
                          width: 100,
                        ),
                        Text('English'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Card(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/thai.png',
                          height: 50,
                          width: 100,
                        ),
                        Text('Thailand'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),*/

      bottomNavigationBar: Container(
        color: ColorRes.primaryColor,
//        alignment: Alignment.bottomCenter,
        height: 50,
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 2),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'Save',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
