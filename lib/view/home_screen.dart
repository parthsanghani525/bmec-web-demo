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
  String? userKay = '';
  String? siteKay = '';

  @override
  void initState() {
    super.initState();
  }

  void getParams() {
    var uri = Uri.dataFromString(window.location.href);
    print("getCurrentUri -------- > $uri");
    Map<String, String> params = uri.queryParameters;
    userKay = params['userkey'];
    siteKay = params['siteKey'];
    setState(() {
    });
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
            customTextField(
                readOnly: true,
                hintText: userKay == null
                    ? "UserKay is null"
                    : "UserKay : " + userKay!),
            const SizedBox(
              height: 10,
            ),
            customTextField(
                readOnly: true,
                hintText: siteKay == null
                    ? "SiteKay is null"
                    : "SiteKay : " + siteKay!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          widget.getValue!();
          await Future.delayed(const Duration(milliseconds: 1000), (){getParams();});

        },
        tooltip: 'Counter',
        child: Icon(Icons.add),
      ),
    );
  }
}
