import 'package:ChaiChod/export.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:flutter/cupertino.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> listTitle = [
    'goodyear1',
    'goodyear2',
    'goodyear3',
    'goodyear4',
    'goodyear1',
    'goodyear2',
    'goodyear3',
    'goodyear4'
  ];

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
                  child: Text(StringRes.favorites,
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
//              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // CommonView.backArrowAndTitle(context, StringRes.favorites, ColorRes.blackColor),

                  gridImage(),
                  SizedBox(height: 20),
                ],
              ),
            )),
      ),
    );
  }

  //grid image are show grid view in details
  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listTitle.length,
      padding: EdgeInsets.only(left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.72
          // childAspectRatio: Utils.getDeviceWidth(context) /
          //     (Utils.getDeviceHeight(context) / 1.27),
          ),
      itemBuilder: (context, index) {
        return InkResponse(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen()),
              );
            } else if (index == 1) {
            } else if (index == 2) {
            } else if (index == 3) {
            } else if (index == 4) {}
          },
          child: Container(
            // height: 150,
            padding: EdgeInsets.only(left: 8, right: 8),
            color: ColorRes.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(image: AssetImage(Utils.getAssetsImg('tiers'))),
                Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AllText(
                      "GOODYEAR",
                      color: ColorRes.blackColor,
                    ),
                    AllText(
                      "Tires 225/45/R17",
                      color: ColorRes.blackColor,
                    ),
                    AllText(
                      "\$2,000 /len.",
                      color: ColorRes.blackColor,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
