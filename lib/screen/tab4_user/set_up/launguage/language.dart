import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/setup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model {
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
      list.add(Model("USA", Utils.getAssetsImg('usa'), true));
      list.add(Model("Thailand", Utils.getAssetsImg('eng'), false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.only(right: 70),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SetUpScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Set Language',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )),
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
                          height: 60,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                offset: Offset(0.5, 0.5),
                                color: ColorRes.greyColor,
                                blurRadius: 0.7,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                list[index].image,
                                height: 50,
                                width: 70,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(list[index].name),
                                  list[index].isSelected
                                      ? Container(
                                          padding: EdgeInsets.only(left: 200),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorRes.primaryColor,
                                            radius: 15,
                                            child: Icon(Icons.check, size: 20),
                                          ))
                                      : Container(),
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
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
