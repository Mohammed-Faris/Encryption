import 'package:flutter/material.dart';
import 'package:storagesecure/components/app_bar.dart';
import 'package:storagesecure/components/primary_btn.dart';
import 'package:storagesecure/components/spacer.dart';
import 'package:storagesecure/components/text_form_field.dart';
import 'package:storagesecure/constants.dart';
import 'package:storagesecure/constants/constant.dart';
import 'package:storagesecure/localstorage/secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: widget.title),
      body: Center(
          child: Padding(
        padding: kPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.security,
                color: primaryColor,
                size: 100,
              ),
              HeightSpacer(myHeight: kSpacing),
              Text(
                'Storing data securily using flutter secure storage',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kfontSize),
              ),
              HeightSpacer(myHeight: kSpacing * 2),
              TextFormFieldbldr(textEditingController: textEditingController),
              HeightSpacer(myHeight: kSpacing * 2),
              PrimaryBtn(
                  btnText: "Store Data",
                  btnFun: () {
                    // Navigator.pushNamed(context, videoPage);
                    SecureStorage()
                        .writeSecureData('name', textEditingController.text);
                  }),
              HeightSpacer(myHeight: kSpacing * 1),
              PrimaryBtn(
                  btnText: "Read Data / Nav to Landscape",
                  btnFun: () {
                    Navigator.pushNamed(context, dataPage);
                    SecureStorage().readSecureData('name');
                  }),
              HeightSpacer(myHeight: kSpacing * 1),
              PrimaryBtn(
                  btnText: 'Delete Data',
                  btnFun: () {
                    SecureStorage().deleteSecureData('name');
                  }),
              HeightSpacer(myHeight: kSpacing * 1),
              PrimaryBtn(
                  btnText: 'Video Playback',
                  btnFun: () {
                    Navigator.pushNamed(context, videoPage);
                  }),
              HeightSpacer(myHeight: kSpacing * 1),
              PrimaryBtn(
                  btnText: 'Expandable list',
                  btnFun: () {
                    Navigator.pushNamed(context, Expandpage);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
