import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../manage_profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File _image;

  void _openGallery() async {
    var i = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (i != null) {
      setState(() {
        _image = i;
      });
    }
  }

  void _openCamera() async {
    var i = await ImagePicker.pickImage(source: ImageSource.camera);
    if (i != null) {
      setState(() {
        _image = i;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          ),
        ),
      ),
    );
  }

  textTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageProfileScreen()),
                  );
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

  uploadImage() {
    return  Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                padding: EdgeInsets.only(top: 25),
                child: _image == null
                    ? new Image.asset(
                  Utils.getAssetsImg('profile'),
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                )
                    : _setImageView(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                onPressed: () {
                  _showSelectionDialog();
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          AllText(
                            'Upload Logo',
                            letterSpace: 1.0,
                            fontSize: 20,
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
  void _showSelectionDialog() {
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
                        _openGallery();
                        Navigator.pop(dialogContext);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera();
                        Navigator.pop(dialogContext);
                      },
                    )
                  ],
                ),
              ));
        });
  }
  Widget _setImageView() {
    if (_image != null) {
      return new Container(
        height: 100,
        width: 100,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(_image.path),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Text("Please select an image");
    }
  }
}
