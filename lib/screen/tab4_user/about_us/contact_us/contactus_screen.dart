import 'package:ChaiChod/export.dart';
import 'package:flutter/cupertino.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final controller = PageController();

  List<String> images = [
    Utils.getAssetsImg('facebooklogo'),
    Utils.getAssetsImg('linelogo'),
    Utils.getAssetsImg('emaillogo'),
    Utils.getAssetsImg('calllogo'),
  ];

  List<String> stringList1 = [
    'Facebook',
    'LINE',
    'Email',
    'Tel No.',
  ];

  List<String> stringList2 = [
    'facebook/chaichod',
    '@chaichod',
    'chaichod@gmail.com',
    '02-301-2312',
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
                  CommonView.backArrowAndTitle(context, StringRes.contactUs, ColorRes.whiteColor),

                  /* Container(
                margin:
                    EdgeInsets.only(top: 80, left: 10, right: 10, bottom: 10),
                child: contactDetails(),
              ),*/
                SizedBox(height: 15),

                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    color: ColorRes.whiteColor,
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return listData(index);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                    decoration: BoxDecoration(
                        color: ColorRes.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: description(),
                  )
                ],
              ),


               /*Container(
                margin: EdgeInsets.only(
                    top: 370, left: 10, right: 10, bottom: 10),
                child: descriptionContainer(),
              )*/
             /* Container(
                margin: EdgeInsets.only(top: 380),
                child: description(),
              ),*/
            ],
          ),
        ),
      ),
    );
  }


  //contact details design
  listData(int index) {
    return Column(
      children: <Widget>[

        Divider(
          height: 1,
          color: ColorRes.greyColor,
        ),

        Container(
            height: 60,
            color: Colors.white,
            /* decoration: new BoxDecoration(
               boxShadow: [
                new BoxShadow(offset: Offset(1.0, 0.3), color: Colors.black12),
              ],
            ),*/
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                /*Divider(
                  height: 1,
                  color: ColorRes.lightWhite,
                ),*/
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 45,
                  height: 45,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(images[index], height: 25, width: 25),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        stringList1[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        stringList2[index],
                        style: TextStyle(
                          color: ColorRes.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )),
      ],
    );
  }

  descriptionContainer() {
    return Container(
      alignment: Alignment.center,
      height: 280,
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(offset: Offset(0.1, 0.1), color: Colors.black12),
        ],
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.white,
      ),
    );
  }

  description() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 15, bottom: 15),
          child: CommonView.logoImage(220, 80),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          child: AllText(
            StringRes.description,
            color: ColorRes.blackColor,
            fontSize: 15,
          ),
        ),
      ],
    ));
  }
}
