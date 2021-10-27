import 'dart:html';
import 'dart:ui' as ui;
import 'package:bmec_flutter_web_demo/utils/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.urlData, this.getValue}) : super(key: key);
  final String? urlData;
  final ui.VoidCallback? getValue;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userKay = TextEditingController();
  TextEditingController siteKay = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void getParams() {
    /// get value from url
    var uri = Uri.dataFromString(window.location.href);
    print("getCurrentUri -------- > $uri");
    Map<String, String> params = uri.queryParameters;

    ///set the value to textfield
    userKay.text = params['userkey'] ?? "";
    siteKay.text = params['siteKey'] ?? "";
    setState(() {});
    print('userkeys =======>  ${userKay}');
    print('siteKey =======>  ${siteKay}');
    /*if (userKay == null) {
      getParams();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    getParams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customTextField(readOnly: false, controller: userKay),
            const SizedBox(
              height: 10,
            ),
            customTextField(readOnly: false, controller: siteKay),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //get value from URL
          widget.getValue!();
          await Future.delayed(const Duration(milliseconds: 1000), () {
            getParams();
          });
        },
        tooltip: 'Counter',
        child: Icon(Icons.add),
      ),
    );
  }
}
