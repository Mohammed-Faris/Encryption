import 'package:flutter/material.dart';
import 'package:storagesecure/constants/constant.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({super.key, required this.btnText, required this.btnFun});

  final String btnText;
  final btnFun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => btnFun(),
        style: getBtnStyle(context),
        child: Text(btnText, style: const TextStyle(color: Colors.white)));
  }

  getBtnStyle(context) => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius / 2),
      backgroundColor: btnText == 'Delete Data'
          ? const Color.fromARGB(255, 180, 12, 0)
          : primaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      fixedSize: Size(MediaQuery.of(context).size.width - 40, 47));
}
