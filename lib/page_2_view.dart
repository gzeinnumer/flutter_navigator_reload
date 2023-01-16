import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  static const String TAG = "Page2View";
  String args;
  Page2View(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context,"Dari Page 2");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page2"),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text(args)
            ],
          ),
        );
      }
    );
  }
}
