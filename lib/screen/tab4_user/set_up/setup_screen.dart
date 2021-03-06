import 'package:ChaiChod/export.dart';


class SetUpScreen extends StatefulWidget {
  @override
  _SetUpScreenState createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  final controller = PageController();

  //list of icons
  List<IconData> icons = [
    Icons.location_on,
    Icons.translate,
    Icons.track_changes
  ];

  //list of string List
  List<String> stringList = [
    'Address',
    'Language',
    'Change password',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
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
              child: Text(StringRes.setUp,
                  style: TextStyle(color: ColorRes.blackColor)),
            ),
            backgroundColor: Colors.white,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
            centerTitle: true,
          ),
        ),

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              // CommonView.backArrowAndTitle(context, StringRes.setUp, ColorRes.blackColor),
              //
              // SizedBox(height: 20),

              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listData(index);
                  }),
            ],
          ),
        ),
      ),
        ), );
  }

  textTitle() {
    return Container(
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 120),
              child: AllText(
                StringRes.setUp,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }

  listData(int index) {
    return InkResponse(
      onTap: () {
        if(index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressScreen()),
          );
        } else if(index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Language()),
          );
        } else if(index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>ChangePassword
              ()),
          );
        }
      },
      child:Container(
          height: 55,
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                offset: Offset(0.5, 0.5),
                color: ColorRes.greyColor,
                blurRadius: 0.5,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        color: ColorRes.lightBlur,
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      child:Icon(icons[index],
                          size: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0, left: 10),
                    child: Text(
                      stringList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
