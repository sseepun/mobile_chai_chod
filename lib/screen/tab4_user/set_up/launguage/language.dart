import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';

//model are name and image
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
    //list of country name , flag
    setState(() {
      list.add(Model("USA", Utils.getAssetsImg('usa')));
      list.add(Model("Thailand", Utils.getAssetsImg('eng')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorRes.lightWhite,
        child: SafeArea(
        bottom: false,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70), // here the desired height
              child: AppBar(
                elevation: 0.0,
                leading: IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only( left: 5),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(StringRes.setLanguage,
                      style: TextStyle(color: ColorRes.blackColor)),
                ),
                backgroundColor: ColorRes.lightWhite,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
                centerTitle: true,
              ),
            ),

            backgroundColor: ColorRes.lightWhite,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // CommonView.backArrowAndTitle(context, StringRes.setLanguage, ColorRes.blackColor),
                  // SizedBox(height: 20),
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
            )),),);
  }

  //languageData are use in list of country name and flag
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
