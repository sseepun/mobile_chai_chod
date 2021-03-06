import 'package:ChaiChod/export.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File image;
  @override
  void initState() {
    super.initState();
  }
 
  //image picker use in get the images in gallery
  void openGallery() async {
    var i = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (i != null) {
      setState(() {
        image = i;
      });
    }
  }

  //image picker use in get the images in camera
  void openCamera() async {
    var i = await ImagePicker.pickImage(source: ImageSource.camera);
    if (i != null) {
      setState(() {
        image = i;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController soiController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController subDistrictController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  String name;
  String shopName;
  String tax;
  String address;
  String soi;
  String province;
  String district;
  String subDistrict;
  String postalCode;


  @override
  Widget build(BuildContext context) {
 /*   return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
//              textTitle(),
              CommonView.backArrowAndTitle(context, StringRes.editProfile, ColorRes.blackColor),

              SizedBox(height: 20),
              uploadImage()
            ],
          ),*/
    return Container(
        color: ColorRes.whiteColor,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // here the desired height
          child: AppBar(
            elevation: 0.0,
            leading: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20, left: 5),
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
              child: Text(StringRes.editProfile,
                  style: TextStyle(color: ColorRes.blackColor)),
            ),
            backgroundColor: Colors.white,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
            centerTitle: true,
          ),
        ),

        backgroundColor: ColorRes.whiteColor,
        body: SingleChildScrollView(
          child: new Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
//              textTitle(),
//                 CommonView.backArrowAndTitle(context, StringRes.editProfile, ColorRes.blackColor),

                uploadImage(),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      nameTextFiled(),
                      SizedBox(height: 5),
                      shopNameTextFiled(),
                      SizedBox(height: 5),
                      taxIdTextFiled(),
                      SizedBox(height: 5),
                      addressTextFiled(),
                      SizedBox(height: 5),
                      soiTextFiled(),
                      SizedBox(height: 5),
                      provinceTextFiled(),
                      SizedBox(height: 5),
                      districtTextFiled(),
                      SizedBox(height: 5),
                      subDistrictTextFiled(),
                      SizedBox(height: 5),
                      postalCodeTextFiled(),
                      SizedBox(height: 20),
                      recordButton(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ),);
  }

  textTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
                onTap: () {
                  navigatorPop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.black,
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: AllText(
              StringRes.editProfile,
              color: ColorRes.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  //upload image use in set the images are gallery and camera
  uploadImage() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                padding: EdgeInsets.only(top: 25),
                child: image == null
                    ? new Container(
                  height: 150,
                  width: 150,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(Utils.getAssetsImg('profile')),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.all(const Radius.circular(100)),
                  ),
                )
                    : setImageView(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                onPressed: () {
                  showSelectionDialog();
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          AllText(
                            '- Edit pictures',
                            letterSpace: 1.0,
                            fontSize: 20,
                            color: ColorRes.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //_showSelectionDialog are use in click edit profile and show dialog
  void showSelectionDialog() {
    BuildContext dialogContext;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        openGallery();
                        Navigator.pop(dialogContext);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        openCamera();
                        Navigator.pop(dialogContext);
                      },
                    )
                  ],
                ),
              ));
        });
  }

 setImageView() {
      return new Container(
        height: 150,
        width: 150,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(image.path),
            fit: BoxFit.cover,
          ),
           shape: BoxShape.circle
        ),
      );
  }

  nameTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'Name',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: nameController,
            validator: validateName,
            autofocus: false,
            onSaved: (String val) {
              name = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Mark Joley',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  shopNameTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'ShopName',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: shopNameController,
            validator: validateShopName,
            autofocus: false,
            onSaved: (String val) {
              shopName = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Nutchayacha',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  taxIdTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'Tax ID Number',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: taxController,
            validator: validateTaxId,
            autofocus: false,
            onSaved: (String val) {
              tax = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: '110392104012',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  addressTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'Address',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: addressController,
            validator: validateAddress,
            autofocus: false,
            onSaved: (String val) {
              address = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: '999/9',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top:8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  soiTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'Soi',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: soiController,
            validator: validateSoi,
            autofocus: false,
            onSaved: (String val) {
              soi = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'EEE',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  provinceTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 15,bottom: 30
          ),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 5,top: 5
                ),
                child: AllText(
                  'Province',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 5, left: 210),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: provinceController,
            validator: validateProvince,
            autofocus: false,
            onSaved: (String val) {
              province = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Bangkok',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  districtTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 5,top: 5
                ),
                child: AllText(
                  'District',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 5, left: 220),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                ),
              ),
            ],
          ),

        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: districtController,
            validator: validateDistrict,
            autofocus: false,
            onSaved: (String val) {
              district = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Bueng kum',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  subDistrictTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 5,top: 5
                ),
                child: AllText(
                  'Sub-District',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 5, left: 189),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                ),
              ),
            ],
          ),

        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: subDistrictController,
            validator: validateSubDistrict,
            autofocus: false,
            onSaved: (String val) {
              subDistrict = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Navwamin',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  postalCodeTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: AllText(
                  'Postal Code',
                  fontSize: 15,
                  color: ColorRes.greyColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 10),
          child: TextFormField(
            controller: postalCodeController,
            validator: validatePostalCode,
            autofocus: false,
            onSaved: (String val) {
              postalCode = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: '10330',
              hintStyle: TextStyle(
                color: ColorRes.blackColor,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 20),
            ),
          ),
        ),
      ],
    );
  }

  recordButton() {
    return Container(
      color: ColorRes.primaryColor,
//        alignment: Alignment.bottomCenter,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {
          _validateInputs();
        },
        child: Text(
          'Record',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }

  String validateName(String value) {
    if (value.isEmpty)
      return 'Please enter your name';
    else
      return null;
  }

  String validateShopName(String value) {
    if (value.isEmpty)
      return 'Please enter shop name';
    else
      return null;
  }

  String validateTaxId(String value) {
    if (value.isEmpty)
      return 'Please enter taxId number';
    else
      return null;
  }

  String validateAddress(String value) {
    if (value.isEmpty)
      return 'Please enter address';
    else
      return null;
  }


  String validateSoi(String value) {
    if (value.isEmpty)
      return 'Please enter soi';
    else
      return null;
  }


  String validateProvince(String value) {
    if (value.isEmpty)
      return 'Please enter province';
    else
      return null;
  }


  String validateDistrict(String value) {
    if (value.isEmpty)
      return 'Please enter district';
    else
      return null;
  }


  String validateSubDistrict(String value) {
    if (value.isEmpty)
      return 'Please enter sub district';
    else
      return null;
  }


  String validatePostalCode(String value) {
    if (value.isEmpty)
      return 'Please enter postal code';
    else
      return null;
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }
}
