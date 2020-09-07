import 'package:ChaiChod/export.dart';
import 'package:flutter/cupertino.dart';

class ChildAboutUsScreen extends StatefulWidget {
  @override
  _ChildAboutUsScreenState createState() => _ChildAboutUsScreenState();
}

class _ChildAboutUsScreenState extends State<ChildAboutUsScreen> {
  final controller = PageController();

  List<String> images = [
    Utils.getAssetsImg('about_car1'),
    Utils.getAssetsImg('about_car2'),
  ];

  List<String> stringList1 = [
    StringRes.description,
    StringRes.description1,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
//                  textTitle(),
              Container(
                height: Utils.getDeviceHeight(context) / 3.3,
                color: ColorRes.lightBlur,
              ),

              Column(
                children: <Widget>[
                  CommonView.backArrowAndTitle(context, StringRes.aboutUs, ColorRes.whiteColor),

                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listData(index);
                      }),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  textTitle() {
    return Container(
        color: ColorRes.primaryColor,
        height: 200,
        padding: EdgeInsets.only(bottom: 100),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: AllText(
                StringRes.aboutUs,
                color: ColorRes.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  //list data are list view design
  listData(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 15,bottom: 10),
              child: Image.asset(images[index], height: 200, width: 330,fit: BoxFit.fill),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 25),
              child: AllText(
                stringList1[index],
                color: ColorRes.blackColor,
                fontSize: 15,

              ),
            ),
          ],
        ),
      ],
    );

  }
}
