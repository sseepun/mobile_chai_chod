import 'package:ChaiChod/export.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';

import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.bgColor,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitle(
            context, StringRes.favorites, 
            bgColor: ColorRes.bgColor
          ),
          backgroundColor: ColorRes.bgColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                gridImage(),
                SizedBox(height: 15),
              ],
            ),
          )
        ),
      ),
    );
  }

  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      padding: EdgeInsets.only(left: 15, right: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.69
      ),
      itemBuilder: (context, index) {
        return InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()),
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: ColorRes.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage(Utils.getAssetsImg('tiers')),
                    width: 200,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "GOODYEAR",
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.productNameStyle,
                      ),
                      Text(
                        "ยางรถยนต์ 225/45/R17",
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.productDescStyle
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: <Widget> [
                          Text(
                            "\$2,000",
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.productPriceStyle,
                          ),
                          Text(
                            " /เส้น",
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.productUnitStyle,
                          )
                        ]
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  
}
