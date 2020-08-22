import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/setup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model {
  String name;
  String image;

  Model(this.name, this.image);
}

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<Model> list = List();
  String _isSelected = 'USA';

  int isSelectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      list.add(Model("USA", Utils.getAssetsImg('usa')));
      list.add(Model("Thailand", Utils.getAssetsImg('eng')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.lightWhite,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonView.backArrowAndTitle(context, StringRes.setLanguage, ColorRes.blackColor),
                  SizedBox(height: 20),
                  ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return languageData(index);
                      }),
                ],
              ),
            ),

            bottomNavigationBar: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                child: FilledButton(text: StringRes.save, fontSize: 18),
              ),
            )));
  }

  Widget languageData(int index) {
    return InkResponse(
      onTap: () {
        isSelectedIndex = index;
      setState(() {});
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        color: ColorRes.whiteColor,
        child: Row(
            children: <Widget>[
              Image.asset(
                list[index].image,
                height: 40,
                width: 60,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(list[index].name),
                    isSelectedIndex == index
                        ? Container(
                        child: CircleAvatar(
                          backgroundColor:
                          ColorRes.primaryColor,
                          radius: 15,
                          child: Icon(Icons.check,
                              size: 20),
                        ))
                        : Container(),
                  ],
                ),
              )]),
      ),
    );
  }
}
